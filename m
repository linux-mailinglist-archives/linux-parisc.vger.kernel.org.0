Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9065647C749
	for <lists+linux-parisc@lfdr.de>; Tue, 21 Dec 2021 20:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhLUTQJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 Dec 2021 14:16:09 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:29234 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229659AbhLUTQJ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 Dec 2021 14:16:09 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197730202F5A3F9
X-CM-Envelope: MS4xfDqTpM7SglclX+ekkREC8SiDZDgdD9P1SfFXKtqokEYjvOuY8jabB/Q7cxFIln+PXRKJm9Hy4kW8x9t9awmxBL9GKGKClkiEZkAYlitCL3XiDInngW1U
 EenTyvjW2zplWGCreu3Vl5b1F3RhDayyAmQ7XomXhLscrhfN4mZ2S6xfBT/k3/jXKu/SAsCinxvuEaEvDwFIZnq+cHhLnFTxnyXiJyXlEviYEbfj04j9UBaA
 YbQ+pqzx2FD/2hiSMuFYYVmh2MRqEqo+pwTCSL78f++ZrnNXpvf3/jupkz18ihV1ghhoaZRWWbMPIifVyYvTL5qci6CJayl1TaYkpHYtrOWkservwOt18G7k
 UBHe17OKf2DwA24KEaiTCJoSvVJwl9mrOMBw0aycLl8w5PK9Mmw=
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61c227f2
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=LUfp8THhzG2EAFAvkHkA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197730202F5A3F9; Tue, 21 Dec 2021 14:16:02 -0500
Message-ID: <16f3eac7-436d-5aba-8dd8-00825480c9e3@bell.net>
Date:   Tue, 21 Dec 2021 14:16:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] parisc: Correct completer in lws start
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <44843798-7888-345f-84b6-f961960867fa@bell.net>
 <2611217.mvXUDI8C0e@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <2611217.mvXUDI8C0e@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-21 1:29 p.m., Rolf Eike Beer wrote:
> Am Dienstag, 21. Dezember 2021, 19:21:22 CET schrieb John David Anglin:
>> Correct completer in lws start.
>>
>> The completer in the "or,ev   %r1,%r30,%r30" instruction is reversed, so we
>> are not clipping the LWS number when we are called from a 32-bit process
>> (W=0). We need to nulify the depdi instruction when the least-significant
>> bit of %r30 is 1.
> I'm curious: what effect has this bug? Since this is syscall code I guess it
> can somehow be exposed from userspace, but how?
I believe the LWS code will branch to an incorrect location in the kernel if the value is not clipped
on a 64-bit kernel.

#ifdef CONFIG_64BIT
         ssm     PSW_SM_W, %r1
         extrd,u %r1,PSW_W_BIT,1,%r1
         /* sp must be aligned on 4, so deposit the W bit setting into
          * the bottom of sp temporarily */
         or,od   %r1,%r30,%r30

         /* Clip LWS number to a 32-bit value for 32-bit processes */
         depdi   0, 31, 32, %r20
#endif

         /* Is the lws entry number valid? */
         comiclr,>>      __NR_lws_entries, %r20, %r0
         b,n     lws_exit_nosys

         /* Load table start */
         ldil    L%lws_table, %r1
         ldo     R%lws_table(%r1), %r28  /* Scratch use of r28 */
         LDREGX  %r20(%sr2,r28), %r21    /* Scratch use of r21 */

         /* Jump to lws, lws table pointers already relocated */
         be,n    0(%sr2,%r21)

Note that the comiclr instruction only checks the least significant 32 bits, but the LDREGX
instruction uses all 64 bits of %r20.

You can see how gcc setups up %r20 in linux-atomic.c.  On PA 2.0 machines, there are ways
for 32-bit processes to set the most significant 32 bits in a register.  So, a user process could
crash the machine if it deliberately did a LWS call with the upper 32-bits of %r20 nonzero.

Currently, only glibc and gcc generate LWS calls.

Dave

-- 
John David Anglin  dave.anglin@bell.net


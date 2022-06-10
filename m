Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C8C546C37
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Jun 2022 20:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347192AbiFJSS2 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Jun 2022 14:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346557AbiFJSS2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Jun 2022 14:18:28 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F369CF826B
        for <linux-parisc@vger.kernel.org>; Fri, 10 Jun 2022 11:18:25 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [64.229.209.22]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6296A35D01D9C166
X-CM-Envelope: MS4xfKV/usUSVlsj288z/6Y9nHUIdvQbLYEBlzIf9IdINRPPM115fE9CaIjuK1C449vlcrm6ywo6QgpMMzCwPlxaV0b4ZEc7BL5+T251+d5kXi7C/4wsXOb5
 XdCmgPz85PADzES3AG8C9p+ww5ax2fuTENw8+KjUkkoTctHxLdmTh3OV7DyrgiLOylZYrhcONikuU+bZxdHIzAL9pyHvNwjo+hyWZMn6ZyVs3kU1JS9kSYYY
 brzqiz8C3w08wLSzNyBTSu7712WCIPnG1k0gDbg6rtQoDPS0kc9QvGGlvdCcnmPHP07ORToOTguWLdW/WWK3LT+dTtQxe2i5VpqlaUlVPwE=
X-CM-Analysis: v=2.4 cv=FMx4e8ks c=1 sm=1 tr=0 ts=62a38ae9
 a=PzUcMIm+zPr1bDMlhKZIxQ==:117 a=PzUcMIm+zPr1bDMlhKZIxQ==:17
 a=r77TgQKjGQsHNAKrUKIA:9 a=FBHGMhGWAAAA:8 a=qT3U_4Zh8-Ffl2r-W-sA:9
 a=QEXdDO2ut3YA:10 a=-OCGrLeyKfsu9YLd8L8A:9 a=B2y7HmGcmWMA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (64.229.209.22) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6296A35D01D9C166; Fri, 10 Jun 2022 14:18:17 -0400
Content-Type: multipart/mixed; boundary="------------peMODtnHCWgwrCbK0otdPzHB"
Message-ID: <76323d1a-114b-2cf7-2f4a-05612b28c9e2@bell.net>
Date:   Fri, 10 Jun 2022 14:18:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux v5.18.3 fails to boot
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Kuniyuki Iwashima <kuniyu@amazon.com>
Cc:     deller@gmx.de, kuniyu@amazon.co.jp, linux-parisc@vger.kernel.org
References: <07d91863-dacc-a503-aa2b-05c3b92a1e39@bell.net>
 <20220610160624.95035-1-kuniyu@amazon.com>
 <7beb6e90-4532-cba2-8121-4cfc413f4d3f@bell.net>
In-Reply-To: <7beb6e90-4532-cba2-8121-4cfc413f4d3f@bell.net>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a multi-part message in MIME format.
--------------peMODtnHCWgwrCbK0otdPzHB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022-06-10 12:49 p.m., John David Anglin wrote:
>> The commit was added to prevent compiler optimisation from splitting
>> read/write operations.  I think it can lead in a change in opcodes but
>> must be safe.  So I'm not sure why the commit causes boot failure for now.
> Neither am I.
>>
>> I'm not familiar with PARISC and this may be a stupid question though,
>> what does `ldd` exactly do? and which line is it executed in the func/file?
> ldd performs a 64-bit load to register rp (r2).  It is part of mpt_reply's epilogue.
> The prior "sync" instruction corresponds to the "mb()" at the end of mpt_reply.
>
> I would have thought this code should have been write protected.  It seems
> CONFIG_STRICT_MODULE_RWX is not explicitly set in config:
>
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> CONFIG_STRICT_KERNEL_RWX=y
>
> I think I need to try enabling CONFIG_STRICT_MODULE_RWX.
With CONFIG_STRICT_MODULE_RWX, the fault went away and the system boots normally.

To enable CONFIG_STRICT_MODULE_RWX, I needed to add attached patch to Kconfig.

As far as I can tell, this only affects patch_map in the parisc backend:

static void __kprobes *patch_map(void *addr, int fixmap, unsigned long *flags,
                                  int *need_unmap)
{
         unsigned long uintaddr = (uintptr_t) addr;
         bool module = !core_kernel_text(uintaddr);
         struct page *page;

         *need_unmap = 0;
         if (module && IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
                 page = vmalloc_to_page(addr);
         else if (!module && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
                 page = virt_to_page(addr);
         else
                 return addr;

Possibly, this might affect Fusion MPT base driver but no patches are applied:

[   29.971295] mptbase alternatives: applied 0 out of 3 patches
[   29.971295] Fusion MPT base driver 3.04.20
[   29.971295] Copyright (c) 1999-2008 LSI Corporation
[   29.971295] Fusion MPT SPI Host driver 3.04.20

Dave

-- 
John David Anglin  dave.anglin@bell.net

--------------peMODtnHCWgwrCbK0otdPzHB
Content-Type: text/plain; charset=UTF-8; name="Kconfig.patch"
Content-Disposition: attachment; filename="Kconfig.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL0tjb25maWcgYi9hcmNoL3BhcmlzYy9LY29uZmln
CmluZGV4IGJkMjI1Nzg4NTlkMC4uZjNhMjA0NGVlNDAyIDEwMDY0NAotLS0gYS9hcmNoL3Bh
cmlzYy9LY29uZmlnCisrKyBiL2FyY2gvcGFyaXNjL0tjb25maWcKQEAgLTEwLDYgKzEwLDcg
QEAgY29uZmlnIFBBUklTQwogCXNlbGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMKIAlz
ZWxlY3QgQVJDSF9IQVNfRUxGX1JBTkRPTUlaRQogCXNlbGVjdCBBUkNIX0hBU19TVFJJQ1Rf
S0VSTkVMX1JXWAorCXNlbGVjdCBBUkNIX0hBU19TVFJJQ1RfTU9EVUxFX1JXWAogCXNlbGVj
dCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEwKIAlzZWxlY3QgQVJDSF9IQVNfUFRFX1NQ
RUNJQUwKIAlzZWxlY3QgQVJDSF9OT19TR19DSEFJTgo=

--------------peMODtnHCWgwrCbK0otdPzHB--

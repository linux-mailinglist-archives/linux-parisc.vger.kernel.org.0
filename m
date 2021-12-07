Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D65B46C719
	for <lists+linux-parisc@lfdr.de>; Tue,  7 Dec 2021 23:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241502AbhLGWLX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 7 Dec 2021 17:11:23 -0500
Received: from mta-tor-002.bell.net ([209.71.212.29]:63906 "EHLO
        cmx-torrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S241827AbhLGWLX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 Dec 2021 17:11:23 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197A9B101ABA0F4
X-CM-Envelope: MS4xfNQg9ETCf2eZ++z/I8UHteTrUvWyEBS/Lep3J1yh7OdC253KRa5p0OiYgy5oPUz9iOoP7yGnSok5EenJTIeoo3K7gZqTznvhieD1CfvxVcJnouSftovn
 iHXWMrTkkUn4xZhNZFAre0eUd+zX0u9Bgo5busa/HeNy9ijymHR+hYnRmMMnjJv8OeViRDaGOFDPIcl6b/pZ0uteafHaj15lZ9wlvB3/PJuJMzB8iAA74AcR
 rjN3LQo5fFqWUJKb5kH+I7434cNwzoE7Q7O163NRQX8=
X-CM-Analysis: v=2.4 cv=f44ruM+M c=1 sm=1 tr=0 ts=61afdb37
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=GSXnk10e5J79XGs1CaYA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197A9B101ABA0F4; Tue, 7 Dec 2021 17:07:51 -0500
Message-ID: <a5eef9c4-8e0d-95e8-0c3d-0d0052d8edae@bell.net>
Date:   Tue, 7 Dec 2021 17:07:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-05 3:46 p.m., Helge Deller wrote:
>>   10574:       43 ff ff 40     ldb 1fa0(sr3,r31),r31
> This IIR is strange. We most likely don't touch userspace at this stage
> when the kernel boots, and...
I'm thinking IIR is sometimes unreliable.  I see the same value printed for the tst-minsigstksz-5 fault
yet the actual fault instruction was "ldi 1,r25".

Dave

-- 
John David Anglin  dave.anglin@bell.net


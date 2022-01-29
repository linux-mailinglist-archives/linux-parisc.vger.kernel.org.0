Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210DC4A30C2
	for <lists+linux-parisc@lfdr.de>; Sat, 29 Jan 2022 17:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352789AbiA2QoG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 29 Jan 2022 11:44:06 -0500
Received: from mout.gmx.net ([212.227.15.15]:49103 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243327AbiA2QoF (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 29 Jan 2022 11:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643474611;
        bh=loleVrdL8FOXm5Nyx2GQarQzIdTlxj8ayQCxXLl+Myk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Bfzu/pOaEYrr/7/24zFZtTMj/C7eUlB+h43f9V13JIr1cgA9qX+41SpyxRlf/Yi0p
         IXbDG+W/JvQvnAd+ziWPN4Pu7CUieeY1qK1PvxQbgKijCQ4bbpDVm4C/hDWw1LOYoc
         4iB/zW7p39P5/Eg6AaTUr8Su3nMdjyvaYtG57yfI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.251]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1mnciv3XKV-00RJPn; Sat, 29
 Jan 2022 17:43:30 +0100
Message-ID: <a4da36f3-2a7a-5f6c-0f4c-252977e12a75@gmx.de>
Date:   Sat, 29 Jan 2022 17:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] parisc: Add initial vDSO support
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Randolph Chung <randolph@tausq.org>
References: <20220129110342.50853-1-deller@gmx.de>
 <11912593.O9o76ZdvQC@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <11912593.O9o76ZdvQC@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y9AKP507yT7MEVdFvckgChQ21O2gHgX7ytxSJBqPwz8qiBnCH02
 ypyZ1uzRueof7/06dnip4CoC39kB+R79/NkRB5JMJbQoU327ZErmKt3zF7sZCt13hhrZUJ5
 pvqaD7qg1ZYrd1kyYYc7LHEfCWGBC6ktH5aF4S76BhDO3XzV08jIPsHX8FG916dco/lexDD
 FYp+wWAKXNBWOqGH/T5ZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q5FtIRvzNlI=:foAnUzUzHjzs089sbjE+jy
 BE32HSlyqvZiBoxyyuJj3eRa2lCXTdKrsr8iucRz8+kjNAyW8rESxvY3tKuBo4lx3dmqLIdP4
 VEH/oJaX93Ua4+ye5sCrJSAhV0hYS8LLdNQo2JuDBJorZljdpoOMiE9cTaiFeL+/CMYmXPADh
 AB3TnGJt3zIkGH+Zv0HF6ZCdBOQdPlRCUes7Sk2zC1mMMdRQAzK3jH7IgmW60eC1/R33Br30I
 Z1lTO7YOHEes0hApyDU0c3rCKwwb7jXjMcSllnh56njOHOYLy4RUjLX1j7bEJQI7SA+GELLQG
 5vo0ZIoA3ITogz5790A8LFJRuGGNVzobJKr1/wwfwTjtYwyffsZv43tSLLITpaUK0kEwJZH3Q
 efyjIdN4xj8dVzgZIIqLeRd+xAG4gmEpz3UoJ9Gtz0Q1W5gkdrs4PlcFGGqZrItsVcM436dnc
 5YclRFM6C86U+mytnSxtFCjtarXlwHpP4pn3PffzExvIFDV8omcT5vO5vyQHxr5Elqf+X5FM2
 Uu5T5JsH/sJ1KC7mVNS6MBVtuTP/vvdBIf6cyyzAwSPhM+Gbh1OO7faCbKg1PV5HzAZZ8DkzI
 AuKvplCo9HKcZFVAJDHciBRRlya0IH0UpNKAhNfQDKdROwmW0ODZwUvaMIU8egj9tlR0GCDxA
 0ya8/Glj9aKx25PzSLIkMMTS9rxGpoV/PeS2WYeAfQcsf7cJxGv37O1FiEtZBnnkJFrDNzNF9
 rJGS0p4+KKe4Aj6OeRNnYljf5C2rHRNIhNr8C4lmkbToCRjtubUB4ITDY9GtLtYTOTmRkGFWw
 rd/lgQlK/mk0brRzmqK4efo/ds8DcIwmhd06AQ9dNH+qRvkxuFtuTcOg4muTi4G5zWB09LU+A
 tp0M0muIxHF+WCq93XmNYuwwJjHZO4a5jBwC4ZpabECr8fgvkIg11YOsp3A0t02MlHh2RwifT
 xX2JY0aSzxdOM7xLhr/2q9xkWs4tvhlEIOkzG+jdpuMYZYj4Mlo5646EUBgyTFHfJGFa3X+7e
 vgTxY6s8/iTMZsxG5RriJ3bZfrtsRKdKl4wSKrgTff/bBTs5NkF5ntEgnGAmluZv9MinB/Sua
 8H7BWocR8P87QY=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Rolf,

On 1/29/22 15:55, Rolf Eike Beer wrote:
> Am Samstag, 29. Januar 2022, 12:03:42 CET schrieb Helge Deller:
>> Add minimal vDSO support, which provides the signal trampoline helpers,=
 but
>> none of the userspace syscall helpers like time functions.
>>
>> The big benefit of this vDSO implementation is, that we now don't need =
an
>> executeable stack any longer. PA-RISC is one of the last architectures =
where
>> an executeable stack was needed in oder to implement the signal trampol=
ines
>> by putting assembly instructions on the stack which then gets executed.
>> With this implementation the kernel will utilize the assembler statemen=
ts
>> in the vDSO page which is mapped into each userspace application instea=
d
>> and just put the pointers to the signal information on the stack.
>> By dropping the need for executable stacks we now avoid running into is=
sues
>> with various applications in Debian which nowadays want non-executable
>> stacks for security reasons. Additionally, alternative stacks are suppo=
rted
>> better as well.
>>
>> This code is based on an initial implementation by Randolph Chung from =
2006:
>> https://lore.kernel.org/linux-parisc/4544A34A.6080700@tausq.org/
>>
>> I did the porting and lifted the code to current code base. Dave fixed =
the
>> unwind code so that gdb and glibc are able to backtrace through the cod=
e. An
>> additional patch to gdb will be pushed upstream by Dave.
>
> There are a few extra newlines in the first few files which you may or m=
ay not
> want to remove.

Thanks for noticing.
I fixed them up now.

> OTOH I would split out the change to mm_context_t into it's own patch, w=
ithout
> adding the vdso_base there. This would reduce the overall size of the ac=
tual
> vdso patch and eases review.

Yes, maybe I'll do that. Not sure yet.

Helge

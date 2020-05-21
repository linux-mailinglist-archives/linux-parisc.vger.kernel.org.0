Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BE31DDA37
	for <lists+linux-parisc@lfdr.de>; Fri, 22 May 2020 00:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730485AbgEUW1T (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 21 May 2020 18:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgEUW1S (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 May 2020 18:27:18 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAA1C061A0E;
        Thu, 21 May 2020 15:27:18 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x15so4199010pfa.1;
        Thu, 21 May 2020 15:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C9teSBt5EFyL1ooxgNCTVzsMAlO1Yd+6XPJLe2ev2bM=;
        b=QMVpK+nWSHcA81lvQeUl04CxBHtTvmTyPcurTeqVanxsrZbAG7fMkPC/fSyIww9prW
         1qyZ/1nTChkdNMgcbC+yJ3rqgzDehQ2pR3IoQVjj/iXSIiBGDMOCOUa8lo81yvRCUsOQ
         6O0+TJwPVJihSh3zXqTxc5goY48Tyv/Ht1nO1WBxfBdWspqGV/Nguth1iKsjt2fKoQEH
         0paOX6yIiGXSvgXQ8iBmFJNKytqOgPrqA+w3JJTp3BG4lDD0D07WyPuOzAFrrrcIzSBk
         SXb3q5n4lVVPNcy0mvogTLq8iglp4xtl1wbyc8yz6rEbxY5ljW+SBkyFSyiKHBQ+/LvU
         4udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=C9teSBt5EFyL1ooxgNCTVzsMAlO1Yd+6XPJLe2ev2bM=;
        b=Fr6xI2oxAwIkcIGHiyarPpKt6veGe0zIXbnlvHzM7MDQHLUt5ERjJz/RtvU0xJU+fl
         IenBSx2MHEslAT3GIjB6lvIo/IEYA/ec2mld/2uSwidDQaLj1mP3StpUZdZf/RpQmVMS
         gBtrwTgjb39mOCAjob+KCYANAaLZq5JbanAkzBly6J4PIfcaBWiGdFkpIo0XgZe1/Fgd
         aos2cpi3rMO5itWF5NyYYBGcB7O7I4fRzCcWUdVM+49RF60DQtw57YApj637DIIDkYBg
         43s5HxeH9o9az+zpRc7fmzQLwB+13ffYOrRd5trhM7z/4Bi3xaSOo3xz4Z/U+6zsmNV5
         IySg==
X-Gm-Message-State: AOAM531d1MePGVZ1k1IGF55L1AxgrjhPD/VDB8p316PdNwrE+MkXpX+8
        XZs9/D8ozmk9/ciRs6ODTXQJX4Z/
X-Google-Smtp-Source: ABdhPJyt5FT8n2wXgmcyHuRPT+yQ5XeQuDpZmuQoitUaabYeW/PwhBp8SoAi3eJOaOMOAdtD5FW/QQ==
X-Received: by 2002:a63:ae0f:: with SMTP id q15mr10607558pgf.72.1590100038028;
        Thu, 21 May 2020 15:27:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p6sm4754021pgl.26.2020.05.21.15.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 15:27:17 -0700 (PDT)
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9088585b-b52f-39ad-1651-53cfc0abd714@roeck-us.net>
Date:   Thu, 21 May 2020 15:27:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 5/21/20 10:42 AM, Ira Weiny wrote:
> On Thu, May 21, 2020 at 09:05:41AM -0700, Guenter Roeck wrote:
>> On 5/19/20 10:13 PM, Ira Weiny wrote:
>>> On Tue, May 19, 2020 at 12:42:15PM -0700, Guenter Roeck wrote:
>>>> On Tue, May 19, 2020 at 11:40:32AM -0700, Ira Weiny wrote:
>>>>> On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
>>>>>> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
>>>>>>> From: Ira Weiny <ira.weiny@intel.com>
>>>>>>>
>>>>>>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
>>>>>>> enables when vaddr is not in the fixmap.
>>>>>>>
>>>>>>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
>>>>>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>>>>>
>>>>>> microblazeel works with this patch,
>>>>>
>>>>> Awesome...  Andrew in my rush yesterday I should have put a reported by on the
>>>>> patch for Guenter as well.
>>>>>
>>>>> Sorry about that Guenter,
>>>>
>>>> No worries.
>>>>
>>>>> Ira
>>>>>
>>>>>> as do the nosmp sparc32 boot tests,
>>>>>> but sparc32 boot tests with SMP enabled still fail with lots of messages
>>>>>> such as:
>>>>>>
>>>>>> BUG: Bad page state in process swapper/0  pfn:006a1
>>>>>> page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
>>>>>> flags: 0x0()
>>>>>> raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
>>>>>> page dumped because: nonzero mapcount
>>>>>> Modules linked in:
>>>>>> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
>>>>>> [f00e7ab8 :
>>>>>> bad_page+0xa8/0x108 ]
>>>>>> [f00e8b54 :
>>>>>> free_pcppages_bulk+0x154/0x52c ]
>>>>>> [f00ea024 :
>>>>>> free_unref_page+0x54/0x6c ]
>>>>>> [f00ed864 :
>>>>>> free_reserved_area+0x58/0xec ]
>>>>>> [f0527104 :
>>>>>> kernel_init+0x14/0x110 ]
>>>>>> [f000b77c :
>>>>>> ret_from_kernel_thread+0xc/0x38 ]
>>>>>> [00000000 :
>>>>>> 0x0 ]
>>>>>>
>>>>>> Code path leading to that message is different but always the same
>>>>>> from free_unref_page().
>>>
>>> Actually it occurs to me that the patch consolidating kmap_prot is odd for
>>> sparc 32 bit...
>>>
>>> Its a long shot but could you try reverting this patch?
>>>
>>> 4ea7d2419e3f kmap: consolidate kmap_prot definitions
>>>
>>
>> That is not easy to revert, unfortunately, due to several follow-up patches.
> 
> I have gotten your sparc tests to run and they all pass...
> 
> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> Build reference: v5.7-rc4-17-g852b6f2edc0f
> 

That doesn't look like it is linux-next, which I guess means that something
else in linux-next breaks it. What is your qemu version ?

Thanks,
Guenter

> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> 
> Is there another test I need to run?
> 
> Ira
> 
> 
>>
>> Guenter
>>
>>> Alternately I will need to figure out how to run the sparc on qemu here...
>>>
>>> Thanks very much for all the testing though!  :-D
>>>
>>> Ira
>>>
>>>>>>
>>>>>> Still testing ppc images.
>>>>>>
>>>>
>>>> ppc image tests are passing with this patch.
>>>>
>>>> Guenter
>>


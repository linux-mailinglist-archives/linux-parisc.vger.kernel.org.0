Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F3A445BB4
	for <lists+linux-parisc@lfdr.de>; Thu,  4 Nov 2021 22:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhKDVib (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 Nov 2021 17:38:31 -0400
Received: from mta-mtl-004.bell.net ([209.71.208.14]:58432 "EHLO
        cmx-mtlrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232202AbhKDVia (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Nov 2021 17:38:30 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C894590AF0E1EF
X-CM-Envelope: MS4xfDGcROXcYzaTZ2mqpbCOcwBr+EQ7SQWaANE0r2CJpuK/tdDu+wKM588vCL9KIzKBRCq3OzVq8SQS/ykR4+8P43pD6X3qPWkfQIuO3GQcFFtfWw0gqyNi
 cmg8SHzF5NRzDKgPFkq3BIqARN/9y+W+wKOiNP/y0rWB899ZLritTBuKesu3Mfl5RqpEH5dZC+TGE9u+zhe/EART54R+/DNNDSVNQQSaYY2Wu7yQbxhSecm6
 WAApb2pt7yNip64SVQnAX6ghIFiJtCuAriLgRLGGjCkAUhokIWPffvdcd+3ABxV5dmSimJBqNyfIXWnDOpcDqo1IeTp4oi7dvcH1olvsGEoEwX6CrKEeX0VO
 s8TfmfAZ
X-CM-Analysis: v=2.4 cv=ENdlb3VC c=1 sm=1 tr=0 ts=61845233
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=FBHGMhGWAAAA:8 a=TD7FyfS174xlg3LSZ2cA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C894590AF0E1EF; Thu, 4 Nov 2021 17:35:47 -0400
Message-ID: <784c925c-bc69-1eeb-05cb-b0ba218a6b8e@bell.net>
Date:   Thu, 4 Nov 2021 17:35:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] parisc: Fix code/instruction patching on PA1.x machines
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Sven Schnelle <svens@stackframe.org>
References: <YX8HK7ZZZhjRQzcr@ls3530>
 <91b3d125-18ae-e10f-3000-1b17a43a156f@bell.net>
 <cf2c5fa8-5b98-50b7-00ef-0e86df918e8e@gmx.de>
 <a3568fd4-79be-798e-3078-60b187ddaea7@bell.net>
 <f8a7f1fa-dc97-224b-8726-25bb66653aa3@gmx.de>
 <be51b4df-35df-f0f0-1763-c4421d01bd1d@bell.net>
 <c963c0cd-d364-e873-3b00-ed631c6dc407@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <c963c0cd-d364-e873-3b00-ed631c6dc407@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On 2021-11-04 5:27 p.m., Helge Deller wrote:
> Right, there is a map problem!
> Please ignore this last backtrace I sent.
> I missed to include my previous patch to fix the TLB issue, aka this patch:
>   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=parisc-5.16-1&id=6e866a462867b60841202e900f10936a0478608c
I have this change installed in my tree.  rp3440 boots okay with my patch but I don't have CONFIG_KPROBES set.

Dave

-- 
John David Anglin  dave.anglin@bell.net


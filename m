Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD6949D4E7
	for <lists+linux-parisc@lfdr.de>; Wed, 26 Jan 2022 23:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbiAZWHm (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 26 Jan 2022 17:07:42 -0500
Received: from mta-mtl-001.bell.net ([209.71.208.11]:49912 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiAZWHm (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 26 Jan 2022 17:07:42 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E9B8D0007A79F1
X-CM-Envelope: MS4xfH2MSAQ+t1VmDqEO1ADsiLyWzJLSfroefIHDwPtkLRu/cv4BvC5YC12Hxf4ZArDMcD8RqU8bwGe0SbnqPJxxzAtkLkDGzrl6cTQcGX+OFIj8KC0QiXDy
 xeSropRATBywcZGq4m7mqPUaJ0gV3K3NOwlT3wX6MoqAj38L0dA7WRdHJNChc7FgRq7JtsQpNpJ3qqzKyV+R1OZD+dfbsjmXop0LwBnNiSjUHGZSOgfRx4l3
 IHc8zC78zkGnhH4GlMgrSkxEZs6NM7I5+q+BJm35wgMo03Pokr9jrqlfr4eaGVKDZ4l1yX1lWWeMdipa/ieryfKxv39j5ydKW6o479jh5X4w+sD00DhnwGE/
 etPW/GdJ
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61f1c62b
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=pAd5b2VCI20GS0E8-hoA:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E9B8D0007A79F1; Wed, 26 Jan 2022 17:07:39 -0500
Message-ID: <a578d245-d4a8-95b5-4446-9d98a1ebf655@bell.net>
Date:   Wed, 26 Jan 2022 17:07:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] parisc: Fix data TLB miss in sba_unmap_sg
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YfGxafKxQdw8GhMc@mx3210.localdomain>
 <4ba3aa1c-925b-daae-0216-fc344b81af32@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <4ba3aa1c-925b-daae-0216-fc344b81af32@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-26 4:25 p.m., Helge Deller wrote:
> Will you check the same loop in
> ccio-dma.c:1006 ?
Looks like it has same problem.

Dave

-- 
John David Anglin  dave.anglin@bell.net


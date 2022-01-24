Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35730498723
	for <lists+linux-parisc@lfdr.de>; Mon, 24 Jan 2022 18:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244736AbiAXRld (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 24 Jan 2022 12:41:33 -0500
Received: from mta-mtl-002.bell.net ([209.71.208.12]:53982 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S244717AbiAXRld (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 24 Jan 2022 12:41:33 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61E9B8D00048B7E7
X-CM-Envelope: MS4xfOqSpXJzA4xkDmRVTihTSds5lRpE9cld1ls26vs+Rm/TErBKx6Sfvt4bItPgxO/aJkjbezfFmiSfpvGIB1gpLMnPPni3XOO163EvEuDMoIB7SVVNSCBZ
 QWYi1fVNq4oGWj56Qcut84iNYXNGeeXhlh/uTAwNxY6Hdi4wLN/IDa8xlMLAQrWc20rQGty/Z5rATbtU4skq9w0v6xoOd2YhkWx89CKPfmOpSJWI+QnwgxE3
 Z5RLvNd1Ypj5f5+MNdY5j0FO8lwMiZ98Ze9iaj7lhZQ=
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61eee4c7
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=voySVEkaAysAn6qEEUsA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61E9B8D00048B7E7; Mon, 24 Jan 2022 12:41:27 -0500
Message-ID: <a23a26c3-6760-33e1-a390-5f51b103dd17@bell.net>
Date:   Mon, 24 Jan 2022 12:41:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: pagefaults and hang with 5.15.11
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11891682.O9o76ZdvQC@daneel.sf-tec.de>
 <a42cff7e-d06c-c687-a0a7-6fd781b03aed@bell.net>
 <4372681.LvFx2qVVIh@eto.sf-tec.de> <2615489.mvXUDI8C0e@eto.sf-tec.de>
 <f872b4fc-2d26-5b89-c985-261966c9f49d@bell.net>
In-Reply-To: <f872b4fc-2d26-5b89-c985-261966c9f49d@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-01-24 12:24 p.m., John David Anglin wrote:
> Faulting instruction is "ldw 18(r3),r24".  Address in $r3 (and $r5) seems bad.  Think the sglist argument
> to sba_unmap_sg() is bad.  Don't have a clue as to why this might be.
Maybe try interchanging operands of following &&

         while (sg_dma_len(sglist) && nents--) {

so nents is checked first.

Dave

-- 
John David Anglin  dave.anglin@bell.net


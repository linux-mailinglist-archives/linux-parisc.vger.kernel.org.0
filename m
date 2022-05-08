Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B32851EAC0
	for <lists+linux-parisc@lfdr.de>; Sun,  8 May 2022 03:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbiEHBGX (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 7 May 2022 21:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiEHBGW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 7 May 2022 21:06:22 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D75292705
        for <linux-parisc@vger.kernel.org>; Sat,  7 May 2022 18:02:33 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6276ABD8000D46E5
X-CM-Envelope: MS4xfIpVn9HVZDquTV50XcpK2EO0hcxYdkg9gap+6hhRHVwoYuwHQZLdl8BdaKIJQUXxkmbJS5FNWCYx0B71r3NNJC+NT39AxXQLn1/uKR3k+wbM2sS/D2iJ
 +0R3w/KZGmU4HwhBxpT5kg2ehlo/H88/9XZzKx6YNMtMMQ6ZGGFK1wQT0F/9iJL+drPF5190f4dA4S7eHGyWWZQws7+vbT/q9WW2rzGeAvknSnyv4XzpEcod
 wXBkCfGgQuXj9gG3nOh5/v6JvuDuH73yFzS55GRNPe330bdb01Ycw83iVoiwnIPn
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=6277169e
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=gImVeR_VWKle8ojgjS8A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6276ABD8000D46E5; Sat, 7 May 2022 21:02:22 -0400
Message-ID: <09124333-34f7-94b1-a9ee-76e3c7a99662@bell.net>
Date:   Sat, 7 May 2022 21:02:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Latest PA8800/PA8900 cache flush patch
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>
Cc:     Deller <deller@kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <YmhSJPy1MVBYWSrB@mx3210.localdomain>
 <791a2aee-1a9a-6680-c9d4-438c6b5519a6@gmx.de>
 <2ee9360d-7ddc-8cf1-46c5-b29663e10193@bell.net>
 <0cafa13b-336c-a425-7284-162467349bc9@bell.net>
 <2b28f20d-0183-96a7-463f-492cc972b3fa@gmx.de>
 <418213d7-a306-d3cd-2b78-50f0c96b1b8d@gmx.de>
 <0449745b-f3fd-eb86-31f9-1e26cc8bc0fd@gmx.de>
 <bbc8e524-de3f-f6ee-cc30-0e208ca56ba4@bell.net>
 <5a4f104c-80fb-a70f-23ce-e87bae25c46c@bell.net>
 <5e24be22-35d7-f9ae-7aa0-fd38018fcc98@bell.net>
 <10617c84-75d9-a3f8-21a0-22dee44dbcba@gmx.de>
 <e2c497f9-2fdf-74f3-ff6b-8d91416c8d74@bell.net>
In-Reply-To: <e2c497f9-2fdf-74f3-ff6b-8d91416c8d74@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-05-07 3:18 p.m., John David Anglin wrote:
> On 2022-05-07 2:49 p.m., Helge Deller wrote:
>> Ok, so we now need to find the cause why v5.18-rc crashes...:-(
> Working on it.
Mainline 32bit v5.17 boots okay.  v5.18-rc1 fails.  Looks like another extended regression hunt.

Dave

-- 
John David Anglin  dave.anglin@bell.net


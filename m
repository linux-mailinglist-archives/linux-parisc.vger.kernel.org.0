Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB664D54E2
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Mar 2022 23:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245089AbiCJWxW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Mar 2022 17:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237854AbiCJWxW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Mar 2022 17:53:22 -0500
Received: from cmx-mtlrgo002.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 71F65E98FD
        for <linux-parisc@vger.kernel.org>; Thu, 10 Mar 2022 14:52:20 -0800 (PST)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 621D9CE901648BE4
X-CM-Envelope: MS4xfPfpw6R6MoMO+3Xz/+KNB0nuDeD5TA9cQceStF5F7MK/UuD4DFFJqFHuTOUrl+212IwFLFte3XYYK5H5jobuFd4VqoWW2rO0HqTU2jIoelwI0tPSelH/
 vOVm1bc20mGlpfD7TazjlIaPemOPtrhhSzWCr6MSyorQNlWvl6rp7f7K2a2YPGpnkc3UEJlvJd4SqFqee9ltnXb8OcfXbUe248bFY74VTHI18lq/NkS8YzS2
 iz+bigHNiGRjMsY/JRDwGjh/hqqr+e7W4LTM0XmL1feQTTXKnBx0/9Jeby5jNiaHN9BR0WaSKzxBSDtjqTACvMO517DVavuP8DKtqZ/uQeNmr2rjZz+ju2Nk
 06Tkt4gKeMoY/6IlioyG4oy9r77K6Q==
X-CM-Analysis: v=2.4 cv=aKWTFZxm c=1 sm=1 tr=0 ts=622a811f
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=_yMya56UR72vfMHM47MA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 621D9CE901648BE4; Thu, 10 Mar 2022 17:52:15 -0500
Message-ID: <eccd21ab-773d-273d-b396-a4cb2f4fd2b7@bell.net>
Date:   Thu, 10 Mar 2022 17:52:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] parisc: Fix non-access data TLB cache flush faults
Content-Language: en-US
To:     Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yij4pmK8Yjt7Wh1A@mx3210.localdomain>
 <87fsnp34qh.fsf@x1.stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <87fsnp34qh.fsf@x1.stackframe.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-03-10 3:57 p.m., Sven Schnelle wrote:
> I think the preempt_enable()/disable() calls are no longer
> required. I've added them to fix a bug when the kernel is preempted
> after the mm->context / mfsp(3) compare but as that is now removed
> this shouldn't be required anymore.
Good thought.  I'll test.

Dave

-- 
John David Anglin  dave.anglin@bell.net


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA7D52AB22
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 20:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352344AbiEQSpH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 17 May 2022 14:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243849AbiEQSpG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 17 May 2022 14:45:06 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-001.bell.net [209.71.212.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 683013981A
        for <linux-parisc@vger.kernel.org>; Tue, 17 May 2022 11:45:05 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627B9E56017D1B36
X-CM-Envelope: MS4xfN6fmLFi6GOuMn9tlvf03Nk2ekaXHZqynbWnKkbzMyS+rM7bNCuvloPNd3ByUwEVjTJvWb/MP6a66G9tzyR3qhCGrCsGWJXwlBInifWYpf35Rsurwb9r
 Nr3icOkH0eMgRqm35lEuW5oDGaT2Mgb/ppol0GmdvqvlkiiI3Xa+L5hGDKhfmv2sQbS16w5NcpgWCxXsIPowoVuYxM0L2xBer2BseqgqjsEVd1M6JtNpIfUr
 EK8+WbUOnA78Agx0QG2cg+6I8RnyiaPypxHEaL6eK4ceOfE+PBmWJ7flulQcXmdAJKQT6Ffvp59ENhULL8LXV+1FF0/oD1MedxxwVJYyXSgh/MgJK0hWycsR
 rM3Fqy8rNKqzBv23KX3u5J5JFqV+yA==
X-CM-Analysis: v=2.4 cv=B8zabMhM c=1 sm=1 tr=0 ts=6283ed2a
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=EZJCHw9qSJ482WcfclwA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627B9E56017D1B36; Tue, 17 May 2022 14:44:58 -0400
Message-ID: <5ff4c327-c500-2fb2-2e78-dfcb8fadddef@bell.net>
Date:   Tue, 17 May 2022 14:44:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <aa7e15ff-3e74-1b9d-4d65-235517b26675@bell.net>
 <5ea9b91f-1d64-027a-b00d-53e0ad2302ff@gmx.de>
 <4399477.LvFx2qVVIh@daneel.sf-tec.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <4399477.LvFx2qVVIh@daneel.sf-tec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-05-17 2:28 p.m., Rolf Eike Beer wrote:
>> Moving the get_ptep() back to the original place seems ok, and I'll keep
>> the strange indenting which checkpatch want.
> If its back at the original place then there is no need to change as
> checkpatch will not complain on unmodified lines. If it needs to be moved and
> changed then I would say do it in it's own patch as well.
I moved it forward because there are new references.  Otherwise, a static declaration
is needed.

I wanted the "copy" routines together.

Dave

-- 
John David Anglin  dave.anglin@bell.net


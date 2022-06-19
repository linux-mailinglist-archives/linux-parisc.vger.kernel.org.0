Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75375550ADF
	for <lists+linux-parisc@lfdr.de>; Sun, 19 Jun 2022 15:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236635AbiFSNcT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 19 Jun 2022 09:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbiFSNcS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 19 Jun 2022 09:32:18 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net [209.71.208.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86448BC2A
        for <linux-parisc@vger.kernel.org>; Sun, 19 Jun 2022 06:32:17 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [64.229.209.22]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 629E2A8B025E3EB2
X-CM-Envelope: MS4xfNLaemsoJg0M8y3WUqkBNTdSHQCimy2vl8D5JgiL1blhFG/H2IAWIqvYQiyMLx7OYV4lWeNXKgmbla67cNJiHXwZ4T8RY57lcSHpq3T1izhJENnFWzyk
 Xasbc7bCCHAajOX75oCZ3umclfqdbN3ktH5XMLp+oPvhcOVO0jEIFKNpi4yr0G2M60Gqu6KYL6Tqe9OOmNmodsqAQMCcWdND+sss7EwwLBggnBDDsrF2penw
 M8gloskYVJl5RgikCTYsGAU7qrjCcnQMdhFAlUDI+Twmm4KngFdkYph/O6An7RrsC+AX3CzjADAZtCkFSf3OL5Wud3nv4P5ZUw4cKTa2OMOm4D824mt/mt5e
 NmF/GuKkY7K0hlbZQDNAeA+6rEcsnL7zI3Mf4W3Jnm8zhyndzMg=
X-CM-Analysis: v=2.4 cv=Psnw0yA3 c=1 sm=1 tr=0 ts=62af255a
 a=PzUcMIm+zPr1bDMlhKZIxQ==:117 a=PzUcMIm+zPr1bDMlhKZIxQ==:17
 a=IkcTkHD0fZMA:10 a=gu6fZOg2AAAA:8 a=FBHGMhGWAAAA:8 a=kFISQJDLBAukz4yqPU8A:9
 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=2RSlZUUhi9gRBrsHwhhZ:22
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (64.229.209.22) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 629E2A8B025E3EB2; Sun, 19 Jun 2022 09:32:10 -0400
Message-ID: <0956ac5e-64c2-0b15-ed70-dc88dc51496c@bell.net>
Date:   Sun, 19 Jun 2022 09:32:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] parisc: Fix flush_anon_page on PA8800/PA8900
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
Cc:     Helge Deller <deller@gmx.de>, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <Yq3r2qO//NzJGVlO@mx3210.localdomain>
 <12000710.O9o76ZdvQC@daneel.sf-tec.de>
 <9ba8ebca-9d20-85e0-0184-859e08eaa29c@bell.net>
In-Reply-To: <9ba8ebca-9d20-85e0-0184-859e08eaa29c@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-06-18 9:18 p.m., John David Anglin wrote:
> Shared anonymous mappings only work when the mappings are equivalent or meet the
> requirements for multi reader, single writer.  The problem is we don't in general know what
> mappings are equivalent on PA8800/PA8900 processors.
This change introduced the possibility that shared mappings might not be equivalent on parisc:
https://marc.info/?l=git-commits-head&m=139776619924910&w=2

The shmat() man page describes SHMLBA as follows:

>        SHMLBA Segment low boundary address multiple.  When explicitly specify-
>               ing an attach address in a call to shmat(),  the caller  should
>               ensure  that  the  address is a multiple of this value.  This is
>               necessary on some architectures, in order either to ensure  good
>               CPU  cache  performance  or to ensure that different attaches of
>               the same segment have consistent views  within  the CPU  cache.
>               SHMLBA  is  normally some multiple of the system page size.  (On
>               many Linux architectures, SHMLBA is the same as the system  page
>               size.)

Further, the manpage states:

>        o If  shmaddr  is  NULL,  the  system chooses a suitable (unused) page-
>          aligned address to attach the segment.
>
>        o If shmaddr isn't NULL and SHM_RND is specified in shmflg, the  attach
>          occurs  at  the  address equal to shmaddr rounded down to the nearest
>          multiple of SHMLBA.
>
>        o Otherwise, shmaddr must be a page-aligned address at which the attach
>          occurs.

Thus, shared mappings may not be equivalent and we need to flush all aliases.

Dave

-- 
John David Anglin  dave.anglin@bell.net


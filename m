Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB40529388
	for <lists+linux-parisc@lfdr.de>; Tue, 17 May 2022 00:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244485AbiEPWY5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 16 May 2022 18:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbiEPWYz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 May 2022 18:24:55 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-001.bell.net [209.71.208.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AEA222B244
        for <linux-parisc@vger.kernel.org>; Mon, 16 May 2022 15:24:54 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 627CF32E00FC2E8B
X-CM-Envelope: MS4xfLsrzEk+RYwEU+A99tbL0luNnY84TyLwlDbbGB1yFeY73AU3Y/ejXjRbls6kS+ouKMIpad/qirDHdl5rtBtzq5cStuHb9Q9hROyvbFA7RWKxhph+OZhQ
 8AnHX6i2WOMKN6aYZmxKtEedOYchxFF9HJtrmQZpL/1o2uOUC5bu+4XdLli/q+GBmPfiZ3mds+oM7EjKscci6OICVkBlNwr3KYve6DYCqhV2A3RnzwX701Ni
 iGeOT+4GGv5Qvj2U40OZ+7XOFAUgEGFfspXGUwMHiioHfVxwV6/nNwIzmV85D0cFXzalHFzi3j5RpBfaZnfvxDlmaZFOQqbe76uEfP67iThkbFOUbmqOH17C
 oZY86TJ77yXABczKZPToOM0Tj6I4e4364qsJWX57uGIa9icLdrZjyLNu4CmFokqjanzNHFtM
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=6282cf26
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=lC-XgLSzk2rb3e3yvwoA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 627CF32E00FC2E8B; Mon, 16 May 2022 18:24:38 -0400
Message-ID: <55f60ea5-91ac-1475-43eb-124755b6723c@bell.net>
Date:   Mon, 16 May 2022 18:24:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH, V3] parisc: Rewrite cache flush code for PA8800/PA8900
Content-Language: en-US
To:     Sam James <sam@gentoo.org>, Helge Deller <deller@gmx.de>
Cc:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org, Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YoJqZ2rUA25360Ld@mx3210.localdomain>
 <5568470.DvuYhMxLoT@daneel.sf-tec.de>
 <325ef4bc-5dd3-bae2-e435-c00768f85377@gmx.de>
 <0E5A13A5-8210-4E86-A8D1-4B056062BAF9@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <0E5A13A5-8210-4E86-A8D1-4B056062BAF9@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-05-16 6:09 p.m., Sam James wrote:
>> FWIW, I've done some cleanups to this patch and committed it to my for-next tree.
>> In case it's split up, please use the revised version.
>>
> Should I be testing with for-next (which contains this patch) or for-next-next (which has some smaller bits)?
The change in for-next-next shouldn't affect functionality.  The patch for-next is the one to test.

Dave

-- 
John David Anglin  dave.anglin@bell.net


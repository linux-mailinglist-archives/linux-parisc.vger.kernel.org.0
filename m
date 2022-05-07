Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0859E51E965
	for <lists+linux-parisc@lfdr.de>; Sat,  7 May 2022 21:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiEGTWL (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 7 May 2022 15:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446847AbiEGTWK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 7 May 2022 15:22:10 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-002.bell.net [209.71.212.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 093062B1BC
        for <linux-parisc@vger.kernel.org>; Sat,  7 May 2022 12:18:22 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 62769F170006C4D1
X-CM-Envelope: MS4xfJbwpz7uLzYUCPqBYzrE3O+vznMMgZk1Z6Lm56wQdW5CdyODEyd+yYK+pRYd6aNSR6zvJX88fciTzeg9RhwQNyN9773U7Gi7fYZhr7skzpTIotuvjGNp
 HHBEgI273n6OsPGCt8yD55Txt8oxyTIP9WnOq0E8Hi1stLl6U7VCi6bIJqjqL2dS+5YA27TsOMbAJzA5J4WstAcfSBQ1VN8xVkMZC8UEoT3Lr9evAY4cQHss
 j7WEPW/J4Z8MmsRk5IS6ZXCYtHt13pbeNejg1bSzkdE/i8sg5IaPxA0P6Ym8IWtX
X-CM-Analysis: v=2.4 cv=G99/r/o5 c=1 sm=1 tr=0 ts=6276c5f4
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=_zopsp1utPoez82JW3gA:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-torrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 62769F170006C4D1; Sat, 7 May 2022 15:18:12 -0400
Message-ID: <e2c497f9-2fdf-74f3-ff6b-8d91416c8d74@bell.net>
Date:   Sat, 7 May 2022 15:18:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Latest PA8800/PA8900 cache flush patch
Content-Language: en-US
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
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <10617c84-75d9-a3f8-21a0-22dee44dbcba@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2022-05-07 2:49 p.m., Helge Deller wrote:
> Ok, so we now need to find the cause why v5.18-rc crashes...:-(
Working on it.

Dave

-- 
John David Anglin  dave.anglin@bell.net


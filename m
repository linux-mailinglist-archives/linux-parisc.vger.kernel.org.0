Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95A276BF51
	for <lists+linux-parisc@lfdr.de>; Tue,  1 Aug 2023 23:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjHAVcq (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 1 Aug 2023 17:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbjHAVcp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 1 Aug 2023 17:32:45 -0400
Received: from cmx-torrgo002.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF95C3
        for <linux-parisc@vger.kernel.org>; Tue,  1 Aug 2023 14:32:43 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.198.148.3]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64C3511700634E14
X-CM-Envelope: MS4xfA0uhTZ2368G3OLxYRAafGqzq8uB1qGlGMH+68yOYD1sgh8oio5bn6KxuLcXwSA5O/sUL/eOoBvJznBJydp73dqjD2+dm1H1+x39GzF+/QHOk8CN4Z3G
 Op2tcsTla9rr6TDIzQ6IQsWoVw9fskRqdt1MRUzWPHmmM+hg8SE7mpsk7CGFjDBPqlXpoDHzC8brg2+mmpk6jTwJxuzHFlQL9gyTa8pqDs6u6E0lM0DCuFg8
 Nm75HFZb6mslamPGHI4FIM922/Edqx5eEIFjc12iSRu3Y45S8qJaQllGXFBfkIiYt+7XiHoHdVUPHs2bIdKgVCYoGRFTrLE5CHL+U4taa08=
X-CM-Analysis: v=2.4 cv=GskhRm5C c=1 sm=1 tr=0 ts=64c979ca
 a=yRCPfkTDioc6Jdt88VZLzg==:117 a=yRCPfkTDioc6Jdt88VZLzg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=2qy-slV3h2j25fRD4UoA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.198.148.3) by cmx-torrgo002.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64C3511700634E14; Tue, 1 Aug 2023 17:31:54 -0400
Message-ID: <593a6bd9-d068-cbb0-ff29-d628839f6de2@bell.net>
Date:   Tue, 1 Aug 2023 17:31:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Regression with kernel 6.4 "swapper: page allocation failure:
 order:0, mode:0x100(__GFP_ZERO)
To:     Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
References: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <ZMle513nIspxquF5@mail.manchmal.in-ulm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-08-01 3:37 p.m., Christoph Biedl wrote:
> Greetings,
>
> it took a while to find some time for bisecting, but finally:
>
> after upgrading from 6.3 to 6.4, my old HPPA/PA-RISC box started
> throwing traces and became unusable, details below. I'm a little
> surprised apparently nobody else got bitten by this.
Helge and I have both encountered this issue.  Thanks for bisecting!

-- 
John David Anglin  dave.anglin@bell.net


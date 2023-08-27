Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584D678A1F2
	for <lists+linux-parisc@lfdr.de>; Sun, 27 Aug 2023 23:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjH0VdU (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 27 Aug 2023 17:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjH0VdM (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 17:33:12 -0400
Received: from cmx-torrgo001.bell.net (mta-tor-003.bell.net [209.71.212.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99286107
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 14:33:10 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [142.198.135.111]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 64E88507002F0452
X-CM-Envelope: MS4xfBWVu2n+oJmPcLJqRbRJEhwSXftpsopC+cNXCb7iYGMMmxpDywHBNon2p950R2K4ONqJ22TTxzIroyoNzWfAYvdWTg48ofDJpUE0rOg2KMQje15kCqc0
 ETZI2nzMclPGptiN96VI996tfvRiEaPbn/QNN7Yi5wa0VJe3qCoVZVceAD/cISknGk9i+lxG+oDb54k/+vj7X0xs6uz0/KzvI9ZVI8m9QrhGC6YxockVI9MI
 7fX6PxWDBAamsCtThy4Lqbt1/tDoFoxZoacfKl3u0v1ZKmAxbGEZ/fMU1k3eFod2vikva5DgMlIXp9D2zTFZyA==
X-CM-Analysis: v=2.4 cv=UM++oATy c=1 sm=1 tr=0 ts=64ebc0b2
 a=m0hBPjpnfWKpZW+YOe+Hqw==:117 a=m0hBPjpnfWKpZW+YOe+Hqw==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=SxjZZnf_5SGMlcyiv-4A:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (142.198.135.111) by cmx-torrgo001.bell.net (5.8.814) (authenticated as dave.anglin@bell.net)
        id 64E88507002F0452; Sun, 27 Aug 2023 17:31:30 -0400
Message-ID: <13c75691-ac65-93be-c217-89e7cfbed10e@bell.net>
Date:   Sun, 27 Aug 2023 17:31:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>, Vidra.Jonas@seznam.cz,
        linux-parisc@vger.kernel.org
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
 <7ce98f53-d80d-fc78-1bff-419eedaf8e36@bell.net>
 <f8be4af4-725a-902f-60a5-0f18c198b130@gmx.de>
 <d52e26aa-0c46-498b-0586-1fea2f94c58d@bell.net>
In-Reply-To: <d52e26aa-0c46-498b-0586-1fea2f94c58d@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2023-08-27 5:01 p.m., John David Anglin wrote:
>> Did the libuv check failed on 6.1.46 for you?
> No. It was successful.
I ran the testsuite a few more times.  Sometimes metrics_pool_events times out:

not ok 179 - metrics_pool_events
# timeout
# Output from process `metrics_pool_events`: (no output)

All other tests are ok.

Dave

-- 
John David Anglin  dave.anglin@bell.net


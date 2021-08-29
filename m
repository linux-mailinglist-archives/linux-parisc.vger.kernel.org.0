Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF383FAED3
	for <lists+linux-parisc@lfdr.de>; Mon, 30 Aug 2021 00:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbhH2WKH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 29 Aug 2021 18:10:07 -0400
Received: from mta-mtl-001.bell.net ([209.71.208.11]:54472 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhH2WKD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 29 Aug 2021 18:10:03 -0400
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.52.221.220]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 60C8938204138663
X-CM-Envelope: MS4xfHjoIpfw9ztlrSg8qcHMlloND127ILzyWTmfcDG4eZS+S9pja+BH7spqdDXl+qj9oI9/5URtkLp09vi6sU1O9vAVp5aspfgapw3p7WAn1uc8bQVJPF7J
 sJ2Yq9Mc8HOps2UwZXVyxWydWN91NEzbF3JJa2uDQR5x4S18fq9JsArRMmfuhVES1BpYZOwvOKHTpVnFjf9B4EeQu864t+pZ+QML7UJxMl9yCqwCr5coqgrM
 cb788AMopoxkaJ08WTH+VeBwmrlULLyXtfhEBnX3tzt2KueIptMlB9S3bQ3IgOqtNg1/FDSw0UKvOv7NY7jqstrxvbAtt6UMYAUAiCRje5TawkOORd52xYE2
 S87vao2U
X-CM-Analysis: v=2.4 cv=Z6GPoFdA c=1 sm=1 tr=0 ts=612c0585
 a=YO5NLpPX/y/Fbmk87HoZTg==:117 a=YO5NLpPX/y/Fbmk87HoZTg==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=vwiLEmZwIhDr6XKclFwA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.52.221.220) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 60C8938204138663; Sun, 29 Aug 2021 18:09:09 -0400
Subject: Re: [PATCH] parisc: fix crash with signals and alloca
To:     Helge Deller <deller@gmx.de>,
        Mikulas Patocka <mpatocka@redhat.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <alpine.LRH.2.02.2108291530440.5661@file01.intranet.prod.int.rdu2.redhat.com>
 <e890c401-a745-ad07-cfa5-bef61d3d8e46@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <0ef41f2d-646b-a42a-aeb2-78dcceac72e5@bell.net>
Date:   Sun, 29 Aug 2021 18:09:10 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e890c401-a745-ad07-cfa5-bef61d3d8e46@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-08-29 4:46 p.m., Helge Deller wrote:
> I'm just wondering if we miss to clip the sp somewhere earlier in the
> kernel call chain (e.g. in the irq/entry handlers), or if the clipping
> should be done somewhere else, e.g. some lines above here...
Maybe sp should be clipped in get_stack_use_cr30?

Dave

-- 
John David Anglin  dave.anglin@bell.net


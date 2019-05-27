Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C02E2BB89
	for <lists+linux-parisc@lfdr.de>; Mon, 27 May 2019 22:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfE0Ute (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 27 May 2019 16:49:34 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:59339 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726879AbfE0Ute (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 27 May 2019 16:49:34 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20190527204933.VHCR4947.mtlfep01.bell.net@mtlspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Mon, 27 May 2019 16:49:33 -0400
Received: from [192.168.0.183] (really [65.95.39.186]) by mtlspm02.bell.net
          with ESMTP
          id <20190527204933.VPOF21689.mtlspm02.bell.net@[192.168.0.183]>;
          Mon, 27 May 2019 16:49:33 -0400
Subject: Re: [PATCH v3] parisc: Fix crash due alternative coding for NP
 iopdir_fdc bit
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Carlo Pisani <carlojpisani@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <20190527192000.GA17551@ls3530.dellerweb.de>
 <CA+QBN9BtRGfykehiwV47SNhMgYQfvPX3-Ruoe6-Hvi5ay9skJQ@mail.gmail.com>
 <7bb12d08-6a2a-11e0-774c-2498c7f8b607@bell.net>
 <20190527202207.GE29337@t470p.stackframe.org>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <322860bc-afb2-c915-3678-6890ac57ffc4@bell.net>
Date:   Mon, 27 May 2019 16:49:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190527202207.GE29337@t470p.stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bJBo382Z c=1 sm=1 tr=0 cx=a_idp_d a=Q02bAvDbwyQG9yYSZ9PE5w==:117 a=Q02bAvDbwyQG9yYSZ9PE5w==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=5ypQrAzGAAAA:8 a=_A5TAQVKAAAA:8 a=FBHGMhGWAAAA:8 a=TBB4vbVkARzYnejM8xoA:9 a=QEXdDO2ut3YA:10 a=ATlVsGG5QSsA:10 a=QnlTcYk_iZbCEFXf-YqT:22 a=ypw9U9_ytwuNp2HAL0_X:22 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfOJGBY5NnW5X908yLrLmx0c87TD74IYEJbdu948YrejYsNAETpp1qXKb3/s4FeHjb6yA1zKDCDO8hRLhSObLjpD9QzhidOopWHrC+/n5dn21XoJ6safU /SkMC/OwJtCTrvKOhWUIy2OBtfL1If9kqCK2kriMovW9rxwUnjiINCedkR3MZ1yHpug0DwFdQhFuow==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-05-27 4:22 p.m., Sven Schnelle wrote:
> openpa.net has some, and i also extracted a few versions from HP-UX ISOs.
It would be good to collect in ftp.parisc-linux.org.

Dave

-- 
John David Anglin  dave.anglin@bell.net


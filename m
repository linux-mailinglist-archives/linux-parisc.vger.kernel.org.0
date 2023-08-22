Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB23784EA1
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Aug 2023 04:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbjHWCTQ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Aug 2023 22:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbjHWCTN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Aug 2023 22:19:13 -0400
X-Greylist: delayed 917 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:19:10 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFA2CF8
        for <linux-parisc@vger.kernel.org>; Tue, 22 Aug 2023 19:19:10 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-4a-64e5541fba40
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 7E.A2.10987.F1455E46; Wed, 23 Aug 2023 05:34:39 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=G0Jptx/pKKfMx3sx45ihUEq3qGu2z+1K+iWFW8IjI7EZ65pWtXtfo5v67FJDCSNeP
          CICU3RnzrZbEbi13cQLsQvftpBLkb50SD6FCBG4+Nzbzfexb7pggumKjyhRmLkvW4
          s8yEj0XZyiE5cECKiq514M263am/pLFKWFgt2GY80=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=Wxt0Z9U9+pd19ix45oDk5VOKjsuyiZhiQncmUcNjXKEp3EwchWrAExo+awHiZJebG
          nUyDrbxK0Via82WK1AU6mb5bAio3RbbylpX681LYvUxh136Fddy5HgEOI08DyJr3y
          J70OXV1/cG2KJPYMRm8y8y9FskvY3bQy5qewuYtEw=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:05 +0500
Message-ID: <7E.A2.10987.F1455E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-parisc@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:19 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW1c+5GmKwYuJ0haPTl1gcmD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCROPB5DSOILSSwh0li
        wT0dEJtFYDWzxPbtql2MXED2Q2aJV2v3s4A4QgLNjBJzTvxiAaniFbCWmPb8MzuIzSygJ3Fj
        6hQ2iLigxMmZT1gg4toSyxa+Zu5i5ACy1SS+dpWAhIUFxCQ+TVsG1ioioCBx4OVzsFY2AX2J
        FV+bGSGOUJXonPMD6jgpiY1X1rNNYOSfhWTbLCTbZiHZNgth2wJGllWMEsWVuYnAQEs20UvO
        zy1OLCnWy0st0SvI3sQIDMLTNZpyOxiXXko8xCjAwajEw/tz3ZMUIdbEMqCuQ4wSHMxKIrzS
        3x+mCPGmJFZWpRblxxeV5qQWH2KU5mBREue1FXqWLCSQnliSmp2aWpBaBJNl4uCUamAUMnpR
        Hqq7aClbhMwKE3HlrYt8GcSmW798rLg88Fqk6sI2I64di8ym8K04t+pOQ8FTt80zPl3b/aDI
        V6ou7sEDtqctG2NPii/Zp9xQK/U4OTItxaWBI26eleMZTpMPcmtNjh2cHHJ16iaxO8tmMp8w
        nXRQ7FvwpOL+drf/W2ZO8j7y7LJzXE2pEktxRqKhFnNRcSIA7Y1NXj4CAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China


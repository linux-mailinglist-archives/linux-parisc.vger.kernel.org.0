Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5878312A6CD
	for <lists+linux-parisc@lfdr.de>; Wed, 25 Dec 2019 09:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfLYIdT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 25 Dec 2019 03:33:19 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:27624 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfLYIdT (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 25 Dec 2019 03:33:19 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Dec 2019 03:33:18 EST
IronPort-SDR: PlwLikndLn8vmN3OFkaewEPqLvregsBjPStfIpHjnV5Ytot+lKzRmXJc0+CwrtH0sXMD5z2nt8
 LHkGM//V59oA==
IronPort-PHdr: =?us-ascii?q?9a23=3AOHVHehOvs5dVcersSN0l6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0Iv38rarrMEGX3/hxlliBBdydt6sfzbCM6Ou/AyQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagb75+Ngu6oRvfu8UZg4ZuNLs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gyoBKjU38nzYitZogaxVoByhvQJxzY3Jbo6aKPVwcbjQfc8YSG?=
 =?us-ascii?q?VdQspdSzBNDp26YoASD+QBJ+FYr4zlqlUItxS1GBOiBPnuyj9Nh3/2waw60/?=
 =?us-ascii?q?o7Hgrb2wEgA88OsHDIo9X0KagdS/u1wbLNzTrZbvNW3S3x6JTWfRAlv/6MRa?=
 =?us-ascii?q?h/ftbLxUk3CwPIl1OdopHmMTONzukBrXWX4uh6We6yhWMrtxt9riagy8s2hI?=
 =?us-ascii?q?TEhoQYwU3e+ypj2oY6P9i4RVZ+Yd6jDZRfqTmXN5BzQsM+W2Fovzs6yqEetZ?=
 =?us-ascii?q?67YicKzJMnygbaa/OdcoiI5gjjW/iVITtki39pYqy/hxGv/ke6xO38Uc+030?=
 =?us-ascii?q?hQoiVbidnArnEN1xrN5cibUvZx4Fqt1DSV2wzO5OxIPVo4mbTUJpI7zLM9lo?=
 =?us-ascii?q?IfsUHZES/3nEX2grWWdkIh+uWw9+Tnf7HmqYOdN4BpkA7+Kb8jmsmlDuQ5Ng?=
 =?us-ascii?q?gCRXSb9vq41LL95U32WqlFgucukqnFqJzaP9gUpralAw9J1YYu8xK/Dzag0N?=
 =?us-ascii?q?QFkngLNUpFdwidj4joIFHBPOv1Demwg1uyijdn3fPGMaP7ApXLMHfDlK3tfb?=
 =?us-ascii?q?Fn605Tm0IPyoVb5pRJGvQZKejyQUTZqtPVFFk6PhayzuKhD89yhbkTQWaePq?=
 =?us-ascii?q?jMFKqaiUWJ4+MzIveFLNsRsS7nKv0k+//whHIisU0afa6s1JoTLn2lSKdIOU?=
 =?us-ascii?q?KcNF7lyu8bEGILogsgRaS+lECGWj9fbm2aWqs94ncnBYarFY7IAJix1u/SlB?=
 =?us-ascii?q?ynF4FbMzgVQmuHFm3lIt2J?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GTKgBOHQNemCMYgtllgkQBGAEBgns?=
 =?us-ascii?q?3GyASk0JUBnUdihKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQU?=
 =?us-ascii?q?BAQEBAQUEAQECEAEBAQEBCAsLBimFSkIBDAGBayKEF4EDgSyDA4JTKa0XGgK?=
 =?us-ascii?q?FI4R1gTYBjBgaeYEHgUSCMoUCARIBbIUhBI1FIYhLYZd+gj4EljANgikBjDg?=
 =?us-ascii?q?DglSJEacigjdVgQuBCnFNOIFyGYEdTxgNjSyOLUCBFhACT4VAh1yCMgEB?=
X-IPAS-Result: =?us-ascii?q?A2GTKgBOHQNemCMYgtllgkQBGAEBgns3GyASk0JUBnUdi?=
 =?us-ascii?q?hKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQUBAQEBAQUEAQECE?=
 =?us-ascii?q?AEBAQEBCAsLBimFSkIBDAGBayKEF4EDgSyDA4JTKa0XGgKFI4R1gTYBjBgae?=
 =?us-ascii?q?YEHgUSCMoUCARIBbIUhBI1FIYhLYZd+gj4EljANgikBjDgDglSJEacigjdVg?=
 =?us-ascii?q?QuBCnFNOIFyGYEdTxgNjSyOLUCBFhACT4VAh1yCMgEB?=
X-IronPort-AV: E=Sophos;i="5.69,353,1571695200"; 
   d="scan'208";a="317906378"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 25 Dec 2019 09:27:58 +0100
Received: (qmail 32233 invoked from network); 25 Dec 2019 04:33:51 -0000
Received: from unknown (HELO 192.168.1.88) (seigo@[217.217.179.17])
          (envelope-sender <tulcidas@mail.telepac.pt>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-parisc@vger.kernel.org>; 25 Dec 2019 04:33:51 -0000
Date:   Wed, 25 Dec 2019 05:33:42 +0100 (CET)
From:   La Primitiva <tulcidas@mail.telepac.pt>
Reply-To: La Primitiva <laprimitivaes@zohomail.eu>
To:     linux-parisc@vger.kernel.org
Message-ID: <27026285.259381.1577248423113.JavaMail.javamailuser@localhost>
Subject: Take home 750,000 Euros this end of year
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Attn: Email User,

You have won, you are to reply back with your name and phone number for
claim.

La Primitiva




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.


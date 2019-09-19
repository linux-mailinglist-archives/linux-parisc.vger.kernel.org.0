Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BACB7B7BF7
	for <lists+linux-parisc@lfdr.de>; Thu, 19 Sep 2019 16:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388397AbfISOSV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 19 Sep 2019 10:18:21 -0400
Received: from mail-sy3aus01hn2073.outbound.protection.outlook.com ([52.103.199.73]:45580
        "EHLO AUS01-SY3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388006AbfISOSV (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 19 Sep 2019 10:18:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgnBM2DzSEWU2LrODD1vc1xLusjeTwXo9di3BeF8EU+IgAAP+6qm9zRx6Mu0L9jRHlov7F7PVZ4ccPZRUH5rK9XywdG3ypvPYlkwnQaQ1wQPXsif0n2etQy4G3GEUn08hkEpRhnvYm9ccJhWuvFUW+H5Hx7TSB4zRj2icCUgT49iq2/2zOMniicQ8rncztF3Dmi8K3/gRPEvLleH2ngJfBVYL3fkZICjbBqq/zCxVRlEEiKDWO9Fupt3u2OhYpI4TyTD8SQTM5MLBRMr9DpnumDuTO3iRTsi8HdB/qKGwe6IcXV4VQdMi34I3fxXn4jPgNIN8pWzaM2ym+PggepkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctOHH2mTYytKOkOB/KQgjBv82LXnbGG7XKgNOOQYhPo=;
 b=SM9qLCJFKM82Ai/uiftfZixSfRCCK9p3tF7ZRR6P8WV/FPcLBj0ygl0GIRVkrd1gtzpRAEzkcTEDiIATnIimR8AESO1WEjai1Yqsh5avwxmMEmrO8ZpyeADWKmcYYxPL7RXe+4ZCadFQ+7a1oP+NnbQ5DTJtmA1dn+TY9xpKrSPn/lQYa8VBkTVqqAWcPXzkDiUV+PL0E9Zr1vEeQXIwV/5QUPMFJooOcNm7R6lr1t56+QI0FPDpa711ASgQndrV5kTPRyMkLGBoJ3Xliwm0Ot//JvTXOL4eiKoPfRNlDx/W5G68cVKIIgbOPilIydzembipamrWu2yIQacYcku55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uts.edu.au; dmarc=pass action=none
 header.from=student.uts.edu.au; dkim=pass header.d=student.uts.edu.au;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=studentutsedu.onmicrosoft.com; s=selector2-studentutsedu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctOHH2mTYytKOkOB/KQgjBv82LXnbGG7XKgNOOQYhPo=;
 b=vjTfvoBR+icalYW85csMLlUskz1ZrLMAIbBbQJxRAaW+KdNZmQ4Rw4aMQ3Oj/RuchQMNgWHFIGUUjs4KaA6CXFx2u7OSDuaTzbIYTi9ZHnZ8M28y6cd93gVpM7noY+MUCMOM7N1lMmEcAoqqfOSQvPQsae541xQVgvYYHvRGVn8=
Received: from MEAPR01MB3910.ausprd01.prod.outlook.com (52.134.217.76) by
 MEAPR01MB2565.ausprd01.prod.outlook.com (52.134.194.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 19 Sep 2019 14:18:16 +0000
Received: from MEAPR01MB3910.ausprd01.prod.outlook.com
 ([fe80::29d5:bad1:3777:50c7]) by MEAPR01MB3910.ausprd01.prod.outlook.com
 ([fe80::29d5:bad1:3777:50c7%3]) with mapi id 15.20.2263.028; Thu, 19 Sep 2019
 14:18:16 +0000
From:   <13623879@student.uts.edu.au>
To:     David Gillis <David.Gillis@student.uts.edu.au>
Subject: Darlehensangebot
Thread-Topic: Darlehensangebot
Thread-Index: AQHVbvUU9pWietEqh0Gw8ymS7ITRBw==
Date:   Thu, 19 Sep 2019 14:18:16 +0000
Message-ID: <MEAPR01MB391039A884EBBCA9425D2A84AC890@MEAPR01MB3910.ausprd01.prod.outlook.com>
Reply-To: "chelsealoan4@gmail.com" <chelsealoan4@gmail.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To MEAPR01MB3910.ausprd01.prod.outlook.com
 (2603:10c6:201:3d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=David.Gillis@student.uts.edu.au; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [154.160.6.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef2a206d-0f93-424e-00b6-08d73d0c36dd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MEAPR01MB2565;
x-ms-traffictypediagnostic: MEAPR01MB2565:
x-microsoft-antispam-prvs: <MEAPR01MB2565C37BB40B828D19082D88EB890@MEAPR01MB2565.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(136003)(39860400002)(346002)(199004)(189003)(14454004)(3846002)(186003)(386003)(22416003)(43066004)(7696005)(305945005)(52536014)(478600001)(2906002)(2171002)(55016002)(74316002)(6862004)(8936002)(7116003)(81166006)(81156014)(7416002)(4744005)(325944009)(8796002)(102836004)(6436002)(8676002)(52116002)(6116002)(5003540100004)(99286004)(33656002)(6636002)(6506007)(66556008)(66446008)(66066001)(66476007)(2860700004)(26005)(66806009)(5660300002)(3480700005)(7736002)(88552002)(9686003)(66946007)(221733001)(25786009)(476003)(786003)(71190400001)(316002)(66574012)(71200400001)(256004)(486006)(14444005)(64756008)(81742002);DIR:OUT;SFP:1501;SCL:1;SRVR:MEAPR01MB2565;H:MEAPR01MB3910.ausprd01.prod.outlook.com;FPR:;SPF:None;LANG:de;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: student.uts.edu.au does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V2BxdS0HrKKu57pd7V7VvV6WH79Jk9Lx36HXFxgRo+uKd3AgNAGkz/VsTRi3i8yYTY6k6HzpiStIq8AFLS7LIGDZ9GSUbK6YMfKJDASndS06QqPRx7l7dQDXJYwG1wERyXGWCY8/fudWAyxXII5xTO11k3LEAmcYvtPjPlb5NNt1bVJXZO5pD+M/ShCTLhauac+5D0wAIs8zEzqUK8j1/BVZwkI59dauYcCoK6z6MabrRrvUMnZW8wDR7lwqbbKw1zEEBHpTMUL0i1sryufWXhNObJxmArn1zNxctfcOCPh3TQqBRDOl4+r3wp5Sq5TSpAN/RuoNJf31veMDnSu6ySH8iFnlH27jMqUHTydSBcRuys4cT7RjoAkRdrN6omAG6+g5f2i6+z+H6n0Eny011PD7goWi6FQp47bRjB2JpyQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0C5DC3355AEB8647B6179E2DB0486496@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: student.uts.edu.au
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2a206d-0f93-424e-00b6-08d73d0c36dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 14:18:16.6988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e8911c26-cf9f-4a9c-878e-527807be8791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkIFVAjST9T8oi3REhgGG0d9AENtdQYuHC8vBm887rcm6dzQdHaTc0iWawgwTApCT7fhweKWRGnP0pNv+f/lw9O1tnckPkZIUfyS6xiCz4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEAPR01MB2565
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Sch=F6nen Tag

Ben=F6tigen Sie ein echtes Darlehen online, um Ihre Rechnungen zu sichern u=
nd starten Sie ein
neues Gesch=E4ft? Ben=F6tigen Sie einen pers=F6nlichen Kredit? Wir bieten a=
lle Arten von Darlehen
mit 3% zinssatz und auch mit einem erschwinglichen r=FCckzahlungsbedingunge=
n.

F=FCr weitere Informationen antworten Sie mit den unten stehenden Informati=
onen.

Name:
Land:
Zustand:
Ben=F6tigte Menge:
Dauer:
Telefonnummer:
Monatliches Einkommen:

Bitte beachten Sie, dass auf Kontakt-E-Mail:
chelsealoan4@gmail.com

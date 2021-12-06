Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A034246A49B
	for <lists+linux-parisc@lfdr.de>; Mon,  6 Dec 2021 19:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244150AbhLFScp (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 6 Dec 2021 13:32:45 -0500
Received: from mail-dm6nam12hn2208.outbound.protection.outlook.com ([52.100.166.208]:33172
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347362AbhLFSc1 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 6 Dec 2021 13:32:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJgn9lAoKy29JvIkhzvmer/lb/unYWTkrqjGflqPGLz5trI3Qus276zok6xLPr0Hqdt3+HLD8vlYNXCWcwpWJ56pjM616yBb8jueYl/QNyiMQnHLK+iVcdfH9UTqUhSiidU3H2lXX/vIAkb5BiQLOjp/g25EV85hW1R0qcJcEBuv0C+ajjB72CvLdjOwzHsVKj0YoBmCLGvYj5UXILJZ9oagxB6iUv468EGID3MLsv5bYX88G44EQW02jrrllsSTEzAjiMF+NZm3YyGn+hxpKZxkyvwsfYjeLcDV3Tu2R5lSVOBxNSKLsoQYSck3KVulCB4mxwZZIuWPZqJAh+ZU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=Cx35wUBpLhNg++7w29IaSPpMSm1f2jeP/mMFnxBvkuHsfEqaYBPA5CDHogD0UqSyv34B7i0YbHp0EZUK0F6yteSoGMMF5+PBwqzKVfUeih7vCt9FBCDudvapQLA3PH+kYkA3JsYCL71xpdTrMkYkmlZ+/FpYm20AubgnN264RW+z1abwawJ9Piah0DBjBsNLfpA9ij8ZL2KkZ/8PbsOC7uHGkYOxq5lVBXtplIUAHHwrReqnp0ZRBA8OeFP0YXzI4Nxih7xD36H2bEcPJnIBNorZCU5EyIoaH+NWBZYn7NgcdzF10YM9OkC2AdOjAuxd6HPqNQfhxe/aoBc1RW4okQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=reflectionsframing.com
 smtp.mailfrom=msn.com; dmarc=fail (p=none sp=quarantine pct=100) action=none
 header.from=msn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=SzbX48rbRYwWYob766CwNjf/2L5nMn0pQkxtBK2gQN23asYgAg36KcVwd+tSlhrZW6udZg2zMxkBn0Zky6io5C+urCtD5FL2jJPqcAnTQcDQBF1IHM98uWAd8VvSVVngc8h6Or4XJZwYBNzFrRWxB9q/IN7mW8fNXA0KkN8qaGU=
Received: from DM5PR06CA0051.namprd06.prod.outlook.com (2603:10b6:3:37::13) by
 CO6P220MB0387.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:359::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Mon, 6 Dec 2021 18:28:51 +0000
Received: from DM6NAM04FT030.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::a2) by DM5PR06CA0051.outlook.office365.com
 (2603:10b6:3:37::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Mon, 6 Dec 2021 18:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 DM6NAM04FT030.mail.protection.outlook.com (10.13.159.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:28:50 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 7B6B8938A8;
        Mon,  6 Dec 2021 13:28:04 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:27:07 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <32d01afc-822c-4bc6-af3b-724babaca2a3@DM6NAM04FT030.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17c77195-97cf-4dbe-d7d8-08d9b8e6403b
X-MS-TrafficTypeDiagnostic: CO6P220MB0387:EE_
X-Microsoft-Antispam-PRVS: <CO6P220MB0387CFE7EDAD6A7496FAA240EB6D9@CO6P220MB0387.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(26005)(40460700001)(82310400004)(31686004)(3480700007)(316002)(8936002)(786003)(7366002)(2860700004)(7406005)(956004)(7416002)(8676002)(70206006)(31696002)(2906002)(7116003)(82202003)(508600001)(86362001)(70586007)(336012)(9686003)(5660300002)(7596003)(83380400001)(356005)(47076005)(35950700001)(6200100001)(6266002)(6862004)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEx6b0oyNXR6VmdyNnIzRDJVa2F2VnFmRnd6Q1YzQS9maHo1di8waFAwMHFT?=
 =?utf-8?B?VlhiOCt3MVNEWlAybDlyOU5QdzlVa1h6czZENTJyU3pVaVlXbjhyVXR1UVp0?=
 =?utf-8?B?ZktJdTNnVzRodTZ1dHdDQnR2UzNkMzg4VzVENHBtb0tpMGY1UTVJV0hkWlJp?=
 =?utf-8?B?U3RWVXVpNTRqQUdyQUpSRE1BWHNBckc2Y0s5QnVxVThtQS8yd0lwdkMzZVhW?=
 =?utf-8?B?eXc3RGVFVXgzODYzTSt1RDY2ZVNaN281VEFZTWNDZWVlT3g5Y0tFNGRoa2Ew?=
 =?utf-8?B?Y05NTTd3OUs2Rkp0bFYrKzJvOEh4eG01WG1DRHVLMWYzaGZXVUowVTV1dXl0?=
 =?utf-8?B?cGtxN1JSdXBNUnNYWDh1eVZuSVp5cEEvOG14b2ZaNWEvakhLOW1yTTNpbEdx?=
 =?utf-8?B?N3U5NFdidnZTWGlZcHhaTnVZdEF2L2NrbElsQWg4ZS9paWVVUk1mRk5pbThm?=
 =?utf-8?B?QmlVbXg3WHVFZkEvcnQ2K0xhWUpOaDFua016VHRHWmlLSWt3MFpPN3dQaUl3?=
 =?utf-8?B?VkY3Tm1QU21TZVhFMVhYbkE5bXQycS9VSGh4bThjT0tMR0EvWWxqMGcyMmJq?=
 =?utf-8?B?RlRhNWFqYVhGVWZsZUVCMTJCTW43MVZzRE9ONjFQNkpxcGNxZmNBSWYxVmlE?=
 =?utf-8?B?NVhOcXd0ZEg4NkFNdkhUK2hsM1FIRU11NDZPQldwVjhMWTZIcXNCQ2NHa2tF?=
 =?utf-8?B?MzkweCtqQUhwTXhXMHR3cnp3THFxQk5XYm10eU5KZ2RaampsTE5IaHlidk1C?=
 =?utf-8?B?THZ6eHpOR1hMVmVnSUFFQ1NMR0dIWkd0aFMxQ0dUOEVhVlZJcHUyaUdlOC9P?=
 =?utf-8?B?cFdKSDRnMTlZR1dYOGVSN0tSM3ZUVHVBdkRZRDdkNHVDR1piUUVacVpua1A1?=
 =?utf-8?B?K1NCbk1XRXNVbzFkSzA4bFptZ0ZMQU96Ly9JeHp5NUZZRnU5ZmFXcmQ0aDBx?=
 =?utf-8?B?Y3ZVbHBpZEFNSFgvd053UHNFU3lYa0ZpU1VxTWxHanBNVWxRY1MycFBvNXlu?=
 =?utf-8?B?L0R4MklMSmFIM2lxNlFRdlNreFBvZnI0ejJPbzBiT2Ewamo3ZVRoWGRaNEQ1?=
 =?utf-8?B?Tm9rNEtqM3pzOWdackVhVFVabnBob2RQOTNrMVpCTnAxMGhSd3JiKzgyMzlx?=
 =?utf-8?B?Sm1VWG5ZUVZ5QnhoS1hvS1pDZXVPZExpQWxRcUpud1k5VjBUMmppYzE2MTgw?=
 =?utf-8?B?em1XZXplNHFIU3A2U1grUUVZU2ZlZk54K3JVT2pyYXllMng0MXhpWDhHSmcw?=
 =?utf-8?B?NEh6ZElLMW8wVCtQcE5vajhINDRWUzMzWUV0ano5ekd4ZjUzNFlpWkRYeDRa?=
 =?utf-8?B?R2dSb2pvS1FPY1BSTTdlckl3S29ha0VlWWJHd0h4RU92MGE3NEI1K0hsZEVO?=
 =?utf-8?B?YWY5QTZRbExPa252VnhHMW9DaDB1bXhhWU5sS0x3MjUvNk8vd3pWcXNVQmhQ?=
 =?utf-8?Q?tGovKr6r?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:28:50.7970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c77195-97cf-4dbe-d7d8-08d9b8e6403b
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM04FT030.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6P220MB0387
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.

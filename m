Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2425FA2BC
	for <lists+linux-parisc@lfdr.de>; Mon, 10 Oct 2022 19:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiJJR2s (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 10 Oct 2022 13:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiJJR2r (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 10 Oct 2022 13:28:47 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2097.outbound.protection.outlook.com [40.107.92.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AC5760EE
        for <linux-parisc@vger.kernel.org>; Mon, 10 Oct 2022 10:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0LsgKtotHchCqgb3bgHn+Y4qYXgsX5n5hscBUiZU2+YLIl+QaQ/pn/ny7gkhfxKjmFw7UmGiwf6tYi/PejD3caZPDs0oIMTvYuW9wyR/g7GA2bPAu4RuRboQVKWPMKbXT2HeSpZE/aUk9ZWoFY0QWbQOgQW07pyKYTAthzuafgiFtSicc+N4qEyHb14oDnG42OOvxEeepjCvNAoXynkm6vxhZ4WqZ4Mg4LLysXURshbhFVRnqpc4ahqpL/8OZuancJ+M88+WknL9tHRgJZ0soXXRiXGivgezJQcMotnmC/IysUk3ilccDCUC0qFVqAc/NeZLhhgZkHob+qLFWwwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SjCvkIzRIo4KuAYgJYxvzXMu2xUiNYj12OAtRBgGGE=;
 b=g5jEVua/loEzcokR+ZEgFgzeH5GiEnomIsdXP6POFdnZ1vXmCmNMgtrMhr4HivMsXJ8mIP+s3GCBbDi8mmexbwKcnhFbUBaLG7J3UZ0OPlBZKUd96Ja+WFiCZPp79THmmsDxEL7mbS8NCupRddHL5fkYc0o+eHc03qjH9Jrw3JAHRRnByLxGCpZsyQQS9qqxOJovm0bvRf0Ek6mcqE+PR8zmubhQ1Ddu9ditK5kdn0YDJ1CI0hnQKlWB6CVQsBvk8J31weFsUE5v9zE5mz3lSJ0ewSsjBPDUFIDkJUO+ikXtx1h67UUEjvjPD2ASYTs25atZxTEO36k691p7G+V9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cypress-tech.com; dmarc=pass action=none
 header.from=cypress-tech.com; dkim=pass header.d=cypress-tech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5074309.onmicrosoft.com; s=selector2-NETORG5074309-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SjCvkIzRIo4KuAYgJYxvzXMu2xUiNYj12OAtRBgGGE=;
 b=OYd8CRz9w9MInSS52AN/R1V8jeJx6bbTYK5yUXAsBE4wdv+73Ga+RZWc/d2/wtASFnmPE1BfHQGFJQgttH1GfRBbKSf34OgxM8ewQrHZdrzNBSCc4NBrHmp2YVzhHwnV7q/RvOCSxXEKFjznaR5cQ+O7mYThLEmfjQV/bc7oON4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cypress-tech.com;
Received: from MW4PR17MB5642.namprd17.prod.outlook.com (2603:10b6:303:12d::13)
 by MN2PR17MB4093.namprd17.prod.outlook.com (2603:10b6:208:209::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Mon, 10 Oct
 2022 17:28:44 +0000
Received: from MW4PR17MB5642.namprd17.prod.outlook.com
 ([fe80::9de5:86bc:9703:4fef]) by MW4PR17MB5642.namprd17.prod.outlook.com
 ([fe80::9de5:86bc:9703:4fef%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 17:28:44 +0000
From:   Jesse Dougherty <jesse@cypress-tech.com>
Subject: <Plug> HP PA-RISC / IA64 hardware platform for Linux Debian, Gentoo,
 NetBSD, OpenBSD and HP-UX Unix
To:     linux-parisc@vger.kernel.org
Message-ID: <fc9cd72c-c130-0b0e-4deb-d6366a436fb9@cypress-tech.com>
Date:   Mon, 10 Oct 2022 13:28:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BLAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:335::6) To MW4PR17MB5642.namprd17.prod.outlook.com
 (2603:10b6:303:12d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR17MB5642:EE_|MN2PR17MB4093:EE_
X-MS-Office365-Filtering-Correlation-Id: 24eed7d1-fab7-4864-0bdf-08daaae4e1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iKhV619s/ruP8CROLdOT7aF9X6JhoHARBi/yiip/sHnw5qSCdy0SxJcq6ra23I7+r+PYmawVgXdYRJoRzOOn03eu1wFGD1czykxHdw0Sb4ZnsGbTAKkwoNdOpcewyqHypWM2Is+kGpaqaEXyemksiZ4BJ0MGuFFSkDdUQ2gMwApKdsR2Nye6with+88RHYxIr5BUxw7QMXIdd+R6ptRAfk3U8ltgheJn30nD4evxADSsOyO3e013wYBWl3y5blqw33J6/ouv32H9qJfJc+CRPTaEDc1L/8TDESOQkznzZFZNs1vuwlt0a6Wld0Uo7ekErhXvzcHzFvBx2fhiOHEpxlLjwiT6Z69sL55bxNkDuKhLYcaN0jbocrnc8Kn3nThE2nHI6owBPiTxSrwQJqYYKwRXV0WA3Sxte0XQCXCXZLDR8vwBZarE85qn2YDWLH72UtoKbv5WubpOiDsU+f6Ee7/g5oy6N6b/DTHYn16XUloj2oxrkLSNX9GrdeF+Vg5ZPvlKtGRbfZ3u62N4O1AMs5fx0qa2c4O5co7Ro74y8iZVVg0YxW/5v530Wn2PXlQJFHN0onwz0yrzWtHjZY51fYv5LUhX+7qLtpuDY/I5fMh9ixOJSV3GJ6aN8fB71cxtFSAZ35j7VTiFuktuIjJ3lACAgLKTSVKTa5NIRVplyYXkFvCZwe/Yhp+08zRWxvnjJRY7W1LPvbnjEFz29uyZNDm30DFiuXMiyTLh8ww4bNcRjMCM8OW3PH6E8XEvcPNYxrsA2EEQqdbmBZKIEXl0C39BnijheJVTIltufkjOcvj58q383wPU3ecKeK+gKjQzN2vHOZ11tgTTiaI3FP3gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR17MB5642.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39830400003)(346002)(366004)(396003)(451199015)(8936002)(31686004)(52116002)(86362001)(316002)(66946007)(8676002)(66476007)(31696002)(15974865002)(2616005)(36756003)(38100700002)(66556008)(83380400001)(6486002)(6506007)(478600001)(41300700001)(6666004)(6916009)(4744005)(2906002)(186003)(5660300002)(6512007)(43740500002)(45980500001)(18886075002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L09uYXRvMTJxZndTSk8rYVlUazZlTkhPS1BRQi9BZFBRNmxVNWxvODd6dENs?=
 =?utf-8?B?RUtvcTA4K0QrdkU0L01MaGdiSlVOZ3FqOEM3bnlpMUp4OXlKQzk5aVgrVm9k?=
 =?utf-8?B?eHRPMGZXaVdGVUlPS3oyR2Q0ZWRLbG5STkg1ZENTWTZEYjVUeHVkYUhnRU9l?=
 =?utf-8?B?ZDBLTUt4WnJybVBoTGk3Uk82OWtlMTdZSStZbmc5U0NJbWRGTGk0SG55S3Zk?=
 =?utf-8?B?bUxhQVJVc3BxYVg0U21ZZGJ5b2ZzbGlXSER6SnFrRkFJdktGUWl4QXpwY0E1?=
 =?utf-8?B?VlQ5RlJhdGtCRzRaM3lSN3V1VnhCYXpzTEs0cVdWZXhlQ0ZZS2R6cEJreVNF?=
 =?utf-8?B?Z0FtL2d0MEJPUG82bmZ4NHpsMG1MVGpUY0xFS3NXaXY5dlJyV0QrTlB6cFpv?=
 =?utf-8?B?QUJzOWF4b2tURDVUekxhZGNvdFhaUmNzZXR6b0NseWtJa2k0d3BIWlVWRm5p?=
 =?utf-8?B?VWlYVXdMcjRNMXM5U3FtbVBwUkdFaEZiT3FPSHpXKzlJaWV0K2kzWHZZZzJ2?=
 =?utf-8?B?a1l6UG5aSDd2SlM3dU8vdW9NTk5iQVBRWGpUVmJwek91ZUlVWkp6Uis1bXU5?=
 =?utf-8?B?ZURkdFlmVEEvSWJlNlk0eTJ2NVBuYXVZN2kvdHFMNytjS1hpMWNKUmwwTUFC?=
 =?utf-8?B?ejFBei9iYWJsS1pTM0h2WXA4SHNGRSs1QzFEbTBNNDVweG11Z1U5cTEyQ3J0?=
 =?utf-8?B?OXdOeFQ5VWtyMElPQk8xb09FbXY2MjFqVXJGaXg2b0xmSElWZTRjMFFhNUhq?=
 =?utf-8?B?ekxsOEhaWENadG9ENi9sajFJblExOHVaYVg4OHFUQXM4di9RSEtPaW52VzBG?=
 =?utf-8?B?ZVhCSDRTejlLdU9GZTNVVDExeDAvZTJDZGU2S3N6MmxzVzhyRGFLbjVmNWhW?=
 =?utf-8?B?UVNWSXJ0dHhTUkg0aFRZdHhIV244MHZrdEtXODZMSm1TTlpDaFMwcjJPaFRC?=
 =?utf-8?B?OWFqWFlteWxkNlZub1dQS290VGJ1M1dxd3I3T0IxUzU0Z0p0MTlaVlk1QVZz?=
 =?utf-8?B?RUhxVGdYcTVWZHZqT3VTNWkvTHNyOGpqN1RqM01Vem1TTGNBa2d4YU5HWThl?=
 =?utf-8?B?aXY5WFVFVmU4aTBiMmdQRUoydzRSQnYzelo2ZDRMd0g5OG1BdWprRFRjdWEr?=
 =?utf-8?B?K2V6ZHl2ZHl6bXRQNk91ZjEvRjA5WXNkZzhzYStuQkR2VGJtR3lBZFFNS2I1?=
 =?utf-8?B?cFFuOFNVNjgrNG9PanUvSEdTM1U5czlkSS9xT3ZQS3VZZWF4V3FuVkZoVHBq?=
 =?utf-8?B?NWRjWkpQVjA2a1QreXI4S3NIZmVSMUplRndmM1g0Rm5UNDZ2RWRnK0MzZ0VC?=
 =?utf-8?B?ZjJqbUpBZHUxNDFFK28rYUNsRkZXbDNIQWkvMy9aSlVFRlNwQjBiUTFTdWRQ?=
 =?utf-8?B?dHVrcm50amVLZ1hFUXZZVWxqWmNCQVVrUUJ0K3R4UVZBRC9WdjVhN2hKLzJL?=
 =?utf-8?B?QzdLanUyTHlTc01Fd2N5TzNSeEFOcVhLbEhlcWR1eGg5Z2tJT213eGVYTnNp?=
 =?utf-8?B?cDJUb3RTdVRHVmJoNmtzaEVGeHdkTnY1a1JNOHJIMWR2TmplNU1Gd2xJdWhE?=
 =?utf-8?B?SHZEYVBXZGlwS1NESnYrSUhBMHlUV01LT1ZXMHJxREkrUGR3T08xTzJib3kr?=
 =?utf-8?B?TmpHc1dZTzRaS3Zjb3BtT0dGcjgyWld0ZDlLOXl4d2FoSEl4WWZtdk9ROVRB?=
 =?utf-8?B?OFcrbFVWSnNTeGRxU0krYzZ4UWRMeGtka1k3a05TcW5jQjNoNnArWXcwSW93?=
 =?utf-8?B?SGJVNklNT0J2QUhBMWw5UWV0L3ZuZWNOUmZ1djA3Q2wvZ3oyYVFmYVpaanNX?=
 =?utf-8?B?VzNOaWMyUmFCODQ2S21VZkdoM2d3cGlVcGF6dWUwOU51L25kbmpHcmxybHdN?=
 =?utf-8?B?ZGxPcVZHM05ETkZBZ0FHUVZyU0g5M0V4MXdlaWRsajlaSWJuYVl0c0F4YkpP?=
 =?utf-8?B?amNJdW9HVyt1VXBrUUI0T0tNWkVVME9PaTR6SGt1MFpnQXpNUUN1ZHlNckFW?=
 =?utf-8?B?SnptejNvSDR1SThRU0ZyY0p6WDlmTmJxMUo4MVJJZlNPVENRaENiYjdsekZy?=
 =?utf-8?B?YmNZNXZuRHM5a0hvTk84bFlKNTBZRFFGZnZjTXVPcHgzM1BzU3dlSFhQYzJo?=
 =?utf-8?B?ODNjT0hlak5WRmRscWNCdm95M0Nib3dEUmg0Q2lUZlJIaWs0R05hcEtydzEr?=
 =?utf-8?B?bDg4dkhiaTYvM2hOekg4ZXFsanZ4dDhhV0hEVVFhdVNYcHl4b2JTY21YQlFi?=
 =?utf-8?B?N3NvZ3JjTy9kQXc0VHhUYzFYUFJRPT0=?=
X-OriginatorOrg: cypress-tech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24eed7d1-fab7-4864-0bdf-08daaae4e1d1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR17MB5642.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 17:28:44.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: daf09015-3d9a-4dbb-b0c5-310700bdf5cb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +R4AE8iXyYJXkE+TKLAGi4LiwszlIIqb/x1fcwOYvv+jBB0+7FKiwT3fWt7avdRSz+H21+jMqx6BZQKfleN55g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR17MB4093
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi, I'm Jesse at Cypress Technology Inc. We at Cypress sell HP hardware. 
Below are some links to HP PA-RISC and IA64 boxes that support the Linux 
Debian, Gentoo, NetBSD, OpenBSD Linux and HP-UX Unix platforms. If you 
are in need of systems, feel free to email back with any question or 
requests. We also sell / buy all boxes and parts that HP made for the 
HP-UX / Unix (PA-RISC & ia64) line.

PA-RISC
www.ebay.com/itm/385130495455
www.ebay.com/itm/384211227917

IA64
www.ebay.com/itm/384272059488
www.ebay.com/itm/384211228177

IA64 - For Telco / Data Center users / 48v DC
www.ebay.com/itm/384966825704

Thanks
Jesse Dougherty
Resellers of HP hardware
Jesse@cypress-tech.com
www.cypress-tech.com


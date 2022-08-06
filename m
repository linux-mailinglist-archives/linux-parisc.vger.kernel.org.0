Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A9258B3A9
	for <lists+linux-parisc@lfdr.de>; Sat,  6 Aug 2022 06:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237015AbiHFEWY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-parisc@lfdr.de>); Sat, 6 Aug 2022 00:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233185AbiHFEWW (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Aug 2022 00:22:22 -0400
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 05 Aug 2022 21:22:21 PDT
Received: from lvs-smtpgate3.nz.fh-koeln.de (lvs-smtpgate3.nz.FH-Koeln.DE [139.6.1.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414D0167F3
        for <linux-parisc@vger.kernel.org>; Fri,  5 Aug 2022 21:22:20 -0700 (PDT)
Message-Id: <c8230b$21k9pj@smtp.intranet.fh-koeln.de>
X-IPAS-Result: =?us-ascii?q?A2D//wCU6+1iKtLeBosRCj8cAQEBKwsGAQEEBAEBAgEBB?=
 =?us-ascii?q?wEBFYFPAgEBGQgBgRYCAQEBAQEBSgEBAQGBE4EsAQErhE6DT4hPI4MgAYEpg?=
 =?us-ascii?q?nWLFoFjBQIBAYIpjFkLAQEBAQEBAQEBCRICJQkEAQGFBAFTAQEBAQeEHyY3B?=
 =?us-ascii?q?g4BAgQBAQEBAwIDAQEBAQEBAwEBCAEBAQEGBAcBAQEBAUhIhS85DV8BAQGBD?=
 =?us-ascii?q?DQBAQGEEAEBAQYBAQErayACGQ0CRQQWRwEBAQGCRkUBAQGCJQEBMxOCdJ9Bh?=
 =?us-ascii?q?2GBMYEBgimBJgGBC4IpBYJygRcqAgEBAQEBAQEBh2uQXIEPAQKFGB0TglIEm?=
 =?us-ascii?q?CkCAho4AzQRHjcLA10ICRcSIAIEERoLBgMWPgkCBA4DQAgNAxEEAw8YCRIIE?=
 =?us-ascii?q?AQGAzEMJQsDFAwBBgMGBQMBAxsDFAMFJAcDHA8jDQ0EHx0DAwUlAwICGwcCA?=
 =?us-ascii?q?gMCBhUGAgJOOQgECAQrJA8FAgcvBQQvAh4EBQYRCAIWAgYEBAQEFgIQCAIIJ?=
 =?us-ascii?q?xcHEzMZAQVZEAkhHAkfEAUGEwMgbwVFDygzNTwrHxsKYCcLKicEFQMEBAMCB?=
 =?us-ascii?q?hMDAyICEC4xAxUGKRMSLQkqdQkCAyJuAwMEKC4DCUAHCSYsPQUFRz4PlnmCE?=
 =?us-ascii?q?IE4AjCHC41Cg2UFilagWwcDg1GBRAKTfowogkaSdA4EkX0JhW+EdowSp1iBd?=
 =?us-ascii?q?4F/cIFuCSWBG1EZD5ISil90AjkCBgEKAQEDCYxlgQqBGAEB?=
IronPort-Data: A9a23:fbJOaa2yLw0DdJSftPbD5UB2kn2cJEfYwER7XKvMYLTBsI5bp2APz
 mQZCzvXO6zZYGf8KdkgPdnj8kIO75fUm4MwQAdp3Hw8FHgiRegppDi6wuUcGwvIc6UvmWo+t
 512huHodZxyFDmEzvuUGuCJhWFm0q2VTabLBufBOyRgLSdpUy5JZShLwobVv6Yx6TSHK1LV0
 T/Ni5CHULOV82YcGn4Z7auFtCRusJza0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElU1X/saIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt+9gz
 NRHlZOickQkA73GhtYFYkNdKxgraMWq+JefSZS+mem65BSbXSCq3e1oSk82eI4f9+JxR21Dn
 RAaAGlWP1bdwbjsmvThE7EEascLdaEHOKsas3pjwDfLDPtgXY3fX6HHzdRRmi0qwMtJGJ4yY
 uJHOWo1NkSbPnWjPH82V8oPwv7w2UXVWCJ3rlDNjKozuUzcmVkZPL/FaoOOI4faFK25hH2wr
 GLP5X7+GREyLNWZwCGM6TSngeqntTjwWJ0bHpW89/h3kBiWmDwQThoMWjOTrOGwkE+lc8hSJ
 0wd5mwlqq1a3E6uScPnXgaQpneBsx9aXMBfe8U24R+AyILO7gqZD3RCRTlEAPQls8k3Xjwrk
 EWYgsj0BjFHtLSfD3SB6vGfqnWwIUA9Ln4GaAceQAcF6sWlq4Y25jrAS4w+SvbrptfyHDv5z
 zGO6ik4ia8agcMC2+O851+vqzCmq4XNTwU1zgPQQG+h6kVyY4vNT5av41XB8bBaLY2ZUlSbl
 HEBl46V6+VmJZSHvCaQG/4GHPel6p6tMyzYjHZqFJwo7Sis/TiodOh45DB4OVcsKs8eeCTiS
 FHctBkX55JJOnauK6htbOqZDsMs1rT6PdHiUOvIdJxDf/BZdgiH+mdxZEqU3mnoi2A0nL02P
 ZCUcNbqBnEfYYx1zDOwSP4c2LkkgCojzGr7SpXyzhDh2r2bDFaQUq8MNlSmZfsy6L6O5hjK+
 spSLc+NzFNUWYXWbzPW+sgfMFUDP3UnLZ/zos1TMOWEJ2JOAmglBdfVwLU8a8lgnrxO0ODS8
 RmVXEJZzFDXnmDcJEOGZxhehKjHRcwl9yhiZWoyJVDt12klJ4ivqaQYep8xO7UqnAB+8RJqZ
 8YUf8SKIvtdcXfKxiQXc6vlndZnTC3+0GpiIBGZjCgDk49IHlKUq4G6I1S2qEHiHQLq7Zpk8
 uLIOhfzH8tfF1UK4NP+NarH8r+ngZQKsM5fN6ciCvJUfELj9oUCx8fZ06dpfJ9kxfnr4DyAy
 wbeOxcZo+SInIIu7MHJjKSFpu+U/wpC8qlyRjezAU6eb3Wyw4Za6dYovBy0VT7cTnjo366pe
 P9YyfrxWNVewgsb7NAgSe0ylP5kjzcKm1O85ls6dJksRwvwYo6M3lHcgZYnWlBlme4J6VrnA
 CpjBPEHYOnWY6sJ72L91CJ/N7/ajqFF8tUjxfg4PVnh7y965/KJVl9JNBmRjiNGKrZpIusYL
 RQJ56YrB/iEokt0WutqewgRqjTkwoooAvh85/n3webD02IW9721ScWEVXWusMDVO4sk34tDC
 mb8uZcuTo90niLqG0ff31CUtQaBrfziYCx38WI=
IronPort-HdrOrdr: A9a23:1vx/EqsBgyoFPbV8Sc34XUYf7skDYdV00zEX/kB9WHVpmgXxra
 yTdZMguCMc6Qx7ZJhOo7C90cW7IE80lqQe3WB5B97LYOCBghrKEGmmhrGSpgEIcBeQygcy78
 ldmtNFeb/NMWQ=
X-IronPort-Anti-Spam-Filtered: true
THK-HEADER: Antispam--identified_spam--outgoing_filter
Received: from p222210.vpn-dyn.fh-koeln.de (HELO MAC15F3.vpn.fh-koeln.de) ([139.6.222.210])
  by smtp.intranet.fh-koeln.de with ESMTP/TLS/DHE-RSA-AES128-SHA; 06 Aug 2022 06:21:13 +0200
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: Charity Donation
To:     You <mackenzie.tuttle@ca.rr.com>
From:   "MacKenzie Scott" <mackenzie.tuttle@ca.rr.com>
Date:   Sat, 06 Aug 2022 05:21:11 +0100
Reply-To: mackenzie-tuttle@californiamail.com
X-Priority: 1 (High)
Sensitivity: Company-Confidential
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,MSGID_FROM_MTA_HEADER,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,
  My name is MacKenzie Scott Tuttle; I'm a philanthropist and founder of one of the largest private foundations in the world. I'm on a mission to give it all away as I believe in ‘giving while living.’ I always had the idea that never changed in my mind — that wealth should be used to help each other, which has made me decide to donate to you. Kindly acknowledge this message and I will get back to you with more details.

Visit the web page to know more about me: https://www.nytimes.com/2022/04/10/business/mackenzie-scott-charity.html

Regards,
MacKenzie Scott Tuttle.

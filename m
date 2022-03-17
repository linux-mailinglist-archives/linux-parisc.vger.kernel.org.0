Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476BA4DD04C
	for <lists+linux-parisc@lfdr.de>; Thu, 17 Mar 2022 22:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiCQVlD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 17 Mar 2022 17:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbiCQVlC (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 17 Mar 2022 17:41:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1CB17AD9D
        for <linux-parisc@vger.kernel.org>; Thu, 17 Mar 2022 14:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1647553152;
        bh=0PJwhDcPT4q6hLpZpqi0dkVaAcV6QaQtBjjxXeesr9U=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=k6SA9aj8hVRRMGZvHIvQo8L0Rt1b1yOMBuedlscsDy6yLem/5vqHJh5vszvzK18in
         PtrGKvY3giJDbNI14v4IcUAkGTt2FvnXHBOdcXLqV1EoXisQCjTXR1tRuyjXy8K+4g
         kOe0iclxD8GaS9RUC7/gc9P0VwlWPM6YpBcJ3jzQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.128.131]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1nbKf03DM9-00XOcv; Thu, 17
 Mar 2022 22:39:11 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: [PATCH] parisc: Enable ARCH_HAS_DEBUG_VM_PGTABLE
Date:   Thu, 17 Mar 2022 22:39:08 +0100
Message-Id: <20220317213908.105654-1-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CqsQsk3nEXG+Nl/CEzv4m7W5xtjsmEzTGIl37RYuX7Jlla5XvRQ
 +rJZGtDAeHHGFqNpAB9F+S5FvPuXKxFEopEMT+7ifOpDSlQrzuJwNHWcOgQLcKU9zRWZ5td
 VCFmAxlJ7qzq6qBURCZQ0dLm1Evzr/p6eIvQIoWjFOP6lyuuB1AeedCb6GRiqQA9Vy777XB
 moFd63L8OzpDYzqGHHO8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4TlLrWjcT40=:zpNXDc/HB5jJ/Ul3unKhwQ
 MFW8AiIFT8zHT6vjuCQ7FCwqusY0kN6BLVGLEC/KYago2lVQOaXLKhPrkcG89hX/eZeuLBARE
 97llRvK7LKZzrD2SZHhbogGDE0Ys0ZjNbr6YDH9ayEaHrlTa2ZboiV3LRUNivlCmekFXXoF+U
 Ts3nqla3tGnWn8XC2fAnbQuzbqXYGGSZSjzpbTP1DDN9MlsXEZWga9U7eKk45J7BAIG7jfjLT
 d52RfBsIAraIErzEewRpJOBP3KT7GbCs1E4GC5hiTuQu3NUTjpUfCYNLYKCqqR7iQQt0plNEL
 Vgjg3wFCdbCsPistN7LbpiPZ/HTTgQ/thP9v4rZhELyGI4PaVQQVtLUdvzTQENCrxmLXbkyom
 /kbmaxuQFpexPOMiZbPmO9C2T1szl0ypea5wepp3I1ol9WoEAsBmQuJhKPpuBstJbVHnr6Ea5
 5mE2C+A0l1vxqymf9Fl7pPkuWrni1bAkffd/QXgh+CQr+A0NZjjX02oOlpPPm2QNeUspz9Upa
 4aasbngrKrdVGn8ZjIeEJEDnGgYq7ihylmXvIdOce2OANqmL8kQ9XkbTuuTLaWfgvCbfv5nFR
 mCyt8twr9fPDiz80bP1qZIPPMsVkwn1/EgPWS6rQXErSFxtNa/l5KY7PzG5LZjvyBbK4tzI7P
 IZy/iG0AxY0V26ZQU7a4MQBxvcDn4GJ64A//wJd0TXCC7PuwJLdZr8kl1rTHSa8v6z0pE9f/r
 O64bI9Xg99OKHIYAEjbw+gllJy0qw9lRUQkV2Ykg3NT4AH1wkpA++R/MdPuPtnNxfgp0c6WNh
 WwHdZ7bAWGhXfGAtkLxH920+AldKxFscDXu2XH2nwitoi9xWzsWtdZQCNnKzAwwk28lmjKKdN
 q8iZvjHC51NSQ2dSmezRJH7mZ4+azDdRSQdsH3AbIjk2wCr2YkZF1jLU8eaIBcy5BlHXakp4o
 84BI223ox+A2vi4EyUJiSQHVcUAb43p+V2CeQxrrXAlx5xSIBmvTQuRB9VBIS0ttOVwX0Q8MH
 +JK2a95FkFUpYnJhFNKOC2tLtXd6Dizhjxnh7QXTUKu0S2Pv20CbLRVOWfoFMnTRpo7Z1KesE
 5IgiSqXpiFtj2E=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Allow to enable page table boot-up checks.

Suggested-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/parisc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index fbb114049a6b..864b4756dcdf 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -15,6 +15,7 @@ config PARISC
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_STACKWALK
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select HAVE_RELIABLE_STACKTRACE
 	select DMA_OPS
 	select RTC_CLASS
=2D-
2.34.1


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79415395D0
	for <lists+linux-parisc@lfdr.de>; Tue, 31 May 2022 20:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346776AbiEaSCu (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 31 May 2022 14:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbiEaSCu (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 31 May 2022 14:02:50 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED2D7CB0F
        for <linux-parisc@vger.kernel.org>; Tue, 31 May 2022 11:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654020160;
        bh=XK5iBGXgD2hJobay3KxfqsEuB8V6iGGapFvTuN9HE2A=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=RwjsxYgmG0OzrI6jBYvmTTQjObdJRNF/9sC7gORRpEEoRoqc735VKPlqn3NOQugdf
         BBo8E2b4E9JEvocn8ZiyOeKKKAetMixyiMVRcDBSQAEYpaQTfXQSsUEbiPZMj23Sw1
         5UC2t/jWZuRKp6eZ9BiDsh/YiuCqocE+XMs5BjI0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.178.167]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulqN-1neIV92GIt-00rq60; Tue, 31
 May 2022 20:02:40 +0200
Date:   Tue, 31 May 2022 20:02:38 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] Drop CONFIG_SCHED_MC
Message-ID: <YpZYPokZr9s4uwtt@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:h0oqw+SEInTAatQYWrWlE+FEiT598A/26eWfI0C7/jNqqD2Ekf5
 TMFH0M0sWhLrlNhJvRzTRDjS+sDjjbgbBGg1OlRvQUBka9vkIpae6MjSusPslTpm6ZRTzc2
 qu+x/9EaSiinczBS5VS88NxdlevyQOPQed9DxZ/lg/e+xOf0BN58DGH7Uk/sEOG/1Sx1TdT
 eyby4P6S0WoWwgnIBsH1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VFZrgkY2jNY=:yfbcDpVTlAlOVi9w8Q7BQb
 CDR2WQTNejwaXWqKayrOFK3SRiCU6DBgTCtHJAE/MVe5u1MQ4LZWXbnLTftA7JQb0Dqm/YfvX
 XOShgXaN210BKnCzT24NmK2Qg8UEnh980RYFy0opDO3VkH/GwqoJGqebxCwDKVIJRASpF67WG
 45MQnOaFqEWSN9d4y42o1CuwQDSlq0vN3dWphDfsXPqlJjRd+JyngNxN1nmeT60epnzJr73f8
 7iA3e6xb2qaRDumKkLCMfWayHbXIbBa6N6cXNgCLlQdlJp163XbRyI9mDkPf0ms0AdMOIb213
 bd5EzuE49upOrpk8vgNHLlexToxw3wSKGF6J6wkNTBf1v0S2eWaIV4rzVrcfHvHsU8lFvQKw1
 3z0ECx3UjN/781QMMc2+keRd3nEo0S06Q0X32VCn3V/TmkIvRFgG4NRXpaWeZO70+uB3glDkh
 fNa/y2pQX3bYT9WTdwJUYXW4IRMHL9N024/Rl76yGY2spQ4Wjdzfzdan5q4VYR1BlE/mJJfK/
 3/ySbDgQ+IjUCOS2w47me4xip+IH0d7FtCeFpZt+xtX4LkniWtljwAZUSQyP+i+ThyPbGgzms
 pj/s09S6rYWfE2rdFDN0UrQhadEzHvcRr2H3d89fDahLa6ombe07O+edn3S7oTxZ8N+I03rQd
 S07+OG8QEbsHIj2d+DFhWF99wE5K8ie25NYcF9ftXerrBLBmutrbFKtzuxDXlMRJb/JumUzoB
 5Ob4Bteu11ie0s3tZ64HdHxUhWEfaSZaukDrYH9QKhzrf97MZzM/HO+/P5LlEVzm4DIUPlesn
 EITy/TUv9khqmkFwwpfAkMPyRc4YMSD98o6gQd6cgKS4BiyPYwVcEOGBHjwvTnC0JUc11hyO4
 u+3S2vRWFKbm2v88crfDalAG6NB7tWFEuhMeCZwSQtY421sm02dnYF2Ay9N6PJPlHIujGqh24
 tesubIzi95RwGwYKf5l63y+ax/z5myHst30ZQV7JQrtLq6/v1rkhsDMQm54aS1/PW8ocClVFP
 BI8zh4BuoaunRlgdGT6zgF6ix3mZWEMylrMh14q9BEwSvBHB9dibemCUqYzN3jbmLQ24MKETN
 VlV9qpNjaltB1USaK5uFKaZ0dQpgIaYo4dBws4AqrGnAHmxUvYH6LEOKA==
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Mikulas noticed that the parisc kernel crashes in sd_init() if
CONFIG_SCHED_MC is enabled.
Multicore-scheduling is probably not very useful on parisc, so simply
drop this option.

Signed-off-by: Helge Deller <deller@gmx.de>
Noticed-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: <stable@vger.kernel.org> # 5.18

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index bd22578859d0..34591a981cb7 100644
=2D-- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -281,14 +281,6 @@ config SMP

 	  If you don't know what to do here, say N.

-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on GENERIC_ARCH_TOPOLOGY && PA8X00
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config IRQSTACKS
 	bool "Use separate kernel stacks when processing interrupts"
 	default y
diff --git a/arch/parisc/kernel/topology.c b/arch/parisc/kernel/topology.c
index 9696e3cb6a2a..71a678ceb33a 100644
=2D-- a/arch/parisc/kernel/topology.c
+++ b/arch/parisc/kernel/topology.c
@@ -81,10 +81,6 @@ void store_cpu_topology(unsigned int cpuid)
 }

 static struct sched_domain_topology_level parisc_mc_topology[] =3D {
-#ifdef CONFIG_SCHED_MC
-	{ cpu_coregroup_mask, cpu_core_flags, SD_INIT_NAME(MC) },
-#endif
-
 	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
 	{ NULL, },
 };

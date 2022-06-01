Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D587E53A96B
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Jun 2022 16:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245525AbiFAOyO (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Jun 2022 10:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241149AbiFAOyN (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Jun 2022 10:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8B11264BD6
        for <linux-parisc@vger.kernel.org>; Wed,  1 Jun 2022 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654095251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4OlADR47jIHXyCalLFaoHj71W3xclrBvMra2NPvFxEQ=;
        b=MPa6QitNNOGklK4ixSkW6siIsWHAhGPEz/cp89hvBaRLJB8ZtQ8iMGeyIRBZ+Msv7BUxEp
        4qSJjfUZXocyJNw8Zhou8SqJ3iLtiCBCgw2lWafuRFZgIZRrmiIYdINfShiTTUHO+mwGHL
        QghMVUYfwGLG3iR5W4yftksYuau+DCc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-N4rAK0hlMuSQf6nZZ_V48Q-1; Wed, 01 Jun 2022 10:54:09 -0400
X-MC-Unique: N4rAK0hlMuSQf6nZZ_V48Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E8401C051A2;
        Wed,  1 Jun 2022 14:54:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 137611410F36;
        Wed,  1 Jun 2022 14:54:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 251Es9eT020829;
        Wed, 1 Jun 2022 10:54:09 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 251Es8jn020825;
        Wed, 1 Jun 2022 10:54:08 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 1 Jun 2022 10:54:08 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] Drop CONFIG_SCHED_MC
In-Reply-To: <alpine.LRH.2.02.2206010911370.15916@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2206011053050.20771@file01.intranet.prod.int.rdu2.redhat.com>
References: <YpZYPokZr9s4uwtt@p100> <alpine.LRH.2.02.2206010911370.15916@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Wed, 1 Jun 2022, Mikulas Patocka wrote:

> 
> 
> On Tue, 31 May 2022, Helge Deller wrote:
> 
> > Mikulas noticed that the parisc kernel crashes in sd_init() if
> > CONFIG_SCHED_MC is enabled.
> > Multicore-scheduling is probably not very useful on parisc, so simply
> > drop this option.
> > 
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Noticed-by: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: <stable@vger.kernel.org> # 5.18
> 
> Hi
> 
> I think that we should fix the root cause instead of trying to treat the 
> symptoms.
> 
> Some more testing showed that:
> 
> in sd_init: tl->mask(cpu) returns an empty mask
> tl->mask is cpu_coregroup_mask
> in cpu_coregroup_mask: cpu_topology[cpu].core_sibling is an empty mask, 
> that gets returned to sd_init
> 
> In arch/parisc/kernel/topology.c:
> init_cpu_topology is called before store_cpu_topology, but it depends on 
> the variable dualcores_found being set by store_cpu_topology. Thus, it is 
> not set.
> 
> store_cpu_topology returns if cpuid_topo->core_id != -1, but during boot, 
> store_cpu_topology is called before reset_cpu_topology, thus the member 
> "core_id" is uninitialized zero and store_cpu_tolopogy does nothing.
> 
> If these issues are addrssed, multicore scheduling will work.

I've found that this fixes it.

Mikulas


---
 arch/parisc/kernel/topology.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: linux-2.6/arch/parisc/kernel/topology.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/topology.c	2022-06-01 15:32:59.000000000 +0200
+++ linux-2.6/arch/parisc/kernel/topology.c	2022-06-01 16:47:36.000000000 +0200
@@ -95,7 +95,8 @@ static struct sched_domain_topology_leve
  */
 void __init init_cpu_topology(void)
 {
+	reset_cpu_topology();
 	/* Set scheduler topology descriptor */
-	if (dualcores_found)
+	/*if (dualcores_found)*/
 		set_sched_topology(parisc_mc_topology);
 }


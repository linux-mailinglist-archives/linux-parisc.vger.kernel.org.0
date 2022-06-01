Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE41053A618
	for <lists+linux-parisc@lfdr.de>; Wed,  1 Jun 2022 15:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353280AbiFANnE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 1 Jun 2022 09:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242256AbiFANnD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 1 Jun 2022 09:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 302B740E42
        for <linux-parisc@vger.kernel.org>; Wed,  1 Jun 2022 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654090980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FIuCLz5i+VpXo13Nuz8lpItMFenKOcc4BytBdcJ8r0Q=;
        b=an5nVw6OXIasIULWTYBbfTNxdljh/G6klMMscqeju3aXqMW79VRcBntHdcge97yQtwBTYQ
        h6inAOibN+hD9UIIMhlhILZfb7GzrfWZmffetXU5O+ku1AKfUy4VgACdu+H2yoan1Cv+Mu
        1AenS0SwvJzJrxvsFAj0EmulCsodgTU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-oPm11EyGP_ivkS2ZEImTBg-1; Wed, 01 Jun 2022 09:42:57 -0400
X-MC-Unique: oPm11EyGP_ivkS2ZEImTBg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76A7E1C161B6;
        Wed,  1 Jun 2022 13:42:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BACE492CA2;
        Wed,  1 Jun 2022 13:42:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id 251DguJo017437;
        Wed, 1 Jun 2022 09:42:56 -0400
Received: from localhost (mpatocka@localhost)
        by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP id 251Dgtwp017433;
        Wed, 1 Jun 2022 09:42:56 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka owned process doing -bs
Date:   Wed, 1 Jun 2022 09:42:55 -0400 (EDT)
From:   Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To:     Helge Deller <deller@gmx.de>
cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] Drop CONFIG_SCHED_MC
In-Reply-To: <YpZYPokZr9s4uwtt@p100>
Message-ID: <alpine.LRH.2.02.2206010911370.15916@file01.intranet.prod.int.rdu2.redhat.com>
References: <YpZYPokZr9s4uwtt@p100>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



On Tue, 31 May 2022, Helge Deller wrote:

> Mikulas noticed that the parisc kernel crashes in sd_init() if
> CONFIG_SCHED_MC is enabled.
> Multicore-scheduling is probably not very useful on parisc, so simply
> drop this option.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Noticed-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: <stable@vger.kernel.org> # 5.18

Hi

I think that we should fix the root cause instead of trying to treat the 
symptoms.

Some more testing showed that:

in sd_init: tl->mask(cpu) returns an empty mask
tl->mask is cpu_coregroup_mask
in cpu_coregroup_mask: cpu_topology[cpu].core_sibling is an empty mask, 
that gets returned to sd_init

In arch/parisc/kernel/topology.c:
init_cpu_topology is called before store_cpu_topology, but it depends on 
the variable dualcores_found being set by store_cpu_topology. Thus, it is 
not set.

store_cpu_topology returns if cpuid_topo->core_id != -1, but during boot, 
store_cpu_topology is called before reset_cpu_topology, thus the member 
"core_id" is uninitialized zero and store_cpu_tolopogy does nothing.

If these issues are addrssed, multicore scheduling will work.

Mikulas


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5389B19C6F4
	for <lists+linux-parisc@lfdr.de>; Thu,  2 Apr 2020 18:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389820AbgDBQUA (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 2 Apr 2020 12:20:00 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44769 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389796AbgDBQT6 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 2 Apr 2020 12:19:58 -0400
Received: by mail-qk1-f195.google.com with SMTP id j4so4505547qkc.11
        for <linux-parisc@vger.kernel.org>; Thu, 02 Apr 2020 09:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=hxf9moS4Fx5cYinkxtKnKXZUbKH1kCLQlOUICyLrcAQ=;
        b=N69s+eopVKPjt9Ak3LJWLduGUIkLlf6HHcv65RpJVSxl05EWhWEmdw9z4801LmN+u9
         k2MqUvT/h7DlzYLWWppX2sDw61SpC9vAV7Po+V6Xq+bFILdWRoCDsGAmL4n5WMJHDr1y
         rh6CCqO368IvkScTluhEX7tztJbuoQGCqzdUp5ObEHNV4pK2ENnkP+uNPbB4uuXmg1hA
         Ka1RYp9i1NfLgd5JgqI6T4ABs6AL0yNsEipKPdyOGtqlaS49U9nOoM5JFqumiTxEjs82
         QVGf+jmTvBrbwx7AT6eyfaqHE/40pUbVjxK6tvuqSkNV6lVNlFPOrFs9hg+9BMCCP7wh
         wZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=hxf9moS4Fx5cYinkxtKnKXZUbKH1kCLQlOUICyLrcAQ=;
        b=dm1kAg8oFDunPEoboUYdTQmevkEfnMuDQb5cJaGu3qDioKtRD9+KGcoy/e9MfnMhrN
         PjA5frUudxtjJp0cBAHWPaFclR434uIGEsAW+zB53KOBm2RyRNcF6ABLklqnFzy2RZAq
         ziVRR43vdtglAKqUggc4Peoxb21m4z4VYcUrBM/E8WHIrfA/D/K2uLdaiFQuJQcvcyju
         OPKsamSQqg5KDjgAPb/Gsbb+lyDnL0OoRoiob3oaoDRI5BNgcN7iyspkgr0bV9v37uYw
         3FoWP1xp50kvViRZIfzv3lg6yD0ECEWjZG8SXUkk6+gsVGvdPZFvQSTZg5bAXfhHB5Mg
         GX/g==
X-Gm-Message-State: AGi0PuaLxx6qV8lq1MBwmNersyRAANg/wRCTr6zwRFEjBTpzAnGsN1wV
        zIEVjb0qKVr/wRnqJFBo9l2R4dKFaNJ6Pg==
X-Google-Smtp-Source: APiQypK7Tvv6yfkAlbuv3Zm98Fh5mhbo2QkHe/iKDQdeZp1Qh9wYR7AKizHCaNBlBQr8zGtGsc6oQQ==
X-Received: by 2002:a37:4648:: with SMTP id t69mr4077821qka.299.1585844396325;
        Thu, 02 Apr 2020 09:19:56 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id o13sm4083358qtk.12.2020.04.02.09.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 09:19:55 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] sched/core: fix illegal RCU from offline CPUs
Date:   Thu, 2 Apr 2020 12:19:54 -0400
Message-Id: <4134872A-3D1D-4860-9C1B-2FD9C00272BB@lca.pw>
References: <20200402155406.GP19865@paulmck-ThinkPad-P72>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, juri.lelli@redhat.com,
        dietmar.eggemann@arm.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        tglx@linutronix.de,
        "James.Bottomley@hansenpartnership.com" 
        <James.Bottomley@hansenpartnership.com>, deller@gmx.de,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200402155406.GP19865@paulmck-ThinkPad-P72>
To:     paulmck@kernel.org
X-Mailer: iPhone Mail (17D50)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org



> On Apr 2, 2020, at 11:54 AM, Paul E. McKenney <paulmck@kernel.org> wrote:
>=20
> I do run this combination quite frequently, but only as part of
> rcutorture, which might not be a representative workload.  For one thing,
> it has a minimal userspace consisting only of a trivial init program.
> I don't recall having ever seen this.  (I have seen one recent complaint
> about an IPI being sent to an offline CPU, but I cannot prove that this
> was not due to RCU bugs that I was chasing at the time.)

Yes, a trivial init is tough while running systemd should be able to catch i=
t as it will use cgroup.=

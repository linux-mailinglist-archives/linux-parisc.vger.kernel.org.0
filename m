Return-Path: <linux-parisc+bounces-1099-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F08A131B
	for <lists+linux-parisc@lfdr.de>; Thu, 11 Apr 2024 13:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39AE9281FC8
	for <lists+linux-parisc@lfdr.de>; Thu, 11 Apr 2024 11:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099D0148858;
	Thu, 11 Apr 2024 11:35:31 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A5145B08;
	Thu, 11 Apr 2024 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712835330; cv=none; b=Hbehevc1NMptQTQf3LGreMFahzHdL70Wkk+NdrRQmXW1AQ+3VBK/iDa3ippdLxIdYHkGRL3WZxoSvRoU4WD8b/H68y4oGgGUkTIWAgAvPYrd5W18Icvr3CkCTXG9pxgQgj6gPjUKwMsH6KXMG15Xk0S/N1Vb/Fy0bFjCrFrhLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712835330; c=relaxed/simple;
	bh=2QoydNUa8ohr5BSqBTKFBG9DaUQmDb6Pl/IqqSheoek=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Siggv+M5vIGlvTY4z9aEuhxh2gsnyc2VMBeiz7H9duYZ4+dwfLobYhJl4M5uqNNyFq3pQoQvFdnjqlvhXVpG4ttlA1Gn82ZGX1E4NnzfNpsVjZgXwZDqTaPkt4GgbHQ8Kp2HKR49SqpkZ8a/Li53/NzSKhFymZtnxWE/sevlz80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VFcyt3VLqz6JB2Q;
	Thu, 11 Apr 2024 19:33:42 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 09DC51400E7;
	Thu, 11 Apr 2024 19:35:25 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 11 Apr
 2024 12:35:24 +0100
Date: Thu, 11 Apr 2024 12:35:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse
	<james.morse@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Luis
	<miguel.luis@oracle.com>
Subject: Re: [PATCH RFC v4 12/15] arm64: psci: Ignore DENIED CPUs
Message-ID: <20240411123523.0000487a@huawei.com>
In-Reply-To: <E1rVDnK-0027ZN-40@rmk-PC.armlinux.org.uk>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
	<E1rVDnK-0027ZN-40@rmk-PC.armlinux.org.uk>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Wed, 31 Jan 2024 16:50:38 +0000
Russell King (Oracle) <rmk+kernel@armlinux.org.uk> wrote:

> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> When a CPU is marked as disabled, but online capable in the MADT, PSCI
> applies some firmware policy to control when it can be brought online.
> PSCI returns DENIED to a CPU_ON request if this is not currently
> permitted. The OS can learn the current policy from the _STA enabled bit.
> 
> Handle the PSCI DENIED return code gracefully instead of printing an
> error.
> 
> See https://developer.arm.com/documentation/den0022/f/?lang=en page 58.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> [ morse: Rewrote commit message ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Jianyong Wu <jianyong.wu@arm.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

This change to return failure from __cpu_up in non error cases exposes
an possible issue with cpu_up() in kernel/cpu.c in that it brings the numa node
before we try (and fail) to bring up CPUs that may be denied.

We could try offlining the numa node on error, or just register it later.

Currently I'm testing this change which I think is harmless for cases that don't
fail the cpu_up()

For the cpu hotplug path note the node only comes online wiht the cpu online, not
the earlier hotplug. Reasonable given there is nothing online in the node before
that point.

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 537099bf5d02..a4730396ccea 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1742,10 +1742,6 @@ static int cpu_up(unsigned int cpu, enum cpuhp_state target)
                return -EINVAL;
        }

-       err = try_online_node(cpu_to_node(cpu));
-       if (err)
-               return err;
-
        cpu_maps_update_begin();

        if (cpu_hotplug_disabled) {
@@ -1760,7 +1756,10 @@ static int cpu_up(unsigned int cpu, enum cpuhp_state target)
        err = _cpu_up(cpu, 0, target);
 out:
        cpu_maps_update_done();
-       return err;
+       if (err)
+               return err;
+
+       return try_online_node(cpu_to_node(cpu));
 }

There is a kicker in the remove path where currently check_cpu_on_node()
checks for_each_present_cpu() whereas to work for us we need to use
for_each_online_cpu() or the node is never removed.

Now my current view is that we should only show
nodes in /sys/bus/nodes/devices/ if there is a CPU online (assuming no other
reasons the node should be online such as memory).
That's easy enough to make work but all I'm really learning is that the semantics
of what is an online form a node point of view is not consistent.

Fixing this will create a minor change on x86 but does anyone really care
about what happens in the offline path wrt to 'when' the node disappears?
I think the corner case is.

1. Add 2 CPUs (A, B) in a CPU only node.
2. Online CPU A - this brings /sys/bus/devices/nodeX online
3. Remove CPU A - no effect because the check for try_remove is on presence and CPU B is
   still present.
4. Online CPU B - no change.
5. Offline CPU B - no change.
4. Remove CPU B - /sys/bus/device/nodeX offline (disappears)

To make it work on arm64 where we never make CPUs not present.

1. Add 2 CPUs (A, B) in a CPU only node.
2. Online CPU A - this brings /sys/bus/devices/nodeX online
3. Remove CPU A - /sys/bus/devices/nodeX offline (disappears)
4. Online CPU B - this brings /sys/bus/device/nodeX online
5. Offline CPU B - no change (node updates only happen in hotplug code)
6. Remove CPU B - /sys/bus/device/nodeX offline (disappears).

Step 5 may seem weird but I think we can't mess with nodes there because
userspace may well rely on them still being around for some reason
(it's a much more common situation).

My assumption is that step3 removing the node isn't going to hurt anyone?

If no one shouts, i'll go ahead with rolling a v5 patch set where this is done.


Jonathan





> Changes since RFC v2
>  * Add specification reference
>  * Use EPERM rather than EPROBE_DEFER
> Changes since RFC v3:
>  * Use EPERM everywhere
>  * Drop unnecessary changes to drivers/firmware/psci/psci.c
> ---
>  arch/arm64/kernel/psci.c | 2 +-
>  arch/arm64/kernel/smp.c  | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index 29a8e444db83..fabd732d0a2d 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -40,7 +40,7 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
>  {
>  	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
>  	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
> -	if (err)
> +	if (err && err != -EPERM)
>  		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
>  
>  	return err;
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 4ced34f62dab..dc0e0b3ec2d4 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -132,7 +132,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  	/* Now bring the CPU into our world */
>  	ret = boot_secondary(cpu, idle);
>  	if (ret) {
> -		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
> +		if (ret != -EPERM)
> +			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
>  		return ret;
>  	}
>  



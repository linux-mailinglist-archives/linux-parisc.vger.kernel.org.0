Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6084C0730
	for <lists+linux-parisc@lfdr.de>; Wed, 23 Feb 2022 02:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236680AbiBWBnz (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Feb 2022 20:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236704AbiBWBnb (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Feb 2022 20:43:31 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7595450B25
        for <linux-parisc@vger.kernel.org>; Tue, 22 Feb 2022 17:43:01 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id i6so13847509pfc.9
        for <linux-parisc@vger.kernel.org>; Tue, 22 Feb 2022 17:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=F+a74sJsxJ77g+BemEuYYYqVa7sDyHAVn+SRp4OqZNw=;
        b=vQb90BqGkEy6TuH7FTEqtR8WXnVEBabOhsj6hVkRx/bP2h/Zpo2qovN0Ufslw2tAqw
         Xp/o2nF6fZ5ljNw/22Mi+qEwnDDp4e95IAfbjWss9H22K+Rpt0J9wHqBXtCHVnd+6GDj
         /VGwfn92emGGKCFnriMx0Rz5oIAvo5pX4DpNnh/P8rfc+BjPa2vtqSMZqG/Aqf0Gqm43
         Re7/1mapw9BXk0FaIO2YaLpQr69uVrLd77ax8piUbB/S63lc6NZRhqSW279ZF308F6iO
         b0dCbusc9k96TbPgzUcMLL6mUaX1kFceHUDTDQhxJVtm9XDCp/Day0+9eTGejJdlEiHt
         Ro4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=F+a74sJsxJ77g+BemEuYYYqVa7sDyHAVn+SRp4OqZNw=;
        b=NJz4kanNRINLYTKWikPktyCzs14IIUOA41hqn3Lzr2XXIZ33uGBCHHYaXjxG+GSy9M
         1Mh/XWTp0L4HlxZ0Gb6X0TrqRiW6GCZxok5H0KQVyt+6PiTSuz2aLcG/6Ok3+joblDzs
         b75MzUoFG7Bq971d/PGxSAkVcv2FM3QP75tUGIEcg/M0ZpKD63msWAGmcYuSM6Uhckh6
         2+ROc6Gwo/TX2pmWPNVp8lKMUA9PU+U4JKX3T6qIGPN8VgOunihsOQgh2EY5Sucr6pK3
         aLj9VlPmMx8wvLuBDfyqxZ75ztxqMMBNUGPxnKRAeaqO6bAzlZ7HW+igCazLPUm2PgPz
         AIdw==
X-Gm-Message-State: AOAM531cxR1BRYgVcLky+Htgym84BfHdTvbd5bbGw1qTR1Vy3pnPu+VR
        uFuGwcI944UGSgCTcs0j47IHPQ==
X-Google-Smtp-Source: ABdhPJzVDoCs7M4zkIBOVqqLqb2HdIUZh9APacQ8FkmlDHncLsDM8344qtGLaROjwe6n3HjN0/OvEA==
X-Received: by 2002:a63:4560:0:b0:370:1f21:36b8 with SMTP id u32-20020a634560000000b003701f2136b8mr21538991pgk.181.1645580580661;
        Tue, 22 Feb 2022 17:43:00 -0800 (PST)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id z14sm19323988pfe.30.2022.02.22.17.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 17:43:00 -0800 (PST)
Date:   Tue, 22 Feb 2022 17:43:00 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 17:41:35 PST (-0800)
Subject:     Re: [PATCH V5 00/21] riscv: compat: Add COMPAT mode support for rv64
In-Reply-To: <20220201150545.1512822-1-guoren@kernel.org>
CC:     guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        anup@brainfault.org, Greg KH <gregkh@linuxfoundation.org>,
        liush@allwinnertech.com, wefu@redhat.com, drew@beagleboard.org,
        wangjunqiang@iscas.ac.cn, Christoph Hellwig <hch@lst.de>,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org, guoren@linux.alibaba.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     guoren@kernel.org
Message-ID: <mhng-36783ff3-37c2-454b-9337-8cb124195255@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 01 Feb 2022 07:05:24 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Currently, most 64-bit architectures (x86, parisc, powerpc, arm64,
> s390, mips, sparc) have supported COMPAT mode. But they all have
> history issues and can't use standard linux unistd.h. RISC-V would
> be first standard __SYSCALL_COMPAT user of include/uapi/asm-generic
> /unistd.h.

TBH, I'd always sort of hoped we wouldn't have to do this: it's a lot of 
ABI surface to keep around for a use case I'm not really sure is ever 
going to get any traction (it's not like we have legacy 32-bit 
userspaces floating around, the 32-bit userspace is newer than the 
64-bit userspace).  My assumption is that users who actually wanted the 
memory savings (likely a very small number) would be better served with 
rv64/ilp32, as that'll allow the larger registers that the hardware 
supports.  From some earlier discussions it looks like rv64/ilp32 isn't 
going to be allowed, though, so this seems like the only way to go.

I've left some minor comments, and I saw some unresolved ones as well.  
I'm going to assume there'll be a v6, but LMK if you want me to deal 
with cleaning things up.

I'm OK targeting this for 5.18, assuming the cleanups can be resolved in 
the next week or two: generally with a lot of ABI surface I'd prefer to 
let things sit on for-next for a whole cycle, but I don't think it's a 
stretch to say that the actual ABI here is the rv32 port and that 
rv64/COMPAT=y is just our best attempt at matching it.

It's probably worth running at least the glibc test suite, just to see 
if there's anything obvious that's failing.

> The patchset are based on v5.17-rc2, you can compare rv64-compat32
> v.s. rv32-whole in qemu with following step:
>
>  - Prepare rv32 rootfs & fw_jump.bin by buildroot.org
>    $ git clone git://git.busybox.net/buildroot
>    $ cd buildroot
>    $ make qemu_riscv32_virt_defconfig O=qemu_riscv32_virt_defconfig
>    $ make -C qemu_riscv32_virt_defconfig
>    $ make qemu_riscv64_virt_defconfig O=qemu_riscv64_virt_defconfig
>    $ make -C qemu_riscv64_virt_defconfig
>    (Got fw_jump.bin & rootfs.ext2 in qemu_riscvXX_virt_defconfig/images)
>
>  - Prepare Linux rv32 & rv64 Image
>    $ git clone git@github.com:c-sky/csky-linux.git -b riscv_compat_v5 linux
>    $ cd linux
>    $ echo "CONFIG_STRICT_KERNEL_RWX=n" >> arch/riscv/configs/defconfig
>    $ echo "CONFIG_STRICT_MODULE_RWX=n" >> arch/riscv/configs/defconfig
>    $ make ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu- O=../build-rv32/ rv32_defconfig
>    $ make ARCH=riscv CROSS_COMPILE=riscv32-buildroot-linux-gnu- O=../build-rv32/ Image
>    $ make ARCH=riscv CROSS_COMPILE=riscv64-buildroot-linux-gnu- O=../build-rv64/ defconfig
>    $ make ARCH=riscv CROSS_COMPILE=riscv64-buildroot-linux-gnu- O=../build-rv64/ Image
>
>  - Prepare Qemu: (made by LIU Zhiwei <zhiwei_liu@c-sky.com>)
>    $ git clone git@github.com:alistair23/qemu.git -b riscv-to-apply.for-upstream linux
>    $ cd qemu
>    $ ./configure --target-list="riscv64-softmmu riscv32-softmmu"
>    $ make
>
> Now let's compare rv32-compat with rv32-native memory footprint. Kernel with rv32 = rv64
> defconfig, rootfs, opensbi, Qemu are the same.
>
>  - Run rv64 with rv32 rootfs in compat mode:
>    $ ./build/qemu-system-riscv64 -cpu rv64,x-h=true -M virt -m 64m -nographic -bios qemu_riscv64_virt_defconfig/images/fw_jump.bin -kernel build-rv64/Image -drive file qemu_riscv32_virt_defconfig/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -append "rootwait root=/dev/vda ro console=ttyS0 earlycon=sbi" -netdev user,id=net0 -device virtio-net-device,netdev=net0
>
> QEMU emulator version 6.2.50 (v6.2.0-29-g196d7182c8)
> OpenSBI v0.9
> [    0.000000] Linux version 5.16.0-rc6-00017-g750f87086bdd-dirty (guoren@guoren-Z87-HD3) (riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.37) #96 SMP Tue Dec 28 21:01:55 CST 2021
> [    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
> [    0.000000] Machine model: riscv-virtio,qemu
> [    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
> [    0.000000] printk: bootconsole [sbi0] enabled
> [    0.000000] efi: UEFI not found.
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    [mem 0x0000000080200000-0x0000000083ffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000080200000-0x0000000083ffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x0000000083ffffff]
> [    0.000000] SBI specification v0.2 detected
> [    0.000000] SBI implementation ID=0x1 Version=0x9
> [    0.000000] SBI TIME extension detected
> [    0.000000] SBI IPI extension detected
> [    0.000000] SBI RFENCE extension detected
> [    0.000000] SBI v0.2 HSM extension detected
> [    0.000000] riscv: ISA extensions acdfhimsu
> [    0.000000] riscv: ELF capabilities acdfim
> [    0.000000] percpu: Embedded 17 pages/cpu s30696 r8192 d30744 u69632
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 15655
> [    0.000000] Kernel command line: rootwait root=/dev/vda ro console=ttyS0 earlycon=sbi
> [    0.000000] Dentry cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]       fixmap : 0xffffffcefee00000 - 0xffffffceff000000   (2048 kB)
> [    0.000000]       pci io : 0xffffffceff000000 - 0xffffffcf00000000   (  16 MB)
> [    0.000000]      vmemmap : 0xffffffcf00000000 - 0xffffffcfffffffff   (4095 MB)
> [    0.000000]      vmalloc : 0xffffffd000000000 - 0xffffffdfffffffff   (65535 MB)
> [    0.000000]       lowmem : 0xffffffe000000000 - 0xffffffe003e00000   (  62 MB)
> [    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
> [    0.000000] Memory: 52788K/63488K available (6184K kernel code, 888K rwdata, 1917K rodata, 294K init, 297K bss, 10700K reserved, 0K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
> [    0.000000] rcu:     RCU debug extended QS entry/exit.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] riscv-intc: 64 local interrupts mapped
> [    0.000000] plic: plic@c000000: mapped 53 interrupts with 1 handlers for 2 contexts.
> ...
> Welcome to Buildroot
> buildroot login: root
> # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdcsuh
> mmu             : sv48
>
> # file /bin/busybox
> /bin/busybox: setuid ELF 32-bit LSB shared object, UCB RISC-V, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-riscv32-ilp32d.so.1, for GNU/Linux 5.15.0, stripped
> # ca[   78.386630] random: fast init done
> # cat /proc/meminfo
> MemTotal:          53076 kB
> MemFree:           40264 kB
> MemAvailable:      40244 kB
> Buffers:             236 kB
> Cached:             1560 kB
> SwapCached:            0 kB
> Active:             1700 kB
> Inactive:            516 kB
> Active(anon):         40 kB
> Inactive(anon):      424 kB
> Active(file):       1660 kB
> Inactive(file):       92 kB
> Unevictable:           0 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 0 kB
> Writeback:             0 kB
> AnonPages:           444 kB
> Mapped:             1188 kB
> Shmem:                44 kB
> KReclaimable:        952 kB
> Slab:               5744 kB
> SReclaimable:        952 kB
> SUnreclaim:         4792 kB
> KernelStack:         624 kB
> PageTables:          156 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:       26536 kB
> Committed_AS:       1748 kB
> VmallocTotal:   67108863 kB
> VmallocUsed:         652 kB
> VmallocChunk:          0 kB
> Percpu:               80 kB
> #
>
>  - Run rv32 with rv32 rootfs:
>    $ ./build/qemu-system-riscv32 -cpu rv32,x-h=true -M virt -m 64m -nographic -bios qemu_riscv32_virt_defconfig/images/fw_jump.bin -kernel build-rv32/Image -drive file qemu_riscv32_virt_defconfig/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -append "rootwait root=/dev/vda ro console=ttyS0 earlycon=sbi" -netdev user,id=net0 -device virtio-net-device,netdev=net0
>
> QEMU emulator version 6.2.50 (v6.2.0-29-g196d7182c8)
> OpenSBI v0.9
> [    0.000000] Linux version 5.16.0-rc6-00017-g750f87086bdd-dirty (guoren@guoren-Z87-HD3) (riscv32-buildroot-linux-gnu-gcc.br_real (Buildroot 2021.11-201-g7600ca7960-dirty) 10.3.0, GNU ld (GNU Binutils) 2.36.1) #7 SMP Tue Dec 28 21:02:21 CST 2021
> [    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80400000
> [    0.000000] Machine model: riscv-virtio,qemu
> [    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
> [    0.000000] printk: bootconsole [sbi0] enabled
> [    0.000000] efi: UEFI not found.
> [    0.000000] Zone ranges:
> [    0.000000]   Normal   [mem 0x0000000080400000-0x0000000083ffffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000080400000-0x0000000083ffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000080400000-0x0000000083ffffff]
> [    0.000000] SBI specification v0.2 detected
> [    0.000000] SBI implementation ID=0x1 Version=0x9
> [    0.000000] SBI TIME extension detected
> [    0.000000] SBI IPI extension detected
> [    0.000000] SBI RFENCE extension detected
> [    0.000000] SBI v0.2 HSM extension detected
> [    0.000000] riscv: ISA extensions acdfhimsu
> [    0.000000] riscv: ELF capabilities acdfim
> [    0.000000] percpu: Embedded 12 pages/cpu s16600 r8192 d24360 u49152
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 15240
> [    0.000000] Kernel command line: rootwait root=/dev/vda ro console=ttyS0 earlycon=sbi
> [    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]       fixmap : 0x9dc00000 - 0x9e000000   (4096 kB)
> [    0.000000]       pci io : 0x9e000000 - 0x9f000000   (  16 MB)
> [    0.000000]      vmemmap : 0x9f000000 - 0x9fffffff   (  15 MB)
> [    0.000000]      vmalloc : 0xa0000000 - 0xbfffffff   ( 511 MB)
> [    0.000000]       lowmem : 0xc0000000 - 0xc3c00000   (  60 MB)
> [    0.000000] Memory: 51924K/61440K available (6117K kernel code, 695K rwdata, 1594K rodata, 255K init, 241K bss, 9516K reserved, 0K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
> [    0.000000] rcu:     RCU debug extended QS entry/exit.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] riscv-intc: 32 local interrupts mapped
> [    0.000000] plic: plic@c000000: mapped 53 interrupts with 1 handlers for 2 contexts.
> ...
> Welcome to Buildroot
> buildroot login: root
> # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv32imafdcsuh
> mmu             : sv32
>
> # file /bin/busybox
> /bin/busybox: setuid ELF 32-bit LSB shared object, UCB RISC-V, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-riscv32-ilp32d.so.1, for GNU/Linux 5.15.0, stripped
> [   79.320589] random: fast init done
> # cat /proc/meminfo
> MemTotal:          52176 kB
> MemFree:           41012 kB
> MemAvailable:      42176 kB
> Buffers:             644 kB
> Cached:             2724 kB
> SwapCached:            0 kB
> Active:             3128 kB
> Inactive:            752 kB
> Active(anon):         40 kB
> Inactive(anon):      516 kB
> Active(file):       3088 kB
> Inactive(file):      236 kB
> Unevictable:           0 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 4 kB
> Writeback:             0 kB
> AnonPages:           556 kB
> Mapped:             2172 kB
> Shmem:                44 kB
> KReclaimable:        656 kB
> Slab:               3684 kB
> SReclaimable:        656 kB
> SUnreclaim:         3028 kB
> KernelStack:         312 kB
> PageTables:           88 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:       26088 kB
> Committed_AS:       2088 kB
> VmallocTotal:     524287 kB
> VmallocUsed:          12 kB
> VmallocChunk:          0 kB
> Percpu:               60 kB
> #
>
>  Some conclusions:
>  - kernel statics:
>    64: Memory: 52788K/63488K available (6184K kernel code, 888K rwdata, 1917K rodata, 294K init, 297K bss, 10700K reserved)
>    32: Memory: 51924K/61440K available (6117K kernel code, 695K rwdata, 1594K rodata, 255K init, 241K bss,  9516K reserved)
>    rv32 better than rv64:                  1%               22%           17%          13%        19%         11%
>    The code size is very similar, but data size rv32 would be better.
>
>  - rv32 kernel runtime KernelStack, Slab... are smaller,
>    rv64: MemTotal: 53076 kB,        MemFree: 40264 kB
>    rv32: MemTotal: 52176 + 2048 kB, MemFree: 41012  + 2048 kB
>    rv32 better than rv64:       2%                         6%
>
>    (Because opensbi problem, we could add another 2MB for rv32.)
>    Overall in 64MB memory situation, rv64-compat is 6% worse than rv32-full
>    at memory footprint. If the user space memory usage increases, I think
>    the gap will be further reduced.
>
> Changes in v5:
>  - Rebase on linux-5.17-rc2
>  - Include consolidate the fcntl patches by Christoph Hellwig
>  - Remove F_GETLK64/F_SETLK64/F_SETLKW64 from asm/compat.h
>  - Change COMPAT_RLIM_INFINITY from 0x7fffffff to 0xffffffff
>  - Bring back "Add hw-cap detect in setup_arch patch" in v1
>
> Changes in v4:
>  - Rebase on linux-5.17-rc1
>  - Optimize compat_sys_call_table implementation with Arnd's advice
>  - Add reviewed-by for Arnd. Thx :)
>  - Remove FIXME comment in elf.h
>  - Optimize Cleanup duplicate definitions in compat.h with Arnd's advice
>
> Changes in v3:
>  - Rebase on newest master (pre linux-5.17-rc1)
>  - Using newest qemu version v7 for test
>  - Remove fcntl common modification
>  - Fixup SET_PERSONALITY in elf.h by Arnd
>  - Fixup KVM Kconfig
>  - Update Acked-by & Reviewed-by
>
> Changes in v2:
>  - Add __ARCH_WANT_COMPAT_STAT suggested
>  - Cleanup fcntl compatduplicate definitions
>  - Cleanup compat.h
>  - Move rv32_defconfig into Makefile
>  - Fixup rv64 rootfs boot failed, remove hw_compat_mode_detect
>  - Move SYSVIPC_COMPAT into init/Kconfig
>  - Simplify compat_elf_check
>
>
> Christoph Hellwig (3):
>   uapi: simplify __ARCH_FLOCK{,64}_PAD a little
>   uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in fcntl.h
>   compat: consolidate the compat_flock{,64} definition
>
> Guo Ren (18):
>   kconfig: Add SYSVIPC_COMPAT for all architectures
>   fs: stat: compat: Add __ARCH_WANT_COMPAT_STAT
>   asm-generic: compat: Cleanup duplicate definitions
>   syscalls: compat: Fix the missing part for __SYSCALL_COMPAT
>   riscv: Fixup difference with defconfig
>   riscv: compat: Add basic compat data type implementation
>   riscv: compat: Re-implement TASK_SIZE for COMPAT_32BIT
>   riscv: compat: syscall: Add compat_sys_call_table implementation
>   riscv: compat: syscall: Add entry.S implementation
>   riscv: compat: process: Add UXL_32 support in start_thread
>   riscv: compat: Add elf.h implementation
>   riscv: compat: Add hw capability check for elf
>   riscv: compat: vdso: Add rv32 VDSO base code implementation
>   riscv: compat: vdso: Add setup additional pages implementation
>   riscv: compat: signal: Add rt_frame implementation
>   riscv: compat: ptrace: Add compat_arch_ptrace implement
>   riscv: compat: Add COMPAT Kbuild skeletal support
>   KVM: compat: riscv: Prevent KVM_COMPAT from being selected
>
>  arch/arm64/Kconfig                            |   4 -
>  arch/arm64/include/asm/compat.h               |  91 +------
>  arch/arm64/include/asm/unistd.h               |   1 +
>  arch/mips/Kconfig                             |   5 -
>  arch/mips/include/asm/compat.h                |  41 +--
>  arch/mips/include/asm/unistd.h                |   2 +
>  arch/mips/include/uapi/asm/fcntl.h            |  30 +--
>  arch/parisc/Kconfig                           |   4 -
>  arch/parisc/include/asm/compat.h              |  45 +---
>  arch/parisc/include/asm/unistd.h              |   1 +
>  arch/powerpc/Kconfig                          |   5 -
>  arch/powerpc/include/asm/compat.h             |  50 +---
>  arch/powerpc/include/asm/unistd.h             |   1 +
>  arch/riscv/Kconfig                            |  19 ++
>  arch/riscv/Makefile                           |   9 +
>  arch/riscv/configs/rv32_defconfig             | 135 ----------
>  arch/riscv/include/asm/compat.h               | 129 ++++++++++
>  arch/riscv/include/asm/csr.h                  |   7 +
>  arch/riscv/include/asm/elf.h                  |  52 +++-
>  arch/riscv/include/asm/mmu.h                  |   1 +
>  arch/riscv/include/asm/pgtable.h              |  13 +-
>  arch/riscv/include/asm/syscall.h              |   1 +
>  arch/riscv/include/asm/thread_info.h          |   1 +
>  arch/riscv/include/asm/unistd.h               |  11 +
>  arch/riscv/include/asm/vdso.h                 |   9 +
>  arch/riscv/include/uapi/asm/unistd.h          |   2 +-
>  arch/riscv/kernel/Makefile                    |   3 +
>  arch/riscv/kernel/compat_signal.c             | 243 ++++++++++++++++++
>  arch/riscv/kernel/compat_syscall_table.c      |  19 ++
>  arch/riscv/kernel/compat_vdso/.gitignore      |   2 +
>  arch/riscv/kernel/compat_vdso/Makefile        |  68 +++++
>  arch/riscv/kernel/compat_vdso/compat_vdso.S   |   8 +
>  .../kernel/compat_vdso/compat_vdso.lds.S      |   3 +
>  arch/riscv/kernel/compat_vdso/flush_icache.S  |   3 +
>  .../compat_vdso/gen_compat_vdso_offsets.sh    |   5 +
>  arch/riscv/kernel/compat_vdso/getcpu.S        |   3 +
>  arch/riscv/kernel/compat_vdso/note.S          |   3 +
>  arch/riscv/kernel/compat_vdso/rt_sigreturn.S  |   3 +
>  arch/riscv/kernel/entry.S                     |  18 +-
>  arch/riscv/kernel/process.c                   |  36 +++
>  arch/riscv/kernel/ptrace.c                    |  87 ++++++-
>  arch/riscv/kernel/signal.c                    |  13 +-
>  arch/riscv/kernel/sys_riscv.c                 |   6 +-
>  arch/riscv/kernel/vdso.c                      | 104 +++++---
>  arch/riscv/kernel/vdso/vdso.S                 |   6 +-
>  arch/s390/Kconfig                             |   3 -
>  arch/s390/include/asm/compat.h                |  99 +------
>  arch/s390/include/asm/unistd.h                |   1 +
>  arch/sparc/Kconfig                            |   5 -
>  arch/sparc/include/asm/compat.h               |  61 ++---
>  arch/sparc/include/asm/unistd.h               |   1 +
>  arch/x86/Kconfig                              |   4 -
>  arch/x86/include/asm/compat.h                 | 104 ++------
>  arch/x86/include/asm/unistd.h                 |   1 +
>  fs/open.c                                     |  24 ++
>  fs/read_write.c                               |  16 ++
>  fs/stat.c                                     |   2 +-
>  fs/sync.c                                     |   9 +
>  include/asm-generic/compat.h                  | 113 ++++++++
>  include/linux/compat.h                        |  68 +++++
>  include/uapi/asm-generic/fcntl.h              |  23 +-
>  include/uapi/asm-generic/unistd.h             |   4 +-
>  init/Kconfig                                  |   4 +
>  mm/fadvise.c                                  |  11 +
>  mm/readahead.c                                |   7 +
>  tools/include/uapi/asm-generic/fcntl.h        |  21 +-
>  tools/include/uapi/asm-generic/unistd.h       |   4 +-
>  virt/kvm/Kconfig                              |   2 +-
>  68 files changed, 1198 insertions(+), 691 deletions(-)
>  delete mode 100644 arch/riscv/configs/rv32_defconfig
>  create mode 100644 arch/riscv/include/asm/compat.h
>  create mode 100644 arch/riscv/kernel/compat_signal.c
>  create mode 100644 arch/riscv/kernel/compat_syscall_table.c
>  create mode 100644 arch/riscv/kernel/compat_vdso/.gitignore
>  create mode 100644 arch/riscv/kernel/compat_vdso/Makefile
>  create mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/compat_vdso.lds.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/flush_icache.S
>  create mode 100755 arch/riscv/kernel/compat_vdso/gen_compat_vdso_offsets.sh
>  create mode 100644 arch/riscv/kernel/compat_vdso/getcpu.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/note.S
>  create mode 100644 arch/riscv/kernel/compat_vdso/rt_sigreturn.S

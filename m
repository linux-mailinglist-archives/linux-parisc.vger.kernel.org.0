Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15984F2422
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Apr 2022 09:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbiDEHRD (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 5 Apr 2022 03:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiDEHQX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 5 Apr 2022 03:16:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D209156D;
        Tue,  5 Apr 2022 00:14:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E4551B81B75;
        Tue,  5 Apr 2022 07:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A75C36AE5;
        Tue,  5 Apr 2022 07:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649142847;
        bh=r64tfNJasnWulE6W7RMHHtZEcrMAFim9m0SWRm+XZ/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H1b5QtSL5G1gzPFNkR0NWRI8WZHapTz0GREOmCw7fNQKHWRMvGNjZDwBQBvPMZSkA
         +abaLSsKTI1AC+1s8cZOaXSZ4+JCtM6IwOwV9DDUhLSSMGMLfFTeTdNOWOwHrbJTKu
         Xe4abvlwUOSA4iZ4ONSHPie6UhSSa8odmydXsT+1+Xute54ox5/fyTBLSloapOT9Ug
         QWYTl4mTJpmzOqp+I+Uac/lFJs9iHSkDKT7h9db05wMXamj4O1BKrHLa/aFd6mxpxw
         xBwYpWaTyiknKD63M16TwxlcbbKu47LJVhq/rKI3uV/k+JceK2DJdJI8OLEkclfZHs
         jrKm0sDsoS13w==
From:   guoren@kernel.org
To:     guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, hch@lst.de, nathan@kernel.org,
        naresh.kamboju@linaro.org
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, x86@kernel.org,
        heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>,
        Helge Deller <deller@gmx.de>
Subject: [PATCH V12 06/20] asm-generic: compat: Cleanup duplicate definitions
Date:   Tue,  5 Apr 2022 15:13:00 +0800
Message-Id: <20220405071314.3225832-7-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405071314.3225832-1-guoren@kernel.org>
References: <20220405071314.3225832-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Guo Ren <guoren@linux.alibaba.com>

There are 7 64bit architectures that support Linux COMPAT mode to
run 32bit applications. A lot of definitions are duplicate:
 - COMPAT_USER_HZ
 - COMPAT_RLIM_INFINITY
 - COMPAT_OFF_T_MAX
 - __compat_uid_t, __compat_uid_t
 - compat_dev_t
 - compat_ipc_pid_t
 - struct compat_flock
 - struct compat_flock64
 - struct compat_statfs
 - struct compat_ipc64_perm, compat_semid64_ds,
	  compat_msqid64_ds, compat_shmid64_ds

Cleanup duplicate definitions and merge them into asm-generic.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Helge Deller <deller@gmx.de>  # parisc
Cc: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/arm64/include/asm/compat.h   |  73 +++-----------------
 arch/mips/include/asm/compat.h    |  18 ++---
 arch/parisc/include/asm/compat.h  |  29 ++------
 arch/powerpc/include/asm/compat.h |  30 ++-------
 arch/s390/include/asm/compat.h    |  79 ++++------------------
 arch/sparc/include/asm/compat.h   |  39 ++++-------
 arch/x86/include/asm/compat.h     |  80 ++++------------------
 include/asm-generic/compat.h      | 106 ++++++++++++++++++++++++++++++
 8 files changed, 170 insertions(+), 284 deletions(-)

diff --git a/arch/arm64/include/asm/compat.h b/arch/arm64/include/asm/compat.h
index e0faec1984a1..9f362274a4f7 100644
--- a/arch/arm64/include/asm/compat.h
+++ b/arch/arm64/include/asm/compat.h
@@ -8,6 +8,15 @@
 #define compat_mode_t compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		compat_ipc_pid_t;
+
+#define compat_statfs	compat_statfs
+
 #include <asm-generic/compat.h>
 
 #ifdef CONFIG_COMPAT
@@ -19,21 +28,15 @@ typedef u16		compat_mode_t;
 #include <linux/sched.h>
 #include <linux/sched/task_stack.h>
 
-#define COMPAT_USER_HZ		100
 #ifdef __AARCH64EB__
 #define COMPAT_UTS_MACHINE	"armv8b\0\0"
 #else
 #define COMPAT_UTS_MACHINE	"armv8l\0\0"
 #endif
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
 typedef u16		__compat_uid16_t;
 typedef u16		__compat_gid16_t;
-typedef u32		compat_dev_t;
 typedef s32		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
-typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
 #ifdef __AARCH64EB__
@@ -87,64 +90,6 @@ struct compat_statfs {
 #define compat_user_stack_pointer() (user_stack_pointer(task_pt_regs(current)))
 #define COMPAT_MINSIGSTKSZ	2048
 
-struct compat_ipc64_perm {
-	compat_key_t key;
-	__compat_uid32_t uid;
-	__compat_gid32_t gid;
-	__compat_uid32_t cuid;
-	__compat_gid32_t cgid;
-	unsigned short mode;
-	unsigned short __pad1;
-	unsigned short seq;
-	unsigned short __pad2;
-	compat_ulong_t unused1;
-	compat_ulong_t unused2;
-};
-
-struct compat_semid64_ds {
-	struct compat_ipc64_perm sem_perm;
-	compat_ulong_t sem_otime;
-	compat_ulong_t sem_otime_high;
-	compat_ulong_t sem_ctime;
-	compat_ulong_t sem_ctime_high;
-	compat_ulong_t sem_nsems;
-	compat_ulong_t __unused3;
-	compat_ulong_t __unused4;
-};
-
-struct compat_msqid64_ds {
-	struct compat_ipc64_perm msg_perm;
-	compat_ulong_t msg_stime;
-	compat_ulong_t msg_stime_high;
-	compat_ulong_t msg_rtime;
-	compat_ulong_t msg_rtime_high;
-	compat_ulong_t msg_ctime;
-	compat_ulong_t msg_ctime_high;
-	compat_ulong_t msg_cbytes;
-	compat_ulong_t msg_qnum;
-	compat_ulong_t msg_qbytes;
-	compat_pid_t   msg_lspid;
-	compat_pid_t   msg_lrpid;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
-struct compat_shmid64_ds {
-	struct compat_ipc64_perm shm_perm;
-	compat_size_t  shm_segsz;
-	compat_ulong_t shm_atime;
-	compat_ulong_t shm_atime_high;
-	compat_ulong_t shm_dtime;
-	compat_ulong_t shm_dtime_high;
-	compat_ulong_t shm_ctime;
-	compat_ulong_t shm_ctime_high;
-	compat_pid_t   shm_cpid;
-	compat_pid_t   shm_lpid;
-	compat_ulong_t shm_nattch;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
 static inline int is_compat_task(void)
 {
 	return test_thread_flag(TIF_32BIT);
diff --git a/arch/mips/include/asm/compat.h b/arch/mips/include/asm/compat.h
index 6d6e5a451f4d..ec01dc000a41 100644
--- a/arch/mips/include/asm/compat.h
+++ b/arch/mips/include/asm/compat.h
@@ -9,28 +9,28 @@
 #include <asm/page.h>
 #include <asm/ptrace.h>
 
+#define __compat_uid_t	__compat_uid_t
 typedef s32		__compat_uid_t;
 typedef s32		__compat_gid_t;
+
 typedef __compat_uid_t	__compat_uid32_t;
 typedef __compat_gid_t	__compat_gid32_t;
 #define __compat_uid32_t __compat_uid32_t
-#define __compat_gid32_t __compat_gid32_t
+
+#define compat_statfs		compat_statfs
+#define compat_ipc64_perm	compat_ipc64_perm
 
 #define _COMPAT_NSIG		128		/* Don't ask !$@#% ...	*/
 #define _COMPAT_NSIG_BPW	32
 typedef u32		compat_sigset_word;
 
+#define COMPAT_RLIM_INFINITY	0x7fffffffUL
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"mips\0\0\0"
 
-typedef u32		compat_dev_t;
 typedef u32		compat_nlink_t;
-typedef s32		compat_ipc_pid_t;
-typedef struct {
-	s32	val[2];
-} compat_fsid_t;
 
 struct compat_stat {
 	compat_dev_t	st_dev;
@@ -73,10 +73,6 @@ struct compat_statfs {
 	int		f_spare[5];
 };
 
-#define COMPAT_RLIM_INFINITY	0x7fffffffUL
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 struct compat_ipc64_perm {
 	compat_key_t key;
 	__compat_uid32_t uid;
diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index a1e4534d8050..339d1b833fa7 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -11,16 +11,16 @@
 #define compat_mode_t compat_mode_t
 typedef u16	compat_mode_t;
 
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16	compat_ipc_pid_t;
+
+#define compat_ipc64_perm compat_ipc64_perm
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ 		100
 #define COMPAT_UTS_MACHINE	"parisc\0\0"
 
-typedef u32	__compat_uid_t;
-typedef u32	__compat_gid_t;
-typedef u32	compat_dev_t;
 typedef u16	compat_nlink_t;
-typedef u16	compat_ipc_pid_t;
 
 struct compat_stat {
 	compat_dev_t		st_dev;	/* dev_t is 32 bits on parisc */
@@ -53,21 +53,6 @@ struct compat_stat {
 	u32			st_spare4[3];
 };
 
-struct compat_statfs {
-	s32		f_type;
-	s32		f_bsize;
-	s32		f_blocks;
-	s32		f_bfree;
-	s32		f_bavail;
-	s32		f_files;
-	s32		f_ffree;
-	__kernel_fsid_t	f_fsid;
-	s32		f_namelen;
-	s32		f_frsize;
-	s32		f_flags;
-	s32		f_spare[4];
-};
-
 struct compat_sigcontext {
 	compat_int_t sc_flags;
 	compat_int_t sc_gr[32]; /* PSW in sc_gr[0] */
@@ -77,10 +62,6 @@ struct compat_sigcontext {
 	compat_int_t sc_sar; /* cr11 */
 };
 
-#define COMPAT_RLIM_INFINITY 0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 struct compat_ipc64_perm {
 	compat_key_t key;
 	__compat_uid_t uid;
diff --git a/arch/powerpc/include/asm/compat.h b/arch/powerpc/include/asm/compat.h
index 5ef3c7c83c34..dda4091fd012 100644
--- a/arch/powerpc/include/asm/compat.h
+++ b/arch/powerpc/include/asm/compat.h
@@ -8,21 +8,20 @@
 #include <linux/types.h>
 #include <linux/sched.h>
 
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		compat_ipc_pid_t;
+
+#define compat_ipc64_perm compat_ipc64_perm
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #ifdef __BIG_ENDIAN__
 #define COMPAT_UTS_MACHINE	"ppc\0\0"
 #else
 #define COMPAT_UTS_MACHINE	"ppcle\0\0"
 #endif
 
-typedef u32		__compat_uid_t;
-typedef u32		__compat_gid_t;
-typedef u32		compat_dev_t;
 typedef s16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
-typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
 	compat_dev_t	st_dev;
@@ -44,25 +43,6 @@ struct compat_stat {
 	u32		__unused4[2];
 };
 
-struct compat_statfs {
-	int		f_type;
-	int		f_bsize;
-	int		f_blocks;
-	int		f_bfree;
-	int		f_bavail;
-	int		f_files;
-	int		f_ffree;
-	compat_fsid_t	f_fsid;
-	int		f_namelen;	/* SunOS ignores this field. */
-	int		f_frsize;
-	int		f_flags;
-	int		f_spare[4];
-};
-
-#define COMPAT_RLIM_INFINITY		0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 /*
  * ipc64_perm is actually 32/64bit clean but since the compat layer refers to
  * it we may as well define it.
diff --git a/arch/s390/include/asm/compat.h b/arch/s390/include/asm/compat.h
index 07f04d37068b..ad809cf3dd97 100644
--- a/arch/s390/include/asm/compat.h
+++ b/arch/s390/include/asm/compat.h
@@ -12,6 +12,18 @@
 #define compat_mode_t	compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_dev_t	compat_dev_t
+typedef u16		compat_dev_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		 compat_ipc_pid_t;
+
+#define compat_statfs	compat_statfs
+
 #include <asm-generic/compat.h>
 
 #define __TYPE_IS_PTR(t) (!__builtin_types_compatible_p( \
@@ -53,15 +65,9 @@ typedef u16		compat_mode_t;
 			 PSW32_MASK_MCHECK | PSW32_MASK_PSTATE | \
 			 PSW32_ASC_PRIMARY)
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"s390\0\0\0\0"
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
-typedef u16		compat_dev_t;
 typedef u16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
-typedef __kernel_fsid_t	compat_fsid_t;
 
 typedef struct {
 	u32 mask;
@@ -132,10 +138,6 @@ struct compat_statfs64 {
 	u32		f_spare[4];
 };
 
-#define COMPAT_RLIM_INFINITY		0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 /*
  * A pointer passed in from user mode. This should not
  * be used for syscall parameters, just declare them
@@ -158,61 +160,4 @@ static inline int is_compat_task(void)
 
 #endif
 
-struct compat_ipc64_perm {
-	compat_key_t key;
-	__compat_uid32_t uid;
-	__compat_gid32_t gid;
-	__compat_uid32_t cuid;
-	__compat_gid32_t cgid;
-	compat_mode_t mode;
-	unsigned short __pad1;
-	unsigned short seq;
-	unsigned short __pad2;
-	unsigned int __unused1;
-	unsigned int __unused2;
-};
-
-struct compat_semid64_ds {
-	struct compat_ipc64_perm sem_perm;
-	compat_ulong_t sem_otime;
-	compat_ulong_t sem_otime_high;
-	compat_ulong_t sem_ctime;
-	compat_ulong_t sem_ctime_high;
-	compat_ulong_t sem_nsems;
-	compat_ulong_t __unused1;
-	compat_ulong_t __unused2;
-};
-
-struct compat_msqid64_ds {
-	struct compat_ipc64_perm msg_perm;
-	compat_ulong_t msg_stime;
-	compat_ulong_t msg_stime_high;
-	compat_ulong_t msg_rtime;
-	compat_ulong_t msg_rtime_high;
-	compat_ulong_t msg_ctime;
-	compat_ulong_t msg_ctime_high;
-	compat_ulong_t msg_cbytes;
-	compat_ulong_t msg_qnum;
-	compat_ulong_t msg_qbytes;
-	compat_pid_t   msg_lspid;
-	compat_pid_t   msg_lrpid;
-	compat_ulong_t __unused1;
-	compat_ulong_t __unused2;
-};
-
-struct compat_shmid64_ds {
-	struct compat_ipc64_perm shm_perm;
-	compat_size_t  shm_segsz;
-	compat_ulong_t shm_atime;
-	compat_ulong_t shm_atime_high;
-	compat_ulong_t shm_dtime;
-	compat_ulong_t shm_dtime_high;
-	compat_ulong_t shm_ctime;
-	compat_ulong_t shm_ctime_high;
-	compat_pid_t   shm_cpid;
-	compat_pid_t   shm_lpid;
-	compat_ulong_t shm_nattch;
-	compat_ulong_t __unused1;
-	compat_ulong_t __unused2;
-};
 #endif /* _ASM_S390X_COMPAT_H */
diff --git a/arch/sparc/include/asm/compat.h b/arch/sparc/include/asm/compat.h
index d78fb44942e0..e4382d2efa56 100644
--- a/arch/sparc/include/asm/compat.h
+++ b/arch/sparc/include/asm/compat.h
@@ -9,17 +9,25 @@
 #define compat_mode_t	compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_dev_t	compat_dev_t
+typedef u16		compat_dev_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		 compat_ipc_pid_t;
+
+#define compat_ipc64_perm compat_ipc64_perm
+
+#define COMPAT_RLIM_INFINITY 0x7fffffff
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"sparc\0\0"
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
-typedef u16		compat_dev_t;
 typedef s16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
-typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
 	compat_dev_t	st_dev;
@@ -77,25 +85,6 @@ struct compat_stat64 {
 
 #define __ARCH_COMPAT_FLOCK_PAD		short __unused;
 
-struct compat_statfs {
-	int		f_type;
-	int		f_bsize;
-	int		f_blocks;
-	int		f_bfree;
-	int		f_bavail;
-	int		f_files;
-	int		f_ffree;
-	compat_fsid_t	f_fsid;
-	int		f_namelen;	/* SunOS ignores this field. */
-	int		f_frsize;
-	int		f_flags;
-	int		f_spare[4];
-};
-
-#define COMPAT_RLIM_INFINITY 0x7fffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
 struct compat_ipc64_perm {
 	compat_key_t key;
 	__compat_uid32_t uid;
diff --git a/arch/x86/include/asm/compat.h b/arch/x86/include/asm/compat.h
index de794d895866..e74a107de0d0 100644
--- a/arch/x86/include/asm/compat.h
+++ b/arch/x86/include/asm/compat.h
@@ -15,17 +15,23 @@
 #define compat_mode_t	compat_mode_t
 typedef u16		compat_mode_t;
 
+#define __compat_uid_t	__compat_uid_t
+typedef u16		__compat_uid_t;
+typedef u16		__compat_gid_t;
+
+#define compat_dev_t	compat_dev_t
+typedef u16		compat_dev_t;
+
+#define compat_ipc_pid_t compat_ipc_pid_t
+typedef u16		 compat_ipc_pid_t;
+
+#define compat_statfs	compat_statfs
+
 #include <asm-generic/compat.h>
 
-#define COMPAT_USER_HZ		100
 #define COMPAT_UTS_MACHINE	"i686\0\0"
 
-typedef u16		__compat_uid_t;
-typedef u16		__compat_gid_t;
-typedef u16		compat_dev_t;
 typedef u16		compat_nlink_t;
-typedef u16		compat_ipc_pid_t;
-typedef __kernel_fsid_t	compat_fsid_t;
 
 struct compat_stat {
 	compat_dev_t	st_dev;
@@ -71,68 +77,6 @@ struct compat_statfs {
 	int		f_spare[4];
 };
 
-#define COMPAT_RLIM_INFINITY		0xffffffff
-
-#define COMPAT_OFF_T_MAX	0x7fffffff
-
-struct compat_ipc64_perm {
-	compat_key_t key;
-	__compat_uid32_t uid;
-	__compat_gid32_t gid;
-	__compat_uid32_t cuid;
-	__compat_gid32_t cgid;
-	unsigned short mode;
-	unsigned short __pad1;
-	unsigned short seq;
-	unsigned short __pad2;
-	compat_ulong_t unused1;
-	compat_ulong_t unused2;
-};
-
-struct compat_semid64_ds {
-	struct compat_ipc64_perm sem_perm;
-	compat_ulong_t sem_otime;
-	compat_ulong_t sem_otime_high;
-	compat_ulong_t sem_ctime;
-	compat_ulong_t sem_ctime_high;
-	compat_ulong_t sem_nsems;
-	compat_ulong_t __unused3;
-	compat_ulong_t __unused4;
-};
-
-struct compat_msqid64_ds {
-	struct compat_ipc64_perm msg_perm;
-	compat_ulong_t msg_stime;
-	compat_ulong_t msg_stime_high;
-	compat_ulong_t msg_rtime;
-	compat_ulong_t msg_rtime_high;
-	compat_ulong_t msg_ctime;
-	compat_ulong_t msg_ctime_high;
-	compat_ulong_t msg_cbytes;
-	compat_ulong_t msg_qnum;
-	compat_ulong_t msg_qbytes;
-	compat_pid_t   msg_lspid;
-	compat_pid_t   msg_lrpid;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
-struct compat_shmid64_ds {
-	struct compat_ipc64_perm shm_perm;
-	compat_size_t  shm_segsz;
-	compat_ulong_t shm_atime;
-	compat_ulong_t shm_atime_high;
-	compat_ulong_t shm_dtime;
-	compat_ulong_t shm_dtime_high;
-	compat_ulong_t shm_ctime;
-	compat_ulong_t shm_ctime_high;
-	compat_pid_t   shm_cpid;
-	compat_pid_t   shm_lpid;
-	compat_ulong_t shm_nattch;
-	compat_ulong_t __unused4;
-	compat_ulong_t __unused5;
-};
-
 #ifdef CONFIG_X86_X32_ABI
 #define COMPAT_USE_64BIT_TIME \
 	(!!(task_pt_regs(current)->orig_ax & __X32_SYSCALL_BIT))
diff --git a/include/asm-generic/compat.h b/include/asm-generic/compat.h
index d46c0201cc34..11653d6846cc 100644
--- a/include/asm-generic/compat.h
+++ b/include/asm-generic/compat.h
@@ -2,6 +2,18 @@
 #ifndef __ASM_GENERIC_COMPAT_H
 #define __ASM_GENERIC_COMPAT_H
 
+#ifndef COMPAT_USER_HZ
+#define COMPAT_USER_HZ		100
+#endif
+
+#ifndef COMPAT_RLIM_INFINITY
+#define COMPAT_RLIM_INFINITY	0xffffffff
+#endif
+
+#ifndef COMPAT_OFF_T_MAX
+#define COMPAT_OFF_T_MAX	0x7fffffff
+#endif
+
 /* These types are common across all compat ABIs */
 typedef u32 compat_size_t;
 typedef s32 compat_ssize_t;
@@ -24,6 +36,11 @@ typedef u32 compat_caddr_t;
 typedef u32 compat_aio_context_t;
 typedef u32 compat_old_sigset_t;
 
+#ifndef __compat_uid_t
+typedef u32 __compat_uid_t;
+typedef u32 __compat_gid_t;
+#endif
+
 #ifndef __compat_uid32_t
 typedef u32 __compat_uid32_t;
 typedef u32 __compat_gid32_t;
@@ -47,4 +64,93 @@ typedef u32 compat_sigset_word;
 #define _COMPAT_NSIG_BPW 32
 #endif
 
+#ifndef compat_dev_t
+typedef u32 compat_dev_t;
+#endif
+
+#ifndef compat_ipc_pid_t
+typedef s32 compat_ipc_pid_t;
+#endif
+
+#ifndef compat_fsid_t
+typedef __kernel_fsid_t	compat_fsid_t;
+#endif
+
+#ifndef compat_statfs
+struct compat_statfs {
+	compat_int_t	f_type;
+	compat_int_t	f_bsize;
+	compat_int_t	f_blocks;
+	compat_int_t	f_bfree;
+	compat_int_t	f_bavail;
+	compat_int_t	f_files;
+	compat_int_t	f_ffree;
+	compat_fsid_t	f_fsid;
+	compat_int_t	f_namelen;
+	compat_int_t	f_frsize;
+	compat_int_t	f_flags;
+	compat_int_t	f_spare[4];
+};
+#endif
+
+#ifndef compat_ipc64_perm
+struct compat_ipc64_perm {
+	compat_key_t key;
+	__compat_uid32_t uid;
+	__compat_gid32_t gid;
+	__compat_uid32_t cuid;
+	__compat_gid32_t cgid;
+	compat_mode_t	mode;
+	unsigned char	__pad1[4 - sizeof(compat_mode_t)];
+	compat_ushort_t	seq;
+	compat_ushort_t	__pad2;
+	compat_ulong_t	unused1;
+	compat_ulong_t	unused2;
+};
+
+struct compat_semid64_ds {
+	struct compat_ipc64_perm sem_perm;
+	compat_ulong_t sem_otime;
+	compat_ulong_t sem_otime_high;
+	compat_ulong_t sem_ctime;
+	compat_ulong_t sem_ctime_high;
+	compat_ulong_t sem_nsems;
+	compat_ulong_t __unused3;
+	compat_ulong_t __unused4;
+};
+
+struct compat_msqid64_ds {
+	struct compat_ipc64_perm msg_perm;
+	compat_ulong_t msg_stime;
+	compat_ulong_t msg_stime_high;
+	compat_ulong_t msg_rtime;
+	compat_ulong_t msg_rtime_high;
+	compat_ulong_t msg_ctime;
+	compat_ulong_t msg_ctime_high;
+	compat_ulong_t msg_cbytes;
+	compat_ulong_t msg_qnum;
+	compat_ulong_t msg_qbytes;
+	compat_pid_t   msg_lspid;
+	compat_pid_t   msg_lrpid;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+};
+
+struct compat_shmid64_ds {
+	struct compat_ipc64_perm shm_perm;
+	compat_size_t  shm_segsz;
+	compat_ulong_t shm_atime;
+	compat_ulong_t shm_atime_high;
+	compat_ulong_t shm_dtime;
+	compat_ulong_t shm_dtime_high;
+	compat_ulong_t shm_ctime;
+	compat_ulong_t shm_ctime_high;
+	compat_pid_t   shm_cpid;
+	compat_pid_t   shm_lpid;
+	compat_ulong_t shm_nattch;
+	compat_ulong_t __unused4;
+	compat_ulong_t __unused5;
+};
+#endif
+
 #endif
-- 
2.25.1


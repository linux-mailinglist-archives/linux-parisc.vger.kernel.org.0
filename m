Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19DA5D3C3
	for <lists+linux-parisc@lfdr.de>; Tue,  2 Jul 2019 17:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfGBP7y (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 2 Jul 2019 11:59:54 -0400
Received: from mout.gmx.net ([212.227.15.19]:39057 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbfGBP7y (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 2 Jul 2019 11:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1562083162;
        bh=P5eQDbAW1l5i9YSlJBwVb4E/+swDIeNaoULnJV8sjVc=;
        h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
        b=VYwVWHO8DkPbceykId3ZErOQV/hkkJ5PQh79KnGKDjDKM6zCnQUc5CE7MLhnmrpMq
         f03unef35HWkyjBzWpourGINhwP6ICl6DhiDVKRM3z8UsgBByjACEBJv6CyGwKyK4B
         dglJhbKRlUX2z95RoPARqvqhdBgwn13W6UbYFO+o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.153]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MMBiP-1hcXDz2UBB-008570; Tue, 02
 Jul 2019 17:59:22 +0200
Subject: Re: Running the gdb 7.12.1 testsuite breaks kernel 4.13.8 on C8000
From:   Helge Deller <deller@gmx.de>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <11946948.1Lt8Nslq4k@devpool21>
 <16444139.ehY7rFqKE1@daneel.sf-tec.de> <2240883.3K8JbTncdJ@daneel.sf-tec.de>
 <ea25ddf3-0e9c-534f-1dc6-41169dc3edcd@gmx.de>
Message-ID: <029de4f5-62db-7d74-7619-3c7888ce4f9c@gmx.de>
Date:   Tue, 2 Jul 2019 17:59:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ea25ddf3-0e9c-534f-1dc6-41169dc3edcd@gmx.de>
Content-Type: multipart/mixed;
 boundary="------------0E772DEF2D0E193F6D756351"
Content-Language: en-US
X-Provags-ID: V03:K1:9h44auKPepgJHjPMD7ha7qT0tMEnZF/fcnO4W8K/SRmxihTn2Xu
 PuEKL0rlQoHEcNmJ5O3k4VBlVC5l6l3DVCGhmSQ1bOaAoKGBaCaT8E+Zj0RqlHJcP/3Lsa9
 7XnWv3+VBUEVD8qkLc2O4wKQ0fCQVg1kiGpEXkE/Y4BYwPeqK3k3mlpn6cx6e2TQ8nirl0J
 1XBi3bXEQ/q8VMvD1BPWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cd31nIXJRYY=:HePG1aDaU+iGUl9lYnKV6B
 muc0/tIr4Y1FQIARTxWWQvLBNWZV1x1M6aB9VbRRPMaLS0yZPwQS5Q/xpVxqTzTyVEnTlmaUH
 rVmtv2aJLAhnOe0SmLKFlEgKmhIF8UoRh0OyZRx++1ZNt6GbPqCm7sjIeSNtPdPWPiMccOmks
 78O5BOkPjqDErTl9ePtk8ajpvJxkkDFVDcOFWJM3TTkyhaSSzF2bBBp248zSe8HMLMP/CuaH5
 YwpsHs17Srg08Chli8kZ0ukC5T5bZBrut59Xkfjf1liOwyOqpB2/0iPpZkO0zft5wUKuPM2t+
 8NbhW6czbdMSajn4rHVituR9q1pVrh2XiH/KBmhagb6xtZiCMUK5bojxD3pUMNf4/5DDYyxgH
 87NIooR8tL9YS7nG571eskpr57zPpUfjJdSlxXuPA6Yp8v+rNOyZojBWCsUt1qWRA3YCA++Oi
 kF0Fb5EFhyFrdyWoZ5cTQ/lkfZuukNQcZJ3f47AXOeUVBwfIL49xohaGkvMJm+luOjw/kWgzE
 Ut3+Xj6gbDur2ZwYPuEUbuhyHyaj3/gWBL9vIkN7kKLzejw7LMKOB7c52cp7qJPrFUI2A0M1H
 +D08HBG18CL19TRg5d78YFWS0mL3WJmyfaSJoCg5+CEJSv4uKEhvWPOJcLWMYD2H0TAhaVvC1
 vqVyZ/9WjOqLeyAGjuhC8Ujk3BW9Gsu26n9qnUlxSvjndxIjXmk8qhqK+hyb6mTE8ChWIUj72
 xK45k7lbXxhbcSLpCZQ7RgMCbNTMBDFE0xFGct5+itFB6VaZrAGKYPK4rNlr4opMZjRZXLNoz
 KSKBZWcIc7Hi6YEvszsfHMhruJUxSNMOiSJ0vJjeAS4nGVnuBwVPGsK9Zcv2Yn1LoN9p6rND7
 qLoxwPTA89gpuN9v8qbpRWJjaGexslkGm5sqRuj9eCIs+m5fA4yWuL++ogc3FNd4vCCWGsS1W
 mucxIl47iY5b3JMByFpLgbm4OBs34HXpKpMtITcWhQMFSXC7aXHe44ygafw/xfrBkX1P3AkqV
 /MjINvln6a6dlfl5C3ZYoFeZtV9YoKFlMk73HvJDX1xUAidmqxi/JqJ2ZKQKBHMpcg==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a multi-part message in MIME format.
--------------0E772DEF2D0E193F6D756351
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

>> This seems to be a minimal reproducer:
>> https://481768.bugs.gentoo.org/attachment.cgi?id=361728

That's a REALLY nasty bug!
I see at least two issues here: A Linux kernel bug and a gdb (userspace) bug.

The kernel bug is, that a userspace process (running gdb) is able to crash the machine.
The attached patch does fix the crashes by preventing userspace to change IAOQ values to point to the gateway page.
This is what made the kernel crash, which probably happened, when the kernel tried to switch_to() the process.
I'm still trying to figure out if there is a better patch, e.g. in the switch_to() function or similar.
So, I don't think it's the final patch.
Anyway, this patch can help to figure out what's else going wrong.

Then, the second issue is:
In gdb this crashes the machine: "set tp = { 0,0 }".
Correct would be: "set *tp = { 0,0 }", which does NOT crash the kernel and works correctly.
So, for the first test it seems that gdb tries to create a temporary variable on the stack for "tp" in the user process.
For that gdb analyzes the code and thus somehow starts executing the attached process.
I think some gdb-expert might be able to fix this, esp. since gdb now prints:
: The program being debugged stopped while in a function called from GDB.
: Evaluation of the expression containing the function
: (malloc) will be abandoned.
: When the function is done executing, GDB will silently stop.
Maybe gdb tries to call the "malloc" function to allocate memory?

gdb uses ptrace() to control the attached process. So, adding a
  printk("PTRACE_REQUEST_PARISC  req=0x%lx  addr=0x%lx  data=0x%lx\n", request, addr, data);
to arch_ptrace() in arch/parisc/kernel/ptrace.c helps to debug what gdb does.

Helge

--------------0E772DEF2D0E193F6D756351
Content-Type: text/plain; charset=UTF-8;
 name="p1"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="p1"

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index a3d2fb4e6dd2..1b1af8a6508f 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -167,6 +175,14 @@ long arch_ptrace(struct task_struct *child, long request,
 		if ((addr & (sizeof(unsigned long)-1)) ||
 		     addr >= sizeof(struct pt_regs))
 			break;
+		/* Do not allow userspace to set IAOQ to gateway page. */
+		if (addr == PT_IAOQ0 || addr == PT_IAOQ1) {
+			if (data < GATEWAY_PAGE_SIZE) {
+				ret = 0; // return sucess to not disturb gdb
+				// printk("UGH!!!!!!!!!!!!!!!!!!!!\n");
+				break;
+			}
+		}
 		if ((addr >= PT_GR1 && addr <= PT_GR31) ||
 				addr == PT_IAOQ0 || addr == PT_IAOQ1 ||
 				(addr >= PT_FR0 && addr <= PT_FR31 + 4) ||
@@ -281,6 +297,14 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 			addr = translate_usr_offset(addr);
 			if (addr >= sizeof(struct pt_regs))
 				break;
+			/* Do not allow userspace to set IAOQ to gateway page. */
+			if (addr == PT_IAOQ0 || addr == PT_IAOQ1) {
+				if (data < GATEWAY_PAGE_SIZE) {
+					ret = 0; // return sucess to not disturb gdb
+					// printk("UGH!!!!!!!!!!!!!!!!!!!!\n");
+					break;
+				}
+			}
 			if (addr >= PT_FR0 && addr <= PT_FR31 + 4) {
 				/* Special case, fp regs are 64 bits anyway */
 				*(__u64 *) ((char *) task_regs(child) + addr) = data;

--------------0E772DEF2D0E193F6D756351--

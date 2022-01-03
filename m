Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7815B483557
	for <lists+linux-parisc@lfdr.de>; Mon,  3 Jan 2022 18:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiACRJH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 3 Jan 2022 12:09:07 -0500
Received: from mta-mtl-004.bell.net ([209.71.208.14]:64068 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230316AbiACRJH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 Jan 2022 12:09:07 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 61CE3D3B003FCE78
X-CM-Envelope: MS4xfB0uns/FvRANpC1DCNrvaczCtcuLm7q6uPGVcXe2LXfg/t2dplhVwOHyrB0uLwxl7hZUFOIfRiFTXh3z2AmV0C0I8mkQhea4/6UXggaKbBWhD0EbDzaq
 wEs+xCBIjN3kEtvIbXbD9ZfiNf5iLHe4je2EJOVHh6OI0Nlu0Cxkcbo1H2X5gViclkxiCk7dV2+GIjJLgjfH5EmX08TaQHqVDg9wrJW/aLuGvAfYCYDXRySP
 ZwKbhYn7Zlo/q6TsZYuyXQHYaKlg/V0lqWoALlmmpgg=
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61d32db1
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=Xp50ZnjoYueNHednDukA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 61CE3D3B003FCE78; Mon, 3 Jan 2022 12:09:05 -0500
Message-ID: <ead5cd3e-f75a-37a9-9065-e66c50c2b617@bell.net>
Date:   Mon, 3 Jan 2022 12:09:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Subject: show_regs doesn't user KERN_CRIT loglevel when called from
 parisc-terminate1G/show
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I've seen this crash twice recently:

Bad Address (null pointer deref?): Code=6 (Instruction TLB miss fault) at addr 00000000e5361d5f
Kernel panic - not syncing: Bad Address (null pointer deref?)

The message indicates parisc_terminate() was from do_page_fault(). It would seem either !mm or
!user_mode(regs).  Might be an exception that wasn't handled by fixup_exception().

In parisc_terminate(), we have:

         printk("\n");
         pr_crit("%s: Code=%d (%s) at addr " RFMT "\n",
                 msg, code, trap_name(code), offset);
         show_regs(regs);

         spin_unlock(&terminate_lock);

         /* put soft power button back under hardware control;
          * if the user had pressed it once at any time, the
          * system will shut down immediately right here. */
         pdc_soft_power_button(0);

         /* Call kernel panic() so reboot timeouts work properly
          * FIXME: This function should be on the list of
          * panic notifiers, and we should call panic
          * directly from the location that we wish.
          * e.g. We should not call panic from
          * parisc_terminate, but rather the oter way around.
          * This hack works, prints the panic message twice,
          * and it enables reboot timers!
          */
         panic(msg);

dave@mx3210:~$ cat /proc/sys/kernel/printk
7       4       1       7

Since the regs weren't displayed, this implies that user_mode(regs) is true. Thus I think we have a
user mode fault with no context:

         tsk = current;
         mm = tsk->mm;
         if (!mm)
                 goto no_context;

It would be helpful level in show_regs if the printk log level was set to KERN_CRIT when this happens.

Dave

-- 
John David Anglin  dave.anglin@bell.net


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66706295934
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 09:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508555AbgJVH3p (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 03:29:45 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:57656 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2508554AbgJVH3p (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 03:29:45 -0400
To:     linux-parisc@vger.kernel.org
From:   Meelis Roos <mroos@linux.ee>
Subject: problems in 5.9+git (no network initialized, systemd complains)
Message-ID: <914a9d98-24be-c022-e371-2a5674908168@linux.ee>
Date:   Thu, 22 Oct 2020 10:29:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

After testing if 5.9.0 worked on my rp2470, I comiled yesterdays git (v5.9-12462-gf804b3159482)
and it boots up partially - no network but there is console login on serial.

Noticed in dmesg:
[   14.403317] process '/sbin/init' started with executable stack
[   54.239069] systemd-udevd[460]: Failed to create SIGINT event source: Invalid argument
[   57.338167] systemd-udevd[673]: Failed to create SIGINT event source: Invalid argument
[   59.641694] ext2 filesystem being mounted at /boot supports timestamps until 2038 (0x7fffffff)
[  161.131316] systemd-udevd[1494]: Failed to create SIGINT event source: Invalid argument


As to why there is no network:
* There is dhcp client process /sbin/dhcpcd -q
* tail -n 50 /var/log/messages gives lines for syslogd startup each second:
Oct 22 09:51:54 rp2470 syslog-ng[6109]: syslog-ng starting up; version='3.26.1'
So it seems syslogd dies and is restarted in a loop. And there does not appear anything else in the messages for this boot, only shutdown of previous boot.

Is it something that might be known already? If not, I will try to bisect it if I get some time.

-- 
Meelis Roos <mroos@linux.ee>

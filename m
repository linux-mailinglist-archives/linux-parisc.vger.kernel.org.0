Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072DC5C3ED
	for <lists+linux-parisc@lfdr.de>; Mon,  1 Jul 2019 21:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfGATyd (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 1 Jul 2019 15:54:33 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:60844 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727068AbfGATyQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 1 Jul 2019 15:54:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 24AC68EE0E3
        for <linux-parisc@vger.kernel.org>; Mon,  1 Jul 2019 12:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562010856;
        bh=mXhIYZsMayvdT8UC+WxzVYOHPkWdvE/nMPkIAtIHbHM=;
        h=Subject:From:To:Date:From;
        b=TUgKNyvgnkXVvNM43yakTgp74QFe/9Td/WtLwY6AnnLuNTESuviIAqcm6Snh3Mrqo
         72Uct5Esoh8YBBJ6KrNeJiPVQia9zi3rm/tjK+r60+pLblEmJyzI6O5SviGjeLElwn
         xn521ZVLZEdJkE4qdWcIj9RNIX7asPtYmMCPUX04=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id z4Fu0Jyaq7tH for <linux-parisc@vger.kernel.org>;
        Mon,  1 Jul 2019 12:54:15 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id B8BAA8EE0E0
        for <linux-parisc@vger.kernel.org>; Mon,  1 Jul 2019 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562010855;
        bh=mXhIYZsMayvdT8UC+WxzVYOHPkWdvE/nMPkIAtIHbHM=;
        h=Subject:From:To:Date:From;
        b=ByvctwZrnTNydIjOkd9rNrBAdAk4FLi6ifVl+54bqk4EbaKvjBIK4BHxE4GAFfikw
         U/Pf8SueNaty3NXVXiVjEs/ApqL24xKNmXyJEUpTQvGY7GouIHSgZLaPnVrHao/L3j
         LUzCvJfOq/ouK3wGfsXr2TWYVPUt5AXIaOgCahlk=
Message-ID: <1562010854.2762.8.camel@HansenPartnership.com>
Subject: palo not working on ext2/ext3 partitions
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     linux-parisc@vger.kernel.org
Date:   Mon, 01 Jul 2019 12:54:14 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I recently had the pleasure of a complete reinstall and found that I
can't set up palo on the new system (at least not palo that loads from
an ext2/ext3 filesystem).  The problem doesn't seem to be within palo
itself, but the fact that mke2fs is no longer working for us.  The
symptom I see is that after a couple of uses the palo partition
corrupts itself and then e2fsck destroys the iplboot stored in the
badblocks list.

The problem seems to be with the badblock list because if I do

palo -I /dev/sdb

Followed by a fsck -f on the palo partition, it finds errors and wants
to clear the badblock inode.

I can reproduce this simply by doing

dd if=/dev/zero of=bbtest.img bs=1M count=100
losetup /dev/loop0 bbtest.img
a=237; while [ $a -le 450 ]; do echo $a >> bblist.txt; a=$[$a+1]; done
mke2fs -b 1024 -l /home/jejb/bblist.txt  /dev/loop0
e2fsck -f /dev/loop0

With no palo involvement, so I don't think it's our fault.

I'll take this to the ext2 tools development list.  Whatever it is
seems to be really old because I unearthed an mke2fs from 2011 that
still has the problem.

James


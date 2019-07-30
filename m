Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1077B2FD
	for <lists+linux-parisc@lfdr.de>; Tue, 30 Jul 2019 21:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfG3TMY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 30 Jul 2019 15:12:24 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:37290 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727169AbfG3TMY (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 30 Jul 2019 15:12:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 900008EE12F
        for <linux-parisc@vger.kernel.org>; Tue, 30 Jul 2019 12:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564513943;
        bh=178BHSRq/yu8sjo07+tjRja3MjIJ4zPYub9Imu9t/cE=;
        h=Subject:From:To:Date:From;
        b=RhJxkC3niKAF+nZJciRl5ZwD6aL29A2T7ZZXEfTya+q593+y1KfvLF2cMDSLWn6DV
         CGdp4EpqoyFru058RljToaa4xO9iwF5yHQVCNogkxA4MX0QmyI6tx2Wxj8Ca3+EPe+
         +zOgC8zxOjghH2LNKsMmVwA4uJf+Ie7cV3ZDAsJg=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jj8lFkRKzEhK for <linux-parisc@vger.kernel.org>;
        Tue, 30 Jul 2019 12:12:23 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 34B298EE0E3
        for <linux-parisc@vger.kernel.org>; Tue, 30 Jul 2019 12:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564513943;
        bh=178BHSRq/yu8sjo07+tjRja3MjIJ4zPYub9Imu9t/cE=;
        h=Subject:From:To:Date:From;
        b=RhJxkC3niKAF+nZJciRl5ZwD6aL29A2T7ZZXEfTya+q593+y1KfvLF2cMDSLWn6DV
         CGdp4EpqoyFru058RljToaa4xO9iwF5yHQVCNogkxA4MX0QmyI6tx2Wxj8Ca3+EPe+
         +zOgC8zxOjghH2LNKsMmVwA4uJf+Ie7cV3ZDAsJg=
Message-ID: <1564513941.4300.33.camel@HansenPartnership.com>
Subject: Do we have a buildd problem?
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Tue, 30 Jul 2019 12:12:21 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Our ports archive is out of date.  I'm getting this problem trying to
apt-get upgrade:

The following packages have unmet dependencies:
 git : Depends: git-man (< 1:2.22.0-.) but 1:2.23.0~rc0-1 is to be installed
E: Unable to correct problems, you have held broken packages.

The issue seems to be that our hppa version of git is

http://ftp.ports.debian.org/debian-ports/pool-hppa/main/g/git/git_2.22.0-1_hppa.deb

But the arch indep pool version of git-man is

http://ftp.ports.debian.org/debian-ports/pool/main/g/git/git-man_2.23.0~rc0-1_all.deb

Indicating our binaries are out of sync.  However, when I look at the
buildd status:

https://buildd.debian.org/status/package.php?p=git&suite=sid

It thinks the hppa version 2.23.0~rc0-1 built successfully, it's just
not in the ports directory for some reason?

James


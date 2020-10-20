Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5780294149
	for <lists+linux-parisc@lfdr.de>; Tue, 20 Oct 2020 19:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390578AbgJTRVG (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 20 Oct 2020 13:21:06 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60517 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730772AbgJTRVG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 20 Oct 2020 13:21:06 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id UvJmkmEi7ghRkUvJnkutgz; Tue, 20 Oct 2020 19:21:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603214464; bh=6GTLmKJynSuPymJmndIaN5fF9SoKYnJXtvuvtmju/qI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=FLUFLzOHBiwUvJK0cPXftoy6D3nATN9DZVLwDAnuejjoCj6ZZsJ7jq8wRvwvc68GW
         bOFFYIKgAqOL5gPUB2knnQHdbAlhoKeC/JvRlunSU58+yQoRDjiNJiBmA5JsuTWG88
         qO2f3metRb4iaZkr00q7BtA5MseMmxOrs+Xqs+G8mt2/Fs6IiOhojP8Bo0ApVIgAtZ
         26L/XK04hyyFgYEpv6W+PbHG88UQ7DkOXgrYfuqGR8SpQRjtOzXdaCrBYuMOu2vYWv
         wn2018tPbaOvduHvOz6E2LVKkpEceg6CL4dKu2BJA2oH2HZ4tsLlXSlDZCHzIw9AsR
         YsVjPXTsg0RnQ==
Date:   Tue, 20 Oct 2020 19:21:01 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] parisc: Define O_NONBLOCK to become 000200000
Message-ID: <20201020192101.772bedd5@wim.jer>
In-Reply-To: <20200829122017.GA3988@ls3530.fritz.box>
References: <20200829122017.GA3988@ls3530.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMiqrqGqjKRCOi22QJ4POgSodfzf9OGqMi/8D1cuyyHjS8bXKNB0/SmVhnAnjRA3Hzer8S7PT7TLueOKObY2j9D66y5wlI0kh14tllKJUEec9B4IZI+s
 02oxvFeqQMWn9RPT57rW6S08Cxyxck26JH4VIoR/JLuQzCUK5BoL7ZQpzEOustbuRbO+AL00KHw0DOzpnw38Us5kD+jFcDrS+F1xNRikiQgygtnuRnR1M6Y0
 Da0+YI723BcM2XhVzGddRWmA7xj0Y11YLQJL+iCe7u9Ek3LdQmKeHlZV88fWlB80
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 29 Aug 2020 14:20:17 +0200
Helge Deller <deller@gmx.de> wrote:

> HPUX has separate NDELAY & NONBLOCK values. In the past we wanted to
> be able to run HP-UX binaries natively on parisc Linux which is why
> we defined O_NONBLOCK to 000200004 to distinguish NDELAY & NONBLOCK
> bits.
> But with 2 bits set in this bitmask we often ran into compatibility
> issues with other Linux applications which often only test one bit (or
> even compare the values).
> 
> To avoid such issues in the future, this patch changes O_NONBLOCK to
> become 000200000. That way old programs will still be functional, and
> for new programs we now have only one bit set.

I am seeing a problem with this exact commit in userland, so I think
that last sentence is incorrect:

/usr/src/linux # git bisect good
75ae04206a4d0e4f541c1d692b7febd1c0fdb814 is the first bad commit
commit 75ae04206a4d0e4f541c1d692b7febd1c0fdb814
Author: Helge Deller <deller@gmx.de>
Date:   Sat Aug 29 14:11:35 2020 +0200

    parisc: Define O_NONBLOCK to become 000200000

    HPUX has separate NDELAY & NONBLOCK values. In the past we wanted to
    be able to run HP-UX binaries natively on parisc Linux which is why
    we defined O_NONBLOCK to 000200004 to distinguish NDELAY & NONBLOCK
    bits.
    But with 2 bits set in this bitmask we often ran into compatibility
    issues with other Linux applications which often only test one bit
    (or even compare the values).

    To avoid such issues in the future, this patch changes O_NONBLOCK to
    become 000200000. That way old programs will still be functional,
    and for new programs we now have only one bit set.

    Update the comment about SOCK_NONBLOCK too.

    Signed-off-by: Helge Deller <deller@gmx.de>

 arch/parisc/include/asm/socket.h     | 4 ++--
 arch/parisc/include/uapi/asm/fcntl.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)


The first sign (in the boot process) that something is wrong is that
idmapd fails to start:

 * Starting idmapd ...
 * make sure DNOTIFY support is enabled ...
 [ !! ]
 * ERROR: rpc.idmapd failed to start
 * ERROR: cannot start nfsclient as rpc.idmapd would not start

Then, elogind reports an error when I ssh in as regular user:

[  297.825133][ T4273] elogind-daemon[4273]: Failed to register SIGHUP
handler: Invalid argument
[  297.825133][ T4273] elogind-daemon[4273]: Failed to register SIGHUP
handler: Invalid argument [  298.040379][ T4273] elogind-daemon[4273]:
Failed to fully start up daemon: Invalid argument
[  298.040379][T4273] elogind-daemon[4273]: Failed to fully start up
daemon: Invalid argument

Yet the unprivileged user succeeds in logging in over SSH. Following
that, sudo fails:

jeroen@karsten ~ $ sudo -i
sudo: unable to allocate memory

root can still login on the serial console and over SSH.

Would it make sense to rebuild libc against the newer kernel headers?

Or is this an unexpected result from the above commit and would it be
useful to figure out what is going on while the bad kernel is running?


Regards,
     jer

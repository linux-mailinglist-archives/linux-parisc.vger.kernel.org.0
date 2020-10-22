Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F2D2961C3
	for <lists+linux-parisc@lfdr.de>; Thu, 22 Oct 2020 17:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368676AbgJVPie (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 22 Oct 2020 11:38:34 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40297 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S368675AbgJVPie (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 22 Oct 2020 11:38:34 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud9.xs4all.net with ESMTPSA
        id VcfZkNebsjIEMVcfak8dMr; Thu, 22 Oct 2020 17:38:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603381111; bh=FQiIaNbRE4OE28W8KC5cxWpBS8iuSvwr3TUzgg7Tgow=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=Kw0NLlJFQjT0W8dMQsbYg70lXHnuBwjl6w5hx78H5q6in+VSBuPQNqGLF+DBtI4a7
         mK+A9TpkLJX/r9XXNzqelqM9tS7pGFvrF+fgjl5UbXlNHEDEI7X6dlVlctjpWYRxsB
         rRg7YpjmLzqz+v9oPxF2wOagiY6b7/abuukuM+43k9mXP4Jvp7s9/FSCoZw+HTXZDB
         5QyA0qLjcznzMF0P5QyyvwDMmsXZqeuuJxFzAYx5aE8yOYIm8A063KeVTtFKFx2Oky
         Hb/qGs+7J9PXr4QbUPk/rknjUNM9L0NPGVYgnl6fr9APdjQ6QsqjKkFBRUEDu9qAwM
         n4rmeWqHWnTnQ==
Date:   Thu, 22 Oct 2020 17:38:24 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] parisc: Define O_NONBLOCK to become 000200000
Message-ID: <20201022173824.49b6b7f5@wim.jer>
In-Reply-To: <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
References: <20200829122017.GA3988@ls3530.fritz.box>
        <20201020192101.772bedd5@wim.jer>
        <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPhPi1YDcns2rSbclwv5KYmKPce0s1FvhS0uzUN6Q1x3+J4b4OlvcDOHTiKy5zbrH2PvjQG5MPE9vNBFKpn6MaXrl7lRhp0nDFKDlp/EroKOhxRfaOuH
 cZiJTRGuUQGVrbrT7YVzL+3lxuBSmhUHeukZjNvlCPK9eIZbsWwDGzqTJQmKCrJsVTQrb6eJX8FVBrKdEP4pGLiqhUTXxsW6MSdOVn4H/VoJ1NyizS7TcEob
 0+UQCFTK6z+5fkXUAAVr7su/DS8+rCvls0R+FRCJYNRFI1Lp0TkGt1+h55Se3/Zb
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 21 Oct 2020 08:07:15 +0200
Helge Deller <deller@gmx.de> wrote:

> On 10/20/20 7:21 PM, Jeroen Roovers wrote:
> > On Sat, 29 Aug 2020 14:20:17 +0200
> > Helge Deller <deller@gmx.de> wrote:
> >  
> >> HPUX has separate NDELAY & NONBLOCK values. In the past we wanted
> >> to be able to run HP-UX binaries natively on parisc Linux which is
> >> why we defined O_NONBLOCK to 000200004 to distinguish NDELAY &
> >> NONBLOCK bits.
> >> But with 2 bits set in this bitmask we often ran into compatibility
> >> issues with other Linux applications which often only test one bit
> >> (or even compare the values).
> >>
> >> To avoid such issues in the future, this patch changes O_NONBLOCK
> >> to become 000200000. That way old programs will still be
> >> functional, and for new programs we now have only one bit set.  
> >
> > I am seeing a problem with this exact commit in userland, so I think
> > that last sentence is incorrect:  
> 
> Thanks for testing and bisecting!!!
> 
> I'm fine with reverting the change, but we really need to
> analyze what is broken (and why).
> 
> In general the kernel sources seem ok as it's important,
> that code just check if bits are set, not if the value
> is equal to something e.g.
> good:  if (flags & O_NONBLOCK) { ... }
> bad:   if (flags == O_NONBLOCK) { .... }
> 
> 
> > The first sign (in the boot process) that something is wrong is that
> > idmapd fails to start:
> >
> >  * Starting idmapd ...
> >  * make sure DNOTIFY support is enabled ...
> >  [ !! ]
> >  * ERROR: rpc.idmapd failed to start
> >  * ERROR: cannot start nfsclient as rpc.idmapd would not start  
> 
> Could you try an strace on it?

[after editing the startup script to run `strace -f .. rpc.idmapd`:]

https://rooversj.home.xs4all.nl/rpc.idmapd.strace

> idmapd is from glibc, so I'll look into it too.
> 
> > Then, elogind reports an error when I ssh in as regular user:
> >
> > [  297.825133][ T4273] elogind-daemon[4273]: Failed to register
> > SIGHUP handler: Invalid argument
> > [  297.825133][ T4273] elogind-daemon[4273]: Failed to register
> > SIGHUP handler: Invalid argument [  298.040379][ T4273]
> > elogind-daemon[4273]: Failed to fully start up daemon: Invalid
> > argument [  298.040379][T4273] elogind-daemon[4273]: Failed to
> > fully start up daemon: Invalid argument

strace -f -o /tmp/elogind.strace /lib/elogind/elogind

https://rooversj.home.xs4all.nl/elogind.strace

> >
> > Yet the unprivileged user succeeds in logging in over SSH. Following
> > that, sudo fails:
> >
> > jeroen@karsten ~ $ sudo -i
> > sudo: unable to allocate memory
> >
> > root can still login on the serial console and over SSH.  
> 
> At first thought I assume those issues are not related to the
> O_NONBLOCK patch. Can you try strace on the sudo too ?

strace -f -u jeroen sudo -i
[...]
pipe2(0x42f4712c, O_NONBLOCK|O_CLOEXEC) = -1 EINVAL (Invalid argument)
openat(AT_FDCWD, 0xfadd9b50, O_RDONLY|O_CLOEXEC) = 3
fstat64(3, 0xfadd9e88)                  = 0
read(3, 0x42f47258, 4096)               = 2998
read(3, "", 4096)                       = 0
close(3)                                = 0
openat(AT_FDCWD, 0x42f46bc0, O_RDONLY)  = -1 ENOENT (No such file or
directory) openat(AT_FDCWD, 0x42f46f48, O_RDONLY)  = -1 ENOENT (No such
file or directory) openat(AT_FDCWD, 0x42f46fc8, O_RDONLY)  = -1 ENOENT
(No such file or directory) openat(AT_FDCWD, 0x42f46f78, O_RDONLY)  =
-1 ENOENT (No such file or directory) ioctl(2, TCGETS, 0xfadd9c08)
      = 0 write(2, 0xfadd7f46, 4sudo)                 = 4
ioctl(2, TCGETS, 0xfadd9c08)            = 0
write(2, 0xf8151e94, 2: )                 = 2
ioctl(2, TCGETS, 0xfadd9c08)            = 0
write(2, 0xfadd9608, 25unable to allocate memory)                = 25
ioctl(2, TCGETS, 0xfadd9c08)            = 0
write(2, 0x42e39934, 2
)                 = 2
exit_group(1)                           = ?
+++ exited with 1 +++

https://rooversj.home.xs4all.nl/sudo-i.strace


Regards,
     jer

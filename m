Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F2A1D9CA4
	for <lists+linux-parisc@lfdr.de>; Tue, 19 May 2020 18:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgESQ3I (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 19 May 2020 12:29:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:10763 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728775AbgESQ3H (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 12:29:07 -0400
IronPort-SDR: B3sIpnkczxXommahql9taU3YYAeIsxYPhMSv9QtrdCEY1AffL5B3a52oNFhMdmWMeUDCstyxME
 NvIDbI1jbFwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 09:29:06 -0700
IronPort-SDR: wMgiwHen2OPFlYyzOEz7g2rJdzh5JJtN4dIY2VFB92QqQMm8kp4VvGIH/smvNQpDVMcoLkKqX3
 R44n5eaK0YwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="343188490"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga001.jf.intel.com with ESMTP; 19 May 2020 09:29:05 -0700
Date:   Tue, 19 May 2020 09:29:05 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200519162904.GA3356843@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
 <20200518042932.GA59205@roeck-us.net>
 <20200519000352.GF3025231@iweiny-DESK2.sc.intel.com>
 <47757f51-15f2-3abe-9035-abdb3ba5816e@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47757f51-15f2-3abe-9035-abdb3ba5816e@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Mon, May 18, 2020 at 07:50:36PM -0700, Guenter Roeck wrote:
> Hi Ira,
> 
> On 5/18/20 5:03 PM, Ira Weiny wrote:
> > On Sun, May 17, 2020 at 09:29:32PM -0700, Guenter Roeck wrote:
> >> On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:
> >>> On Sat, May 16, 2020 at 03:33:06PM -0700, Guenter Roeck wrote:
> >>>> On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
> >>>>> From: Ira Weiny <ira.weiny@intel.com>
> >>>>>
> >>>

Sorry for the delay I missed this email last night...  I blame outlook...  ;-)

...

> >>> Do you have a kernel config?  Specifically is CONFIG_HIGHMEM set?
> >>>
> >> See below. Yes, CONFIG_HIGHMEM is set.
> >>
> >> The scripts used to build and boot the image are at:
> >>
> >> https://github.com/groeck/linux-build-test/tree/master/rootfs/microblazeel
> > 
> > Despite finding the obvious error earlier today I've still been trying to get
> > this to work.
> > 
> > I had to make some slight modifications to use the 0-day cross compile build
> > and my local qemu build.  But those were pretty minor modifications.  I'm
> > running on x86_64 host.
> > 
> > With those slight mods to the scripts I get the following error even without my
> > patch set on 5.7-rc4.  I have 1 cpu pegged at 100% while it is running...  Is
> > there anything I can do to get more debug output?  Perhaps I just need to let
> > it run longer?
> > 
> 
> I don't think so. Try running it with "-d" parameter (run-qemu-microblazeel.sh
> -d petalogix-s3adsp1800); that gives you the qemu command line. Once it says
> "running", abort the script and execute qemu directly.

FYI Minor nit...  a simple copy/paste failed...  that print of the cmd line
did not include quotes around the -append text:

09:06:03 > /home/iweiny/dev/qemu/microblazeel-softmmu/qemu-system-microblazeel
   -M petalogix-s3adsp1800 -m 256 -kernel arch/microblaze/boot/linux.bin
   -no-reboot -initrd /tmp/buildbot-cache/microblazeel/rootfs.cpio -append
   panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyUL0,115200 -monitor
   none -serial stdio -nographic

qemu-system-microblazeel: slub_debug=FZPUA: Could not open 'slub_debug=FZPUA': No such file or directory

> Oh, and please update
> the repository; turns out I didn't push for a while and made a number of
> changes.

Cool beans...  I've updated.

> 
> My compiler was compiled with buildroot (a long time ago). I don't recall if
> it needed something special in the configuration, unfortunately.

AFAICT the compile is working...  It is running from the command line now...  I
expected it to be slow so I have also increased the timeouts last night.  So
far it still fails.  I did notice that there is a new 'R' in the wait output.

<quote>
.........................R......................... failed (silent)
------------
qemu log:
qemu-system-microblazeel: terminating on signal 15 from pid 3357146 (/bin/bash)
</quote>

I was hoping that meant it found qemu 'running' but looks like that was just a
retry...  :-(

Last night I increased some of the timeouts I could find.

<quote>
 LOOPTIME=5     # Wait time before checking status
 -MAXTIME=150    # Maximum wait time for qemu session to complete
 -MAXSTIME=60    # Maximum wait time for qemu session to generate output
 +#MAXTIME=150   # Maximum wait time for qemu session to complete
 +#MAXSTIME=60   # Maximum wait time for qemu session to generate output
 +MAXTIME=300    # Maximum wait time for qemu session to complete
 +MAXSTIME=120   # Maximum wait time for qemu session to generate output
</quote>

But thanks to the qemu command line hint I can see these were not nearly
enough...  (It has been running for > 20 minutes...  and I'm not getting
output...)  Or I've done something really wrong.  Shouldn't qemu be at least
showing something on the terminal by now?  I normally run qemu with different
display options (and my qemu foo is weak) so I'm not sure what I should be
seeing with this command line.

09:06:28 > /home/iweiny/dev/qemu/microblazeel-softmmu/qemu-system-microblazeel
  -M petalogix-s3adsp1800 -m 256 -kernel arch/microblaze/boot/linux.bin
  -no-reboot -initrd /tmp/buildbot-cache/microblazeel/rootfs.cpio -append
  "panic=-1 slub_debug=FZPUA rdinit=/sbin/init console=ttyUL0,115200" -monitor
  none -serial stdio -nographic

Maybe I just have too slow of a machine...  :-/

My qemu was built back in March.  I'm updating that now...

Sorry for being so dense...
Ira

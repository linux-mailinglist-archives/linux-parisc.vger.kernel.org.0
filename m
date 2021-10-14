Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B5D42D892
	for <lists+linux-parisc@lfdr.de>; Thu, 14 Oct 2021 13:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhJNLwM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 14 Oct 2021 07:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28271 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231293AbhJNLwK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 14 Oct 2021 07:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634212205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BjIpv+udz4Ba/qOEMRyyxOUnaMX1at+9okP/sD2YABQ=;
        b=RJbGGIXmx737jWGuoaQ8BkDITholNunoKfz2idBH8Ex9dwETzD6evS4D1CIE7V9DHUciz4
        tIIp3EVImjL3SuQUCsQxqGKnmw7Bo0J8UBrdr5DKdcGaLtonDs3pki71SV7Dk0V/XrKKVS
        hRNVJHH+BKAKBG8xync17sEcCJQHEn8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-A6iUMXyYMxOWAJ4Gy8vjug-1; Thu, 14 Oct 2021 07:50:04 -0400
X-MC-Unique: A6iUMXyYMxOWAJ4Gy8vjug-1
Received: by mail-wr1-f69.google.com with SMTP id k2-20020adfc702000000b0016006b2da9bso4363539wrg.1
        for <linux-parisc@vger.kernel.org>; Thu, 14 Oct 2021 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BjIpv+udz4Ba/qOEMRyyxOUnaMX1at+9okP/sD2YABQ=;
        b=vroQ+UtpitDXlClYTOOr3b8TiySMYdCDLgyhXYRYPTOm1m3suh0pMUGR9IVtQsuFQy
         u+NVrV7lWTC3L/ldLru6T8EJf4GTUos0mbYNlipWTXHaZJBA07ae1REau3QoUDgvqlLp
         vpPd5ZLNzoW/3WJCKgX0EoPkigVlP7xnFU+t46T0+0QJQdNKZEbSd8wqgonpACv56fzD
         yVoqwC5Y8C6sFNZawoZRyp/zzYi8YZlynyCsCD5+H5z+pNT93XEh074WmcMrcFRMy8Fw
         1LJ0KMlDR737pzNRvGgUE1QK4E4iF6bG3tywcm/Y9YoeFMMADST4JoQR80/ZCcZxOIPq
         jSXA==
X-Gm-Message-State: AOAM5310mTo/fQYx1fw+ZQyTotozLSJi2EFAWWRMkJEB+rG6HjoTLqIT
        BsUR5pz2qb0JCxr2Scv4jGUypVVdQo7hIR3I01w4UTdu4sfLRZI8OOkcK+Py37KrY1C43TbQpvR
        wK900pXXlXdrseNo/CE/baiCg
X-Received: by 2002:adf:959a:: with SMTP id p26mr5903582wrp.342.1634212203031;
        Thu, 14 Oct 2021 04:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9qOw3WbNBTRd79UJzGLK0rcHBsHFX2nKa+bjejslC1TbPETWCFjebXvTyHUX4CLIfPAkTIA==
X-Received: by 2002:adf:959a:: with SMTP id p26mr5903550wrp.342.1634212202845;
        Thu, 14 Oct 2021 04:50:02 -0700 (PDT)
Received: from redhat.com ([2.55.16.227])
        by smtp.gmail.com with ESMTPSA id o1sm2171853wru.91.2021.10.14.04.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 04:50:02 -0700 (PDT)
Date:   Thu, 14 Oct 2021 07:49:55 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Reshetova, Elena" <elena.reshetova@intel.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        "Williams, Dan J" <dan.j.williams@intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "Lutomirski, Andy" <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        James E J Bottomley <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter H Anvin <hpa@zytor.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        "Luck, Tony" <tony.luck@intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
Message-ID: <20211014065626-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <DM8PR11MB57501C8F8F5C8B315726882EE7B69@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20211012171016-mutt-send-email-mst@kernel.org>
 <DM8PR11MB5750A40FAA6AFF6A29CF70DAE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
 <20211014025514-mutt-send-email-mst@kernel.org>
 <DM8PR11MB57500B2D821E8AAF93EB66CEE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB57500B2D821E8AAF93EB66CEE7B89@DM8PR11MB5750.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Oct 14, 2021 at 07:27:42AM +0000, Reshetova, Elena wrote:
> > On Thu, Oct 14, 2021 at 06:32:32AM +0000, Reshetova, Elena wrote:
> > > > On Tue, Oct 12, 2021 at 06:36:16PM +0000, Reshetova, Elena wrote:
> > > > > > The 5.15 tree has something like ~2.4k IO accesses (including MMIO and
> > > > > > others) in init functions that also register drivers (thanks Elena for
> > > > > > the number)
> > > > >
> > > > > To provide more numbers on this. What I can see so far from a smatch-based
> > > > > analysis, we have 409 __init style functions (.probe & builtin/module_
> > > > > _platform_driver_probe excluded) for 5.15 with allyesconfig.
> > > >
> > > > I don't think we care about allyesconfig at all though.
> > > > Just don't do that.
> > > > How about allmodconfig? This is closer to what distros actually do.
> > >
> > > It does not make any difference really for the content of the /drivers/*:
> > > gives 408 __init style functions doing IO (.probe & builtin/module_
> > > > > _platform_driver_probe excluded) for 5.15 with allmodconfig:
> > >
> > > ['doc200x_ident_chip',
> > > 'doc_probe', 'doc2001_init', 'mtd_speedtest_init',
> > > 'mtd_nandbiterrs_init', 'mtd_oobtest_init', 'mtd_pagetest_init',
> > > 'tort_init', 'mtd_subpagetest_init', 'fixup_pmc551',
> > > 'doc_set_driver_info', 'init_amd76xrom', 'init_l440gx',
> > > 'init_sc520cdp', 'init_ichxrom', 'init_ck804xrom', 'init_esb2rom',
> > > 'probe_acpi_namespace_devices', 'amd_iommu_init_pci', 'state_next',
> > > 'arm_v7s_do_selftests', 'arm_lpae_run_tests', 'init_iommu_one',
> > 
> > Um. ARM? Which architecture is this build for?
> 
> The list of smatch IO findings is built for x86, but the smatch cross function
> database covers all archs, so when queried for all potential function callers,
> it would show non x86 arch call chains also. 
> 
> Here is the original x86 finding and call chain for the 'arm_v7s_do_selftests':
> 
>   Detected low-level IO from arm_v7s_do_selftests in fun
> __iommu_queue_command_sync
> 
> drivers/iommu/amd/iommu.c:1025 __iommu_queue_command_sync() error:
> {15002074744551330002}
>     'check_host_input' read from the host using function 'readl' to a
> member of the structure 'iommu->cmd_buf_head';
> 
> __iommu_queue_command_sync()
>   iommu_completion_wait()
>     amd_iommu_domain_flush_complete()
>       iommu_v1_map_page()
>         arm_v7s_do_selftests()
> 
> So, the results can be further filtered if you want a specified arch. 

Even better would be a typical distro build.

-- 
MST


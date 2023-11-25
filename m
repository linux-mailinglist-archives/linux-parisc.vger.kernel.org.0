Return-Path: <linux-parisc+bounces-67-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0557F8F76
	for <lists+linux-parisc@lfdr.de>; Sat, 25 Nov 2023 22:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB2721F20D4A
	for <lists+linux-parisc@lfdr.de>; Sat, 25 Nov 2023 21:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5E030643;
	Sat, 25 Nov 2023 21:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5MdFxkX"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058CAEA;
	Sat, 25 Nov 2023 13:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700947629; x=1732483629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2msMvypUB/fdSacdfq9Xd4cZCJy1Df5Vy8rcx7wAbvU=;
  b=h5MdFxkXps8xxIIEmvAqNKS83qsdCj8x/2AgIa9dS8iTCdNIsmttHvkU
   tQOX3JbiR3gC+BewDnsvd/CeqkpdRGcj20M9QGxa9aF6PQg9v/5Bznnkh
   5+vmQb8ICobEpU7SIusv0Jcy6rBTae8gMrJWAv3t351Thr3G22kgQbkhr
   Zim7NxRT4KEqULS0oF4ssQz9yO1DsTs4RgIwKH/P7ZuqNml6fW68+EaPj
   5NL2tgAvm4hTX6cI0cw8VrTNYXtjZCMgr660S1RQTlrXAaff7wiqLZC2V
   pF5qzw8OoIGEXe0JX/OCpeomWKsT3a1uzCOg4vCyxHcZODF4SjxiVLH2j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="5698985"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="5698985"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 13:27:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="761258825"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="761258825"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2023 13:27:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r70B3-0004RK-3B;
	Sat, 25 Nov 2023 21:27:01 +0000
Date: Sun, 26 Nov 2023 05:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kexec@lists.infradead.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	joe@perches.com, nathan@kernel.org, yujie.liu@intel.com,
	Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 4/7] kexec_file, arm64: print out debugging message if
 required
Message-ID: <202311260548.1HaxcDnE-lkp@intel.com>
References: <20231124033642.520686-5-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124033642.520686-5-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231124-113942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20231124033642.520686-5-bhe%40redhat.com
patch subject: [PATCH v2 4/7] kexec_file, arm64: print out debugging message if required
config: arm64-randconfig-001-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260548.1HaxcDnE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260548.1HaxcDnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260548.1HaxcDnE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/machine_kexec.c:35:2: error: implicit declaration of function 'kexec_dprintk' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kexec_dprintk("%s:%d:\n", func, line);
           ^
   1 error generated.


vim +/kexec_dprintk +35 arch/arm64/kernel/machine_kexec.c

    27	
    28	/**
    29	 * kexec_image_info - For debugging output.
    30	 */
    31	#define kexec_image_info(_i) _kexec_image_info(__func__, __LINE__, _i)
    32	static void _kexec_image_info(const char *func, int line,
    33		const struct kimage *kimage)
    34	{
  > 35		kexec_dprintk("%s:%d:\n", func, line);
    36		kexec_dprintk("  kexec kimage info:\n");
    37		kexec_dprintk("    type:        %d\n", kimage->type);
    38		kexec_dprintk("    head:        %lx\n", kimage->head);
    39		kexec_dprintk("    kern_reloc: %pa\n", &kimage->arch.kern_reloc);
    40		kexec_dprintk("    el2_vectors: %pa\n", &kimage->arch.el2_vectors);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


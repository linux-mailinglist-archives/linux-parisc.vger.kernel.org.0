Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D284C2117
	for <lists+linux-parisc@lfdr.de>; Thu, 24 Feb 2022 02:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiBXBh3 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 23 Feb 2022 20:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiBXBh2 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 23 Feb 2022 20:37:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5580E37AA8;
        Wed, 23 Feb 2022 17:36:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2732661225;
        Thu, 24 Feb 2022 01:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830A2C340EF;
        Thu, 24 Feb 2022 01:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645666617;
        bh=vBJAZd1CccyWPiWdf3APX0Xd0PqiwkoBmFegLWrZQO8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kbPswrL78sJ1gBnDWMCD95VCXVopxyZslcKIyqexkswH5CaSiC8868TnScmtZHbW3
         ngBQZdCfSttLbRPeYS56h2gtVwc3moviMuRokE13iC7pj4x5P1n95gH1QqqKx5o/w8
         5wvW0HOJm8JmKjufoX18OB42+rI/H1tngQOhpsPXoYTYSkX+o8JWpEU7FiAgVvBXGQ
         zDfBK0hmWN6XfjH4wkbUBtHIQPEhxHZ3RzIc3wG8tSPsLjHwzjQuUl5AigbatDZwTL
         amDu3w0VDQSaaPOb7SrcY9YjQAkqGSn/tXdabGrjra+6qw5vGppWEWt9lOUi1cC51g
         rhSXVSTA1FJrg==
Received: by mail-vs1-f52.google.com with SMTP id g21so607436vsp.6;
        Wed, 23 Feb 2022 17:36:57 -0800 (PST)
X-Gm-Message-State: AOAM5314p/2V94N2dLTPQo0SLE1uJUPwRmNH6DGmCZWXki5btLrgAuoz
        IEuOGtXUNpHw28AkIKmLmunWFvjusYjkmJAjl9s=
X-Google-Smtp-Source: ABdhPJx/2DTCqfUY4pU/h1e0PfREW/sDxh9qfRIGR58Ezkn5ZMZA8VEhItef44frTEcqdIbcqVdjAMZtcKnOwl3cuQs=
X-Received: by 2002:a05:6102:c4a:b0:31a:54e6:edb1 with SMTP id
 y10-20020a0561020c4a00b0031a54e6edb1mr113668vss.51.1645666616382; Wed, 23 Feb
 2022 17:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-18-guoren@kernel.org> <mhng-fda909a7-d09a-4835-94a9-90a0746f6a95@palmer-ri-x1c9>
In-Reply-To: <mhng-fda909a7-d09a-4835-94a9-90a0746f6a95@palmer-ri-x1c9>
From:   Guo Ren <guoren@kernel.org>
Date:   Thu, 24 Feb 2022 09:36:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSjmP4EHtBZPsct2UOxUbFXw-0PXm_HNfYd9EMntVAunA@mail.gmail.com>
Message-ID: <CAJF2gTSjmP4EHtBZPsct2UOxUbFXw-0PXm_HNfYd9EMntVAunA@mail.gmail.com>
Subject: Re: [PATCH V5 17/21] riscv: compat: vdso: Add setup additional pages implementation
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Feb 23, 2022 at 9:42 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 01 Feb 2022 07:05:41 PST (-0800), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Reconstruct __setup_additional_pages() by appending vdso info
> > pointer argument to meet compat_vdso_info requirement. And change
> > vm_special_mapping *dm, *cm initialization into static.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
> >  arch/riscv/include/asm/elf.h |   5 ++
> >  arch/riscv/include/asm/mmu.h |   1 +
> >  arch/riscv/kernel/vdso.c     | 104 +++++++++++++++++++++++++----------
> >  3 files changed, 81 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> > index 3a4293dc7229..d87d3bcc758d 100644
> > --- a/arch/riscv/include/asm/elf.h
> > +++ b/arch/riscv/include/asm/elf.h
> > @@ -134,5 +134,10 @@ do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)                \
> >  typedef compat_ulong_t                       compat_elf_greg_t;
> >  typedef compat_elf_greg_t            compat_elf_gregset_t[ELF_NGREG];
> >
> > +extern int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
> > +                                           int uses_interp);
> > +#define compat_arch_setup_additional_pages \
> > +                             compat_arch_setup_additional_pages
> > +
> >  #endif /* CONFIG_COMPAT */
> >  #endif /* _ASM_RISCV_ELF_H */
> > diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> > index 0099dc116168..cedcf8ea3c76 100644
> > --- a/arch/riscv/include/asm/mmu.h
> > +++ b/arch/riscv/include/asm/mmu.h
> > @@ -16,6 +16,7 @@ typedef struct {
> >       atomic_long_t id;
> >  #endif
> >       void *vdso;
> > +     void *vdso_info;
> >  #ifdef CONFIG_SMP
> >       /* A local icache flush is needed before user execution can resume. */
> >       cpumask_t icache_stale_mask;
> > diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> > index a9436a65161a..deca69524799 100644
> > --- a/arch/riscv/kernel/vdso.c
> > +++ b/arch/riscv/kernel/vdso.c
> > @@ -23,6 +23,9 @@ struct vdso_data {
> >  #endif
> >
> >  extern char vdso_start[], vdso_end[];
> > +#ifdef CONFIG_COMPAT
> > +extern char compat_vdso_start[], compat_vdso_end[];
> > +#endif
> >
> >  enum vvar_pages {
> >       VVAR_DATA_PAGE_OFFSET,
> > @@ -30,6 +33,11 @@ enum vvar_pages {
> >       VVAR_NR_PAGES,
> >  };
> >
> > +enum rv_vdso_map {
> > +     RV_VDSO_MAP_VVAR,
> > +     RV_VDSO_MAP_VDSO,
> > +};
> > +
> >  #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
> >
> >  /*
> > @@ -52,12 +60,6 @@ struct __vdso_info {
> >       struct vm_special_mapping *cm;
> >  };
> >
> > -static struct __vdso_info vdso_info __ro_after_init = {
> > -     .name = "vdso",
> > -     .vdso_code_start = vdso_start,
> > -     .vdso_code_end = vdso_end,
> > -};
> > -
> >  static int vdso_mremap(const struct vm_special_mapping *sm,
> >                      struct vm_area_struct *new_vma)
> >  {
> > @@ -66,35 +68,35 @@ static int vdso_mremap(const struct vm_special_mapping *sm,
> >       return 0;
> >  }
> >
> > -static int __init __vdso_init(void)
> > +static int __init __vdso_init(struct __vdso_info *vdso_info)
> >  {
> >       unsigned int i;
> >       struct page **vdso_pagelist;
> >       unsigned long pfn;
> >
> > -     if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
> > +     if (memcmp(vdso_info->vdso_code_start, "\177ELF", 4)) {
> >               pr_err("vDSO is not a valid ELF object!\n");
> >               return -EINVAL;
> >       }
> >
> > -     vdso_info.vdso_pages = (
> > -             vdso_info.vdso_code_end -
> > -             vdso_info.vdso_code_start) >>
> > +     vdso_info->vdso_pages = (
> > +             vdso_info->vdso_code_end -
> > +             vdso_info->vdso_code_start) >>
> >               PAGE_SHIFT;
> >
> > -     vdso_pagelist = kcalloc(vdso_info.vdso_pages,
> > +     vdso_pagelist = kcalloc(vdso_info->vdso_pages,
> >                               sizeof(struct page *),
> >                               GFP_KERNEL);
> >       if (vdso_pagelist == NULL)
> >               return -ENOMEM;
> >
> >       /* Grab the vDSO code pages. */
> > -     pfn = sym_to_pfn(vdso_info.vdso_code_start);
> > +     pfn = sym_to_pfn(vdso_info->vdso_code_start);
> >
> > -     for (i = 0; i < vdso_info.vdso_pages; i++)
> > +     for (i = 0; i < vdso_info->vdso_pages; i++)
> >               vdso_pagelist[i] = pfn_to_page(pfn + i);
> >
> > -     vdso_info.cm->pages = vdso_pagelist;
> > +     vdso_info->cm->pages = vdso_pagelist;
> >
> >       return 0;
> >  }
> > @@ -116,13 +118,14 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
> >  {
> >       struct mm_struct *mm = task->mm;
> >       struct vm_area_struct *vma;
> > +     struct __vdso_info *vdso_info = mm->context.vdso_info;
>
> IIUC this is the only use for context.vdso_info?  If that's the case,
> can we just switch between VDSO targets based on __is_compat_task(task)?
> That'd save an mm_struct pointer, which is always nice.  It'd probably
> be worth cleaning up the arm64 port too, which zaps both mappings.
Do you want rv32 to support HAVE_GENERIC_VDSO_NS in the future?

>
> >
> >       mmap_read_lock(mm);
> >
> >       for (vma = mm->mmap; vma; vma = vma->vm_next) {
> >               unsigned long size = vma->vm_end - vma->vm_start;
> >
> > -             if (vma_is_special_mapping(vma, vdso_info.dm))
> > +             if (vma_is_special_mapping(vma, vdso_info->dm))
> >                       zap_page_range(vma, vma->vm_start, size);
> >       }
> >
> > @@ -187,11 +190,6 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> >       return vmf_insert_pfn(vma, vmf->address, pfn);
> >  }
> >
> > -enum rv_vdso_map {
> > -     RV_VDSO_MAP_VVAR,
> > -     RV_VDSO_MAP_VDSO,
> > -};
> > -
> >  static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
> >       [RV_VDSO_MAP_VVAR] = {
> >               .name   = "[vvar]",
> > @@ -203,25 +201,53 @@ static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
> >       },
> >  };
> >
> > +static struct __vdso_info vdso_info __ro_after_init = {
> > +     .name = "vdso",
> > +     .vdso_code_start = vdso_start,
> > +     .vdso_code_end = vdso_end,
> > +     .dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
> > +     .cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
> > +};
> > +
> > +#ifdef CONFIG_COMPAT
> > +static struct __vdso_info compat_vdso_info __ro_after_init = {
> > +     .name = "compat_vdso",
> > +     .vdso_code_start = compat_vdso_start,
> > +     .vdso_code_end = compat_vdso_end,
> > +     .dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
> > +     .cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
> > +};
> > +#endif
> > +
> >  static int __init vdso_init(void)
> >  {
> > -     vdso_info.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR];
> > -     vdso_info.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO];
> > +     int ret;
> > +
> > +     ret = __vdso_init(&vdso_info);
> > +     if (ret)
> > +             goto out;
> >
> > -     return __vdso_init();
> > +#ifdef CONFIG_COMPAT
> > +     ret = __vdso_init(&compat_vdso_info);
> > +     if (ret)
> > +             goto out;
>
> It's a bit pedantic (we're just going to crash anyway), but this is
> mising the cleanup for the first __vdso_init().
>
> > +#endif
> > +out:
> > +     return ret;
> >  }
> >  arch_initcall(vdso_init);
> >
> >  static int __setup_additional_pages(struct mm_struct *mm,
> >                                   struct linux_binprm *bprm,
> > -                                 int uses_interp)
> > +                                 int uses_interp,
> > +                                 struct __vdso_info *vdso_info)
> >  {
> >       unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
> >       void *ret;
> >
> >       BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
> >
> > -     vdso_text_len = vdso_info.vdso_pages << PAGE_SHIFT;
> > +     vdso_text_len = vdso_info->vdso_pages << PAGE_SHIFT;
> >       /* Be sure to map the data page */
> >       vdso_mapping_len = vdso_text_len + VVAR_SIZE;
> >
> > @@ -232,16 +258,18 @@ static int __setup_additional_pages(struct mm_struct *mm,
> >       }
> >
> >       ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
> > -             (VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info.dm);
> > +             (VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info->dm);
> >       if (IS_ERR(ret))
> >               goto up_fail;
> >
> >       vdso_base += VVAR_SIZE;
> >       mm->context.vdso = (void *)vdso_base;
> > +     mm->context.vdso_info = (void *)vdso_info;
> > +
> >       ret =
> >          _install_special_mapping(mm, vdso_base, vdso_text_len,
> >               (VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> > -             vdso_info.cm);
> > +             vdso_info->cm);
> >
> >       if (IS_ERR(ret))
> >               goto up_fail;
> > @@ -253,6 +281,24 @@ static int __setup_additional_pages(struct mm_struct *mm,
> >       return PTR_ERR(ret);
> >  }
> >
> > +#ifdef CONFIG_COMPAT
> > +int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
> > +                                    int uses_interp)
> > +{
> > +     struct mm_struct *mm = current->mm;
> > +     int ret;
> > +
> > +     if (mmap_write_lock_killable(mm))
> > +             return -EINTR;
> > +
> > +     ret = __setup_additional_pages(mm, bprm, uses_interp,
> > +                                                     &compat_vdso_info);
> > +     mmap_write_unlock(mm);
> > +
> > +     return ret;
> > +}
> > +#endif
> > +
> >  int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
> >  {
> >       struct mm_struct *mm = current->mm;
> > @@ -261,7 +307,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
> >       if (mmap_write_lock_killable(mm))
> >               return -EINTR;
> >
> > -     ret = __setup_additional_pages(mm, bprm, uses_interp);
> > +     ret = __setup_additional_pages(mm, bprm, uses_interp, &vdso_info);
> >       mmap_write_unlock(mm);
> >
> >       return ret;
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> As I don't think either of these are big enough of a deal to keep from merging
> this.



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

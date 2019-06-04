Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86FFB34FDD
	for <lists+linux-parisc@lfdr.de>; Tue,  4 Jun 2019 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfFDSen (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 4 Jun 2019 14:34:43 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:47937 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfFDSen (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 4 Jun 2019 14:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
        bh=ZIQfQw//dX+ATnJnm1JHYVg+GQfU15Fv5BWHkuDjnmc=; b=Y2iI50cpHkGPJgXzuUvnulF195
        aV/pdLagXHqQ+GnQ9KwdMukpevmIZJCdBEaC5XjBJdEcrRT5HSav6MWTNWvx8FkOQARnN+exBe1bA
        JMeVoBQCWFlI0daFWzGV1Akf6qvxtPmo9e6U4JEgpxKK4VlpCowQPYIh/z7rF+1hMrZU=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hYEGe-0002tN-Uv; Tue, 04 Jun 2019 20:34:41 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH v2 4/6] parisc: use pr_debug() in kernel/module.c
Date:   Tue,  4 Jun 2019 20:34:33 +0200
Message-Id: <20190604183435.20175-5-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604183435.20175-1-svens@stackframe.org>
References: <20190604183435.20175-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Instead of using our own version, switch to the generic
pr_() calls.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 arch/parisc/kernel/module.c | 44 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index 43778420614b..3ff3b48df6e6 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -48,9 +48,9 @@
  *	However, SEGREL32 is used only for PARISC unwind entries, and we want
  *	those entries to have an absolute address, and not just an offset.
  *
- *	The unwind table mechanism has the ability to specify an offset for 
+ *	The unwind table mechanism has the ability to specify an offset for
  *	the unwind table; however, because we split off the init functions into
- *	a different piece of memory, it is not possible to do this using a 
+ *	a different piece of memory, it is not possible to do this using a
  *	single offset. Instead, we use the above hack for now.
  */
 
@@ -68,12 +68,6 @@
 #include <asm/unwind.h>
 #include <asm/sections.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
-#endif
-
 #define RELOC_REACHABLE(val, bits) \
 	(( ( !((val) & (1<<((bits)-1))) && ((val)>>(bits)) != 0 )  ||	\
 	     ( ((val) & (1<<((bits)-1))) && ((val)>>(bits)) != (((__typeof__(val))(~0))>>((bits)+2)))) ? \
@@ -315,7 +309,7 @@ unsigned int arch_mod_section_prepend(struct module *mod,
 		* sizeof(struct stub_entry);
 }
 
-#define CONST 
+#define CONST
 int module_frob_arch_sections(CONST Elf_Ehdr *hdr,
 			      CONST Elf_Shdr *sechdrs,
 			      CONST char *secstrings,
@@ -401,7 +395,7 @@ static Elf64_Word get_got(struct module *me, unsigned long value, long addend)
 
 	got[i].addr = value;
  out:
-	DEBUGP("GOT ENTRY %d[%x] val %lx\n", i, i*sizeof(struct got_entry),
+	pr_debug("GOT ENTRY %d[%lx] val %lx\n", i, i*sizeof(struct got_entry),
 	       value);
 	return i * sizeof(struct got_entry);
 }
@@ -554,7 +548,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 	//unsigned long dp = (unsigned long)$global$;
 	register unsigned long dp asm ("r27");
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       targetsec);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -578,7 +572,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 
 #if 0
 #define r(t) ELF32_R_TYPE(rel[i].r_info)==t ? #t :
-		DEBUGP("Symbol %s loc 0x%x val 0x%x addend 0x%x: %s\n",
+		pr_debug("Symbol %s loc 0x%x val 0x%x addend 0x%x: %s\n",
 			strtab + sym->st_name,
 			(uint32_t)loc, val, addend,
 			r(R_PARISC_PLABEL32)
@@ -619,7 +613,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* See note about special handling of SEGREL32 at
 			 * the beginning of this file.
 			 */
-			*loc = fsel(val, addend); 
+			*loc = fsel(val, addend);
 			break;
 		case R_PARISC_SECREL32:
 			/* 32-bit section relative address. */
@@ -698,7 +692,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 	Elf_Addr loc0;
 	unsigned int targetsec = sechdrs[relsec].sh_info;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       targetsec);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -740,7 +734,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 		case R_PARISC_LTOFF21L:
 			/* LT-relative; left 21 bits */
 			val = get_got(me, val, addend);
-			DEBUGP("LTOFF21L Symbol %s loc %p val %lx\n",
+			pr_debug("LTOFF21L Symbol %s loc %p val %llx\n",
 			       strtab + sym->st_name,
 			       loc, val);
 			val = lrsel(val, 0);
@@ -751,14 +745,14 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* LT-relative; right 14 bits */
 			val = get_got(me, val, addend);
 			val = rrsel(val, 0);
-			DEBUGP("LTOFF14R Symbol %s loc %p val %lx\n",
+			pr_debug("LTOFF14R Symbol %s loc %p val %llx\n",
 			       strtab + sym->st_name,
 			       loc, val);
 			*loc = mask(*loc, 14) | reassemble_14(val);
 			break;
 		case R_PARISC_PCREL22F:
 			/* PC-relative; 22 bits */
-			DEBUGP("PCREL22F Symbol %s loc %p val %lx\n",
+			pr_debug("PCREL22F Symbol %s loc %p val %llx\n",
 			       strtab + sym->st_name,
 			       loc, val);
 			val += addend;
@@ -790,7 +784,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 					val = get_stub(me, val, addend, ELF_STUB_GOT,
 						       loc0, targetsec);
 			}
-			DEBUGP("STUB FOR %s loc %lx, val %lx+%lx at %lx\n", 
+			pr_debug("STUB FOR %s loc %px, val %llx+%llx at %llx\n",
 			       strtab + sym->st_name, loc, sym->st_value,
 			       addend, val);
 			val = (val - dot - 8)/4;
@@ -810,7 +804,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* See note about special handling of SEGREL32 at
 			 * the beginning of this file.
 			 */
-			*loc = fsel(val, addend); 
+			*loc = fsel(val, addend);
 			break;
 		case R_PARISC_SECREL32:
 			/* 32-bit section relative address. */
@@ -820,14 +814,14 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* 64-bit function address */
 			if(in_local(me, (void *)(val + addend))) {
 				*loc64 = get_fdesc(me, val+addend);
-				DEBUGP("FDESC for %s at %p points to %lx\n",
+				pr_debug("FDESC for %s at %llx points to %llx\n",
 				       strtab + sym->st_name, *loc64,
 				       ((Elf_Fdesc *)*loc64)->addr);
 			} else {
 				/* if the symbol is not local to this
 				 * module then val+addend is a pointer
 				 * to the function descriptor */
-				DEBUGP("Non local FPTR64 Symbol %s loc %p val %lx\n",
+				pr_debug("Non local FPTR64 Symbol %s loc %p val %llx\n",
 				       strtab + sym->st_name,
 				       loc, val);
 				*loc64 = val + addend;
@@ -858,7 +852,7 @@ register_unwind_table(struct module *me,
 	end = table + sechdrs[me->arch.unwind_section].sh_size;
 	gp = (Elf_Addr)me->core_layout.base + me->arch.got_offset;
 
-	DEBUGP("register_unwind_table(), sect = %d at 0x%p - 0x%p (gp=0x%lx)\n",
+	pr_debug("register_unwind_table(), sect = %d at 0x%p - 0x%p (gp=0x%lx)\n",
 	       me->arch.unwind_section, table, end, gp);
 	me->arch.unwind = unwind_table_add(me->name, 0, gp, table, end);
 }
@@ -914,7 +908,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 		}
 	}
 
-	DEBUGP("module %s: strtab %p, symhdr %p\n",
+	pr_debug("module %s: strtab %p, symhdr %p\n",
 	       me->name, strtab, symhdr);
 
 	if(me->arch.got_count > MAX_GOTS) {
@@ -933,7 +927,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 	oldptr = (void *)symhdr->sh_addr;
 	newptr = oldptr + 1;	/* we start counting at 1 */
 	nsyms = symhdr->sh_size / sizeof(Elf_Sym);
-	DEBUGP("OLD num_symtab %lu\n", nsyms);
+	pr_debug("OLD num_symtab %lu\n", nsyms);
 
 	for (i = 1; i < nsyms; i++) {
 		oldptr++;	/* note, count starts at 1 so preincrement */
@@ -948,7 +942,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 
 	}
 	nsyms = newptr - (Elf_Sym *)symhdr->sh_addr;
-	DEBUGP("NEW num_symtab %lu\n", nsyms);
+	pr_debug("NEW num_symtab %lu\n", nsyms);
 	symhdr->sh_size = nsyms * sizeof(Elf_Sym);
 
 	/* find .altinstructions section */
-- 
2.20.1


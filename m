Return-Path: <linux-parisc+bounces-4567-lists+linux-parisc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-parisc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJbHNDDjjGk/uwAAu9opvQ
	(envelope-from <linux-parisc+bounces-4567-lists+linux-parisc=lfdr.de@vger.kernel.org>)
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 21:14:40 +0100
X-Original-To: lists+linux-parisc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E361B127587
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 21:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 925DA300463E
	for <lists+linux-parisc@lfdr.de>; Wed, 11 Feb 2026 20:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03625340294;
	Wed, 11 Feb 2026 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+BZmpwx"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5F3570D6
	for <linux-parisc@vger.kernel.org>; Wed, 11 Feb 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840874; cv=pass; b=PukuPxdj3pmq4iXKcpbhEoYvX+xdIKD9taWvzqItS4glhBVGE0aYoadu1o4b5Xvuv83LsnXzliwKCBb9T24R9Qyeh8IeA3cxRlN8kgNv5CAt0+SSkEBHlLZmaHjqsj9mZkdtf+aZGcWBepAehZdpC7su9AzRcKIARuRR5UlAac8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840874; c=relaxed/simple;
	bh=XTU0SZsxOmJ3FoM/DLxyJrm+s5UGvDwm08Uhn3BjVVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJzoftSCTuqK4OcmIZC4C9JYELXlr9nWh9t/Zvb+2eorOK4mCZHdoWWm+I9iy8B1dtBGDRv9HeFN1//9JI+FzLG5NFp2RkKxsX9tvp8CPji2sNqxk+4yS4c7ohoGVrn60IbgBkZjx0fc8bMcHfdNjQgQl9HOTT7M1tI2QwIiK18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+BZmpwx; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65a431e305eso1546328a12.0
        for <linux-parisc@vger.kernel.org>; Wed, 11 Feb 2026 12:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840872; cv=none;
        d=google.com; s=arc-20240605;
        b=F/vBCD0r9G56HpFxz05C46JCzn71bzhXtwVWF3XPaZOT2BdN3/DNoPVIReXwQywccp
         tJYb0F7v1BbARidNTpzI4mquQytuQ354jm3PJ67fYSvHmQIFD7rukU2WYLwqr94lgQ/K
         Xx0XKmzL9+Kx1dHlsFXJrsHPjcZZK8q30NdrIegJKtMvpwhOrqJlVXoVs9bMepiw6R06
         agTLI3aIgz+f0Yvv8Cy6SAVOIKXVKXzdyvY4yJrJURWCXJeBG5z3rOhBBg8We7iMhNoh
         eYSinuQLEYblTRuSJ4jxkIkUsQJHQz17ZmJdVYg+/5tzTI3xT1nnMK3HO5Nw00H8qAbA
         oVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        fh=OjNaeeZfxYcdj99D5ObG+MJFc8fLVRsVdqgtvegMf1A=;
        b=lqAeitFb7yScHbemG+P0lN4H3lun9bVSgA6d/NDxBewAFHh4zb/u/PKjTS6YcevsnV
         W3WEoQ3WV0D2YFSPIGWfrScQgyVJFzlR/wsad4tTK+4ONu6CTvvMukvf71F06WcV5HTv
         UREHOwTePEsZlf83vj8mTMoF9bReVD3TEz+XZyh9pmXs7uu7b9V77GGdjZ3B75k20VIf
         i7l7+zEJUQuXBzbMUdwfkfcp8f7HLEvhJDEIJMWn3IjAUUiDhcltop/j+dNG7fBG2MfX
         eRpHfJs5qR4uqd18ToxcqbymBcVXLNo5swkWcs/WdKNRONgTJNTIOxMPmXO6anYEO7Hc
         ThkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770840872; x=1771445672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=U+BZmpwxb0B+eJodBh5iYdwN9Lzp7irxUy8fs3NOdprJYIHxQZLf/1DzGuf6k2n3yz
         Bqv+t2b1ZZRzIznR4S0yQr7i2zx3aJqBieQ1f86k9HMjZFj/dfEHLBDtaTstMxv7EWQp
         YR9FxsBl0x40sGnnEMgNJdk0CxJBPCHqbOMyVk+DgEw5LuRp1PdLZs4NxAuyIfavGkqE
         LFRnlEdLPJoEs/JMEJ/a1hofx+sOOfaNGsIheA42ud+8y1lVeOPJX3kdVH82vSf/u/+k
         zej+c/QXWftNS1FLxD0wQx3seCFayTJlg1jmS/KXwiF3nbQTYjzTTR1tNBX14sdhNgpO
         QKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840872; x=1771445672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=TVDkmZ+HyKGEl+3kPKo7OS5xRaiWNDfKwe4wcW61BSU8KJoqboE9mefGds/FnnKX2v
         JhGJSaUIEMeTCsFB1s4t7wABkK8cQR3aTSLK+BWGgJB9swVeLr67xAai4S/fD/BI8G2P
         wCSd3tA6AkFJUoLdWxK8T/lqJaEMOT9elhaxTvxuSzLi7PE5udaIOfWJjda23EjOBRiH
         95lHEb6Zlr3NBAqJKE2k3K9AIcH7oXmUErt8tYMGNdWeCk0xhIhPSYHMObd8YKNdeA+J
         sNRVX7dLnvddLLrU73MZjb43hkgyx8ORLeHCwKnXn5iyJGbOeousOHcM6vEltGWVmb42
         92bg==
X-Forwarded-Encrypted: i=1; AJvYcCV7k0ewWTG0UPrIV5zV9V7ThXq5SVjBJ8OBxjGbW4HokYlE+2y04VwDbnQYciam3DbidFEKVT8GXvo1B9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6wmChm4JYUnjvogV8u5kwHMm0QYLpgIMj+GYEeWcre96RiY3
	oHwe5rvjAona9+oRgjmAJapymmaTJyPs6vkgIo+BfvEGvRCeQ9TsQePC0EMtvHCsSxx4R9VhA+E
	vKEILft5wsjLHee5N92/6AFRUll/89fM=
X-Gm-Gg: AZuq6aK8ncEg8sX6k1Ts+9DAq4km8OrfGHUp9IGF11ilk55EXytP5ZXnautM8AD+jQs
	jwzDpmMWsxD4Jc+PzHA+vFhIY7s3yrw6eqECbbcn4AAPCekE6fP5yaChY1479VxESpL63ehG7b1
	h3LEoMBZAfYjONdki+CyHnVnKfn86MnOPEvsIBKvSVfeTzm2zbUchdMVHj1hH2QI3wj7p6qxkM8
	OTUozjozsbo8IP3zYK4vR7XRdplU1EFUCQnNWg1vLJ9ZUtKyKMCoNPR3HFjgmgVgFgZO6s5s/Sz
	VipybYxGmBta0BCladchxTIEE/1mJYYITTjdkS/aWg==
X-Received: by 2002:a17:907:a08a:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8f8f72d91emr17643566b.50.1770840871149; Wed, 11 Feb 2026
 12:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211103141.3215197-1-rppt@kernel.org> <20260211103141.3215197-4-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-4-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Feb 2026 21:14:19 +0100
X-Gm-Features: AZwV_QgdPAvH3hw0825YIt93LQPupYFvh_AV-2zMkwGhubC87cSa2iVxpdoZwag
Message-ID: <CA+=Fv5T07oBJweU3tURD4Nuh7VRWovsf0zjHtA1nDAVNmO=D2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4567-lists,linux-parisc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linmag7@gmail.com,linux-parisc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-parisc];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,gmx.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: E361B127587
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:32=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
> ZERO_PAGE() to 4.
>
> Every architecture defines empty_zero_page that way or another, but for t=
he
> most of them it is always a page aligned page in BSS and most definitions
> of ZERO_PAGE do virt_to_page(empty_zero_page).
>
> Move Linus vetted x86 definition of empty_zero_page and ZERO_PAGE() to th=
e
> core MM and drop these definitions in architectures that do not implement
> colored zero page (MIPS and s390).
>
> ZERO_PAGE() remains a macro because turning it to a wrapper for a static
> inline causes severe pain in header dependencies.
>
> For the most part the change is mechanical, with these being noteworthy:
>
> * alpha: aliased empty_zero_page with ZERO_PGE that was also used for boo=
t
>   parameters. Switching to a generic empty_zero_page removes the aliasing
>   and keeps ZERO_PGE for boot parameters only
> * arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
>   ZERO_PAGE() is kept intact.
> * m68k/parisc/um: allocated empty_zero_page from memblock,
>   although they do not support zero page coloring and having it in BSS
>   will work fine.
> * sparc64 can have empty_zero_page in BSS rather allocate it, but it
>   can't use virt_to_page() for BSS. Keep it's definition of ZERO_PAGE()
>   but instead of allocating it, make mem_map_zero point to
>   empty_zero_page.
> * sh: used empty_zero_page for boot parameters at the very early boot.
>   Rename the parameters page to boot_params_page and let sh use the gener=
ic
>   empty_zero_page.
> * hexagon: had an amusing comment about empty_zero_page
>
>         /* A handy thing to have if one has the RAM. Declared in head.S *=
/
>
>   that unfortunately had to go :)
>
> Acked-by: Helge Deller <deller@gmx.de>   # parisc
> Tested-by: Helge Deller <deller@gmx.de>  # parisc
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/alpha/include/asm/pgtable.h          |  6 ------

> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 90e7a9539102..12a3c5f8ece8 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -125,12 +125,6 @@ struct vm_area_struct;
>   */
>  #define pgprot_noncached(prot) (prot)
>
> -/*
> - * ZERO_PAGE is a global shared page that is always zero:  used
> - * for zero-mapped memory areas etc..
> - */
> -#define ZERO_PAGE(vaddr)       (virt_to_page(ZERO_PGE))
> -
>  /*
>   * On certain platforms whose physical address space can overlap KSEG,
>   * namely EV6 and above, we must re-twiddle the physaddr to restore the

This looks good from an Alpha perspective

Acked-by: Magnus Lindholm <linmag7@gmail.com>


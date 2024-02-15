Return-Path: <linux-parisc+bounces-556-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED83C856DF2
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 20:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD4A8B284C2
	for <lists+linux-parisc@lfdr.de>; Thu, 15 Feb 2024 19:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193A14369A;
	Thu, 15 Feb 2024 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RrKQ2DqV"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306213A248
	for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 19:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708026142; cv=none; b=By8QrSxzjKEKYIj+eXsmHzghsC/8uuI2hj+HkX/VXOvKUUENfbnAGSAzeZuNPrgSN/f7BGZvRLdnnCem2Flc3Bam/oUVKuDwq0Je4uacCq3Oirtm56fi4vPmwaY5MT6+YiQFmHAsEGOxZBJfoRBJoiGusEDfMBiq0Qcyn9ddibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708026142; c=relaxed/simple;
	bh=fGUMoJyAdQsvj20F5vK/5fVgwta6JgS0LZaBo/OZMPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQYmYNJtr1L8pKXlD+b3nvB56cbsfsvOT0zbSfcpVR8EKtBaYx0uo8dA3TMtXW1GkexoKVwduCv60FsswswN9n1H3iH92OtjchhFNE392U5QpmbNgz9QtbD7QAjNn1YbA8F4OycHiBHMj9EE8Ac4aC0htzo/PzILvgnil6EuCtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=RrKQ2DqV; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-604a1581cffso12431967b3.3
        for <linux-parisc@vger.kernel.org>; Thu, 15 Feb 2024 11:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708026139; x=1708630939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ToGrzgeoFjZDLYGrUJ0LMQE8yQMCpV/3LIqrOTApa8M=;
        b=RrKQ2DqVDr5npxqb7fYteCoNxBIdHyBl68/Cn+AdCLXB/n8G8LJAvnwO131l95ckFV
         mBbwKVe//8McjG1sG4+iohZSfOnjJzCEFK2ApBc9eFUubQTsnmeb14E8VWGqMgywXoMu
         tcL6spGKo2mVE6fR/oXQpd/DHTXFWtYy1vO67LKY45og5BwJpL7rpa0COCLCt91Hakvi
         t/Vm9N6i/ANsKDrSpNX+qF73CRB7CiMZULYD0paY+Dh+e7YoSsZkONPWdBA9ST8Clncw
         Tav7WoAiWEL6MqOgq3r0Z01M/oIuuPE3PeB3Dv+3o2k4Qkak2tyG+14vkNF6FaNlGRtK
         Ioxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708026139; x=1708630939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ToGrzgeoFjZDLYGrUJ0LMQE8yQMCpV/3LIqrOTApa8M=;
        b=vQxn3nU+UHUVfSYQtL1DU9f9Alz5Fu48COLRNcAAZ3BflmYTS6nqLGtoP35yN8bfun
         eQJNr1Rk48YyoyJgZLGmQgu2XaMYfot80rKFj9I7T9KopNNN3jJjJv6Y5uuLpAeXztda
         cvOAgg1nzu4J3RKM+6QHAp7VQLxduZLTujlIWHV+99RlLvDOtdtd0+LTmfI2dVOQmNph
         TdrWlgROu0dipsgWAltttQ4sNmMRU2qKyQKwFlcylOm37xJP1BZ16jfTZOZHq+GDNlf0
         d0xHCdtzDNyGbfgdtWCfFKR5buXQfKHhxGmmnZH4EOwUPRm0QxX03vBN7jCoAoG4Rn8I
         +slQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDelNKWUTfYTsR+/pcPyl5DjuWon6zJH4C2KjzlqYrZw57GoQb1r3dwaOSBvHSRDB1zziUz11mqsz07SFOQSBmMfkz7INW3+e/1AR1
X-Gm-Message-State: AOJu0YyHdggSsJ+Vva9gbvWpH2LrKKhObUj7WI7GA+e9XwSfqskoYa8M
	IW/Dio+wP2nxSEZVY6wGOwmUupeB8dTvK+1mQER5aeX2NN2mtzAgwKQ7GN+sT+k=
X-Google-Smtp-Source: AGHT+IHlNECPsJe78elt3hxtDs/YZra2mJnsKLeoT3XVaZhIkVrfSM5RSE2F+p/VEzWyPuULnmLIzw==
X-Received: by 2002:a05:690c:24e:b0:604:1a5a:a54a with SMTP id ba14-20020a05690c024e00b006041a5aa54amr2922735ywb.37.1708026138874;
        Thu, 15 Feb 2024 11:42:18 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id h126-20020a815384000000b005ff846d1f1dsm11171ywb.134.2024.02.15.11.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 11:42:18 -0800 (PST)
Date: Thu, 15 Feb 2024 14:42:16 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: John David Anglin <dave.anglin@bell.net>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/2] lib: checksum: Use aligned accesses for
 ip_fast_csum and csum_ipv6_magic tests
Message-ID: <Zc5pGIDgLrM0uepc@ghost>
References: <20240214-fix_sparse_errors_checksum_tests-v8-0-36b60e673593@rivosinc.com>
 <20240214-fix_sparse_errors_checksum_tests-v8-2-36b60e673593@rivosinc.com>
 <2ec91b11-23c7-4beb-8cef-c68367c8f029@roeck-us.net>
 <a7e9691432374000b9566a0201d004e6@AcuMS.aculab.com>
 <c22f28a2-b042-4abe-b9e4-a925b97073bb@roeck-us.net>
 <4723822c-2acf-4c41-899c-1e3d5659d1d8@bell.net>
 <1e302d8f-4e94-4278-b556-b8fc54956efb@roeck-us.net>
 <e73bdc36-5fb1-4ea8-9f96-608eb1a9b6af@bell.net>
 <a7b70196-2387-4532-94ac-81220fd07088@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7b70196-2387-4532-94ac-81220fd07088@roeck-us.net>

On Thu, Feb 15, 2024 at 10:42:29AM -0800, Guenter Roeck wrote:
> On 2/15/24 09:25, John David Anglin wrote:
> > On 2024-02-15 12:06 p.m., Guenter Roeck wrote:
> > > On 2/15/24 08:51, John David Anglin wrote:
> > > > On 2024-02-15 10:44 a.m., Guenter Roeck wrote:
> > > > > On 2/15/24 02:27, David Laight wrote:
> > > > > > ...
> > > > > > > It would be worthwhile tracking this down since there are
> > > > > > > lots of unaligned data accesses (8-byte accesses on 4-byte aligned addresses)
> > > > > > > when running the kernel in 64-bit mode.
> > > > > > 
> > > > > > Hmmm....
> > > > > > For performance reasons you really don't want any of them.
> > > > > > The misaligned 64bit fields need an __attribute((aligned(4)) marker.
> > > > > > 
> > > > > > If the checksum code can do them it really needs to detect
> > > > > > and handle the misalignment.
> > > > > > 
> > > > > > The misaligned trap handler probably ought to contain a
> > > > > > warn_on_once() to dump stack on the first such error.
> > > > > > They can then be fixed one at a time.
> > > > > > 
> > > > > 
> > > > > Unaligned LDD at unwind_once+0x4a8/0x5e0
> > > > > 
> > > > > Decoded:
> > > > > 
> > > > > Unaligned LDD at unwind_once (arch/parisc/kernel/unwind.c:212 arch/parisc/kernel/unwind.c:243 arch/parisc/kernel/unwind.c:371 arch/parisc/kernel/unwind.c:445)
> > > > > 
> > > > > Source:
> > > > > 
> > > > > static bool pc_is_kernel_fn(unsigned long pc, void *fn)
> > > > > {
> > > > > ������� return (unsigned long)dereference_kernel_function_descriptor(fn) == pc;
> > > > This looks wrong to me.� Function descriptors should always be 8-byte aligned.� I think this
> > > > routine should return false if fn isn't 8-byte aligned.
> > > 
> > > Below you state "Code entry points only need 4-byte alignment."
> > > 
> > > I think that contradicts each other. Also, the calling code is,
> > > for example,
> > > ����pc_is_kernel_fn(pc, syscall_exit)
> > > 
> > > I fail to see how this can be consolidated if it is ok
> > > that syscall_exit is 4-byte aligned but, at the same time,
> > > must be 8-byte aligned to be considered to be a kernel function.
> > In the above call, syscall_exit is treated as a function pointer. It points to an 8-byte aligned
> > function descriptor.� The descriptor holds the actual address of the function.� It only needs
> > 4-byte alignment.
> > 
> > Descriptors need 8-byte alignment for efficiency on 64-bit parisc. The pc and gp are accessed
> > using ldd instructions.
> > 
> 
> How about the patch below ?
> 
> Guenter
> 
> ---
> diff --git a/arch/parisc/kernel/unwind.c b/arch/parisc/kernel/unwind.c
> index 27ae40a443b8..c2b9e23cbc0a 100644
> --- a/arch/parisc/kernel/unwind.c
> +++ b/arch/parisc/kernel/unwind.c
> @@ -214,24 +214,14 @@ static bool pc_is_kernel_fn(unsigned long pc, void *fn)
> 
>  static int unwind_special(struct unwind_frame_info *info, unsigned long pc, int frame_size)
>  {
> -       /*
> -        * We have to use void * instead of a function pointer, because
> -        * function pointers aren't a pointer to the function on 64-bit.
> -        * Make them const so the compiler knows they live in .text
> -        * Note: We could use dereference_kernel_function_descriptor()
> -        * instead but we want to keep it simple here.
> -        */
> -       extern void * const ret_from_kernel_thread;
> -       extern void * const syscall_exit;
> -       extern void * const intr_return;
> -       extern void * const _switch_to_ret;
> +       void (*ret_from_kernel_thread)(void);
> +       void (*syscall_exit)(void);
> +       void (*intr_return)(void);
> +       void (*_switch_to_ret)(void);
>  #ifdef CONFIG_IRQSTACKS
> -       extern void * const _call_on_stack;
> +       void (*_call_on_stack)(void);
>  #endif /* CONFIG_IRQSTACKS */
> -       void *ptr;
> -
> -       ptr = dereference_kernel_function_descriptor(&handle_interruption);
> -       if (pc_is_kernel_fn(pc, ptr)) {
> +       if (pc_is_kernel_fn(pc, handle_interruption)) {
>                 struct pt_regs *regs = (struct pt_regs *)(info->sp - frame_size - PT_SZ_ALGN);
>                 dbg("Unwinding through handle_interruption()\n");
>                 info->prev_sp = regs->gr[30];
> 

Seems like a promising direction.

It feels like we have hit a point when we should "close" this thread and
start potentially a couple new ones to correct the behavior of
saving/restoring the PSW and this behavior with unwind.

I don't know what the proper etiquitte is for reverting back to a
previous patch, should I send a v9 that is just the same as the v7?

Thank you Guenter and John for looking into the parisc behavior!

- Charlie



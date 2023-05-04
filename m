Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC6C6F6AA5
	for <lists+linux-parisc@lfdr.de>; Thu,  4 May 2023 13:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjEDL74 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 4 May 2023 07:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjEDL7z (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 May 2023 07:59:55 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7777D5580;
        Thu,  4 May 2023 04:59:50 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:35054.201589733
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id 3E8721002A1;
        Thu,  4 May 2023 19:59:46 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-85667d6c59-lhcrq with ESMTP id 404ab4de07154627b71725baa980791c for tzimmermann@suse.de;
        Thu, 04 May 2023 19:59:49 CST
X-Transaction-ID: 404ab4de07154627b71725baa980791c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <d4930b1a-d79e-6deb-6683-f13bbe1170ff@189.cn>
Date:   Thu, 4 May 2023 19:59:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [v4,5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
        vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
        davem@davemloft.net, James.Bottomley@HansenPartnership.com,
        arnd@arndb.de, sam@ravnborg.org
Cc:     linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
        sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20230504074539.8181-6-tzimmermann@suse.de>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230504074539.8181-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

I tested the whole patch set on a LS3A5000(LoongArch)machine with efifb 
driver,

with both fbtest and fbdev of IGT,  The test result say passed and I can 
not see anything wired happen.


Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/5/4 15:45, Thomas Zimmermann wrote:
> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
> in the architecture's <asm/fb.h> header file or the generic one.
>
> The common case has been the use of regular I/O functions, such as
> __raw_readb() or memset_io(). A few architectures used plain system-
> memory reads and writes. Sparc used helpers for its SBus.
>
> The architectures that used special cases provide the same code in
> their __raw_*() I/O helpers. So the patch replaces this code with the
> __raw_*() functions and moves it to <asm-generic/fb.h> for all
> architectures.
>
> v4:
> 	* ia64, loongarch, sparc64: add fb_mem*() to arch headers
> 	  to keep current semantics (Arnd)
> v3:
> 	* implement all architectures with generic helpers
> 	* support reordering and native byte order (Geert, Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   arch/ia64/include/asm/fb.h      |  20 +++++++
>   arch/loongarch/include/asm/fb.h |  21 +++++++
>   arch/sparc/include/asm/fb.h     |  20 +++++++
>   include/asm-generic/fb.h        | 101 ++++++++++++++++++++++++++++++++
>   include/linux/fb.h              |  53 -----------------
>   5 files changed, 162 insertions(+), 53 deletions(-)
>
> diff --git a/arch/ia64/include/asm/fb.h b/arch/ia64/include/asm/fb.h
> index 0208f64a0da0..bcf982043a5c 100644
> --- a/arch/ia64/include/asm/fb.h
> +++ b/arch/ia64/include/asm/fb.h
> @@ -2,7 +2,9 @@
>   #ifndef _ASM_FB_H_
>   #define _ASM_FB_H_
>   
> +#include <linux/compiler.h>
>   #include <linux/efi.h>
> +#include <linux/string.h>
>   
>   #include <asm/page.h>
>   
> @@ -18,6 +20,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>   }
>   #define fb_pgprotect fb_pgprotect
>   
> +static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> +{
> +	memcpy(to, (void __force *)from, n);
> +}
> +#define fb_memcpy_fromfb fb_memcpy_fromfb
> +
> +static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> +{
> +	memcpy((void __force *)to, from, n);
> +}
> +#define fb_memcpy_tofb fb_memcpy_tofb
> +
> +static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> +{
> +	memset((void __force *)addr, c, n);
> +}
> +#define fb_memset fb_memset
> +
>   #include <asm-generic/fb.h>
>   
>   #endif /* _ASM_FB_H_ */
> diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/fb.h
> index ff82f20685c8..c6fc7ef374a4 100644
> --- a/arch/loongarch/include/asm/fb.h
> +++ b/arch/loongarch/include/asm/fb.h
> @@ -5,6 +5,27 @@
>   #ifndef _ASM_FB_H_
>   #define _ASM_FB_H_
>   
> +#include <linux/compiler.h>
> +#include <linux/string.h>
> +
> +static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> +{
> +	memcpy(to, (void __force *)from, n);
> +}
> +#define fb_memcpy_fromfb fb_memcpy_fromfb
> +
> +static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> +{
> +	memcpy((void __force *)to, from, n);
> +}
> +#define fb_memcpy_tofb fb_memcpy_tofb
> +
> +static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> +{
> +	memset((void __force *)addr, c, n);
> +}
> +#define fb_memset fb_memset
> +
>   #include <asm-generic/fb.h>
>   

Here works as the past, but  why bother cast it to (void __force *) ?

why not use __memcpy_fromio, __memcpy_toio and __memset_io directly?

I modify it this patch as following, it still works.



  static inline void fb_memcpy_fromio(void *to, const volatile void 
__iomem *from, size_t n)
  {
-       memcpy(to, (void __force *)from, n);
+       __memcpy_fromio(to, from, n);
  }
  #define fb_memcpy_fromio fb_memcpy_fromio

  static inline void fb_memcpy_toio(volatile void __iomem *to, const 
void *from, size_t n)
  {
-       memcpy((void __force *)to, from, n);
+       __memcpy_toio(to, from, n);
  }
  #define fb_memcpy_toio fb_memcpy_toio

  static inline void fb_memset_io(volatile void __iomem *addr, int c, 
size_t n)
  {
-       memset((void __force *)addr, c, n);
+       __memset_io(addr, c, n);
  }
  #define fb_memset fb_memset_io

>   #endif /* _ASM_FB_H_ */
> diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
> index 689ee5c60054..077da91aeba1 100644
> --- a/arch/sparc/include/asm/fb.h
> +++ b/arch/sparc/include/asm/fb.h
> @@ -2,6 +2,8 @@
>   #ifndef _SPARC_FB_H_
>   #define _SPARC_FB_H_
>   
> +#include <linux/io.h>
> +
>   struct fb_info;
>   struct file;
>   struct vm_area_struct;
> @@ -16,6 +18,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>   int fb_is_primary_device(struct fb_info *info);
>   #define fb_is_primary_device fb_is_primary_device
>   
> +static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> +{
> +	sbus_memcpy_fromio(to, from, n);
> +}
> +#define fb_memcpy_fromfb fb_memcpy_fromfb
> +
> +static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> +{
> +	sbus_memcpy_toio(to, from, n);
> +}
> +#define fb_memcpy_tofb fb_memcpy_tofb
> +
> +static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> +{
> +	sbus_memset_io(addr, c, n);
> +}
> +#define fb_memset fb_memset
> +
>   #include <asm-generic/fb.h>
>   
>   #endif /* _SPARC_FB_H_ */
> diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
> index c8af99f5a535..6ef624b3ce12 100644
> --- a/include/asm-generic/fb.h
> +++ b/include/asm-generic/fb.h
> @@ -30,4 +30,105 @@ static inline int fb_is_primary_device(struct fb_info *info)
>   }
>   #endif
>   
> +/*
> + * I/O helpers for the framebuffer. Prefer these functions over their
> + * regular counterparts. The regular I/O functions provide in-order
> + * access and swap bytes to/from little-endian ordering. Neither is
> + * required for framebuffers. Instead, the helpers read and write
> + * raw framebuffer data. Independent operations can be reordered for
> + * improved performance.
> + */
> +
> +#ifndef fb_readb
> +static inline u8 fb_readb(const volatile void __iomem *addr)
> +{
> +	return __raw_readb(addr);
> +}
> +#define fb_readb fb_readb
> +#endif
> +
> +#ifndef fb_readw
> +static inline u16 fb_readw(const volatile void __iomem *addr)
> +{
> +	return __raw_readw(addr);
> +}
> +#define fb_readw fb_readw
> +#endif
> +
> +#ifndef fb_readl
> +static inline u32 fb_readl(const volatile void __iomem *addr)
> +{
> +	return __raw_readl(addr);
> +}
> +#define fb_readl fb_readl
> +#endif
> +
> +#ifndef fb_readq
> +#if defined(__raw_readq)
> +static inline u64 fb_readq(const volatile void __iomem *addr)
> +{
> +	return __raw_readq(addr);
> +}
> +#define fb_readq fb_readq
> +#endif
> +#endif
> +
> +#ifndef fb_writeb
> +static inline void fb_writeb(u8 b, volatile void __iomem *addr)
> +{
> +	__raw_writeb(b, addr);
> +}
> +#define fb_writeb fb_writeb
> +#endif
> +
> +#ifndef fb_writew
> +static inline void fb_writew(u16 b, volatile void __iomem *addr)
> +{
> +	__raw_writew(b, addr);
> +}
> +#define fb_writew fb_writew
> +#endif
> +
> +#ifndef fb_writel
> +static inline void fb_writel(u32 b, volatile void __iomem *addr)
> +{
> +	__raw_writel(b, addr);
> +}
> +#define fb_writel fb_writel
> +#endif
> +
> +#ifndef fb_writeq
> +#if defined(__raw_writeq)
> +static inline void fb_writeq(u64 b, volatile void __iomem *addr)
> +{
> +	__raw_writeq(b, addr);
> +}
> +#define fb_writeq fb_writeq
> +#endif
> +#endif
> +
> +#ifndef fb_memcpy_fromfb
> +static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
> +{
> +	memcpy_fromio(to, from, n);
> +}
> +#define fb_memcpy_fromfb fb_memcpy_fromfb
> +#endif
> +
> +#ifndef fb_memcpy_tofb
> +static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
> +{
> +	memcpy_toio(to, from, n);
> +}
> +#define fb_memcpy_tofb fb_memcpy_tofb
> +#endif
> +
> +#ifndef fb_memset
> +static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
> +{
> +	memset_io(addr, c, n);
> +}
> +#define fb_memset fb_memset
> +#endif
> +
>   #endif /* __ASM_GENERIC_FB_H_ */
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index c0f97160ebbf..eb7e52940c60 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -17,7 +17,6 @@
>   #include <linux/slab.h>
>   
>   #include <asm/fb.h>
> -#include <asm/io.h>
>   
>   struct vm_area_struct;
>   struct fb_info;
> @@ -513,58 +512,6 @@ struct fb_info {
>    */
>   #define STUPID_ACCELF_TEXT_SHIT
>   
> -// This will go away
> -#if defined(__sparc__)
> -
> -/* We map all of our framebuffers such that big-endian accesses
> - * are what we want, so the following is sufficient.
> - */
> -
> -// This will go away
> -#define fb_readb sbus_readb
> -#define fb_readw sbus_readw
> -#define fb_readl sbus_readl
> -#define fb_readq sbus_readq
> -#define fb_writeb sbus_writeb
> -#define fb_writew sbus_writew
> -#define fb_writel sbus_writel
> -#define fb_writeq sbus_writeq
> -#define fb_memset sbus_memset_io
> -#define fb_memcpy_fromfb sbus_memcpy_fromio
> -#define fb_memcpy_tofb sbus_memcpy_toio
> -
> -#elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) ||	\
> -	defined(__hppa__) || defined(__sh__) || defined(__powerpc__) ||	\
> -	defined(__arm__) || defined(__aarch64__) || defined(__mips__)
> -
> -#define fb_readb __raw_readb
> -#define fb_readw __raw_readw
> -#define fb_readl __raw_readl
> -#define fb_readq __raw_readq
> -#define fb_writeb __raw_writeb
> -#define fb_writew __raw_writew
> -#define fb_writel __raw_writel
> -#define fb_writeq __raw_writeq
> -#define fb_memset memset_io
> -#define fb_memcpy_fromfb memcpy_fromio
> -#define fb_memcpy_tofb memcpy_toio
> -
> -#else
> -
> -#define fb_readb(addr) (*(volatile u8 *) (addr))
> -#define fb_readw(addr) (*(volatile u16 *) (addr))
> -#define fb_readl(addr) (*(volatile u32 *) (addr))
> -#define fb_readq(addr) (*(volatile u64 *) (addr))
> -#define fb_writeb(b,addr) (*(volatile u8 *) (addr) = (b))
> -#define fb_writew(b,addr) (*(volatile u16 *) (addr) = (b))
> -#define fb_writel(b,addr) (*(volatile u32 *) (addr) = (b))
> -#define fb_writeq(b,addr) (*(volatile u64 *) (addr) = (b))
> -#define fb_memset memset
> -#define fb_memcpy_fromfb memcpy
> -#define fb_memcpy_tofb memcpy
> -
> -#endif
> -
>   #define FB_LEFT_POS(p, bpp)          (fb_be_math(p) ? (32 - (bpp)) : 0)
>   #define FB_SHIFT_HIGH(p, val, bits)  (fb_be_math(p) ? (val) >> (bits) : \
>   						      (val) << (bits))

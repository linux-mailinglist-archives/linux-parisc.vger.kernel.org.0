Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00DB3079AF
	for <lists+linux-parisc@lfdr.de>; Thu, 28 Jan 2021 16:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhA1P1i (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 28 Jan 2021 10:27:38 -0500
Received: from mout.gmx.net ([212.227.17.20]:36373 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232462AbhA1P1R (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 28 Jan 2021 10:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611847500;
        bh=9LJSnLf5craaFJjCp+uCNeI7n1HcCE63e7rYTB8GwTo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=VWVN97SXcasw5JJJK5G/4b8Mi2GS4qQzZmQpyS/eGJWolDuS6vq7CXpwrELesIYgd
         2rld+mkbVm+dIuR0kmfCL+eHsyy1kjAkcJp42iW85DZJMTfJXeBNJ5/RXt27sSxEYe
         qe6y94zaULEGS+xCWWHocndPmQrEXo8jUZKFOj5Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.172.59]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMofc-1lNlwe0KjE-00IpDl; Thu, 28
 Jan 2021 16:25:00 +0100
Subject: Re: [PATCH] parisc: Optimize per-pagetable spinlocks (v12)
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
Cc:     Matthew Wilcox <willy@infradead.org>
References: <c696f95d-a5ba-1f73-fbe9-a5d3f25e79c0@bell.net>
 <4f76001d-f050-286f-4b6f-790554583eea@bell.net>
 <20210127211851.GA32689@ls3530.fritz.box> <2053670.irdbgypaU6@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <d4da4122-ccea-08ed-9de4-3f5b1f5514a1@gmx.de>
Date:   Thu, 28 Jan 2021 16:24:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <2053670.irdbgypaU6@eto.sf-tec.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="thSEbQheuSBCbqVjCsgyXxVSiLx1VAoR1"
X-Provags-ID: V03:K1:J7N7MYZHETHny0sAi6DLdv1JPHd1uRB4B+F+JfgT2DTKeiotUiP
 ZmV+q8mXdwK0Q+WlYlYNobqEOVNKfm2mPlgNTTLAVSfq8rVFxvHjdDzkpvAJS6L2H2/+Fn8
 BwWR3rMg4T2AL99wlZebfa+bG4x92I0BP6kDlIF21CYVg3CWVqT/WraWcAQi8a1H5qDeEUr
 0Y+w2T39eK1214Nl1OJ4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EnV3u0wP4Cs=:IQAOmdArgx/b3XQliP8Xh4
 E4Tb029HGNyzSBm1Ik7SkrWZypIxwpk+mIndKCM8iEKEQ1GWoMmTYPpSpucu5doSezYApsOs6
 gpD8uCDUlfMSOLC64KX6ONpqy6vR06DL3mRiMtwdk2k99R++gp8Sz0Az6Eev+2Auupdn/VRMj
 R9ThKycr80kQ5qIZ8FmtHDMgkPvwXQY5RvyLRKGEXsF95/9ynRTBVyRRcV9e6E4wlzXUk1pFj
 k0H/hkVGmqwOtgvJKq71qlIHq63BaAzdahlJh41Uimk7GYFCQ7BYqrpHrhFvkIDdAZNr8qbIK
 DyglY2vTtjdnAGhsMFNhlG7HMaURCmpq4+oqMVQgyJv1pG/UsFNc+HxHKo3lfbhrlbiA47S+p
 mSq4suZDpEjyFWs+m3DVfj5hndIq5VagNpvN6ZujqB82f6wf9MxewFfBFHrXBL2yhqwx8kPNg
 C+NrUK98nTtgF0dBuEGis+UBNrYAEcZxi5swju9wgu++ztnDaBEHOiVQ9pM0FNkzA+O8T7lTW
 mcL3eivLfkP/okGwx6/G7G/JRbrvkKzVmDz0IHDYtKADbhGsDwHRMK8NpLFbUPYHQpblPquLy
 zBbQg6YNJF+yA2Oi4azR2yceOwPu9/pRGRQ4Ztl+PFfhYEkn30OFwGQUt1+q1wHwcXcslgX1p
 3nEKfTRtU10MWKyy5SZ9kbJLrC0CONPPirg7ZoPJURHF/ygLEaCsS/LRnZfo5KCsIBDoNSUUD
 8QRJB2fxjjDf3oEILNM5fLamWTc5j1tsjC1nbAJksfPVAyEEm1fGQlNmL+iRcq+EY82RJAs1i
 uQuv1/3Zq/p/OXMJJcEXsO9yAe6O6Ckxcajj70U0AuL3WRQHRi0WNyQoNzucUIviV6+VEysjJ
 r6LiqJ1MhiJrSywcONdA==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--thSEbQheuSBCbqVjCsgyXxVSiLx1VAoR1
Content-Type: multipart/mixed; boundary="gWtby0NWdSnEE5WSYxsgPhp9hJ6BnmR9u"

--gWtby0NWdSnEE5WSYxsgPhp9hJ6BnmR9u
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/28/21 9:36 AM, Rolf Eike Beer wrote:
> Am Mittwoch, 27. Januar 2021, 22:18:51 CET schrieb Helge Deller:
>> On parisc a spinlock is stored in the next page behind the pgd which
>> protects against parallel accesses to the pgd. That's why one addition=
al
>> page (PGD_ALLOC_ORDER) is allocated for the pgd.
>>
>> Matthew Wilcox suggested that we instead should use a pointer in the
>> struct page table for this spinlock and noted, that the comments for t=
he
>> PGD_ORDER and PMD_ORDER defines were wrong.
>>
>> Both suggestions are addressed in this patch. The pgd spinlock
>> (parisc_pgd_lock) is stored in the struct page table. In
>> switch_mm_irqs_off() the physical address of this lock is loaded into
>> cr28 (tr4) and the pgd into cr25, so that the fault handlers can
>> directly access the lock.
>>
>> The currently implemened Hybrid L2/L3 page table scheme (where the pmd=

>> is adjacent to the pgd) is dropped now too.
>>
>> Suggested-by: Matthew Wilcox <willy@infradead.org>
>> Fixes: b37d1c1898b2 ("parisc: Use per-pagetable spinlock")
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>>

[...lots of suggestions by Rolf...]

Rolf, thanks a lot for your review.
I've addressed most of your suggestions and published a v12 patch here:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/l=
og/?h=3Dpgtable_spinlock-v12

>> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
>> index 3ec633b11b54..4f3f180b0b20 100644
>> --- a/arch/parisc/mm/init.c
>> +++ b/arch/parisc/mm/init.c
>> +#ifdef CONFIG_SMP
>> +spinlock_t *pgd_spinlock(pgd_t *pgd)
>> +{
>> +	struct page *page;
>> +
>> +	page =3D virt_to_page((unsigned long) pgd);
>> +	return page->parisc_pgd_lock;
>> +}
>> +#endif
>=20
> This is very simple, and I suspect it being called rather often. Wouldn=
't it=20
> make sense to make it inline?

No, it's not simple, that's why I haven't inlined it.
The virt_to_page() expands to many asm instructions based on the selected=
 memory model.

Thanks!
Helge


--gWtby0NWdSnEE5WSYxsgPhp9hJ6BnmR9u--

--thSEbQheuSBCbqVjCsgyXxVSiLx1VAoR1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS86RI+GtKfB8BJu973ErUQojoPXwUCYBLXSgAKCRD3ErUQojoP
XxfTAP9dKW2IqkkA6rKbQdz9zisKqYLfQiK/Zx4G7ERRapkr9gEAhNCicCZ71piJ
BeF48T1ne8HktWSfMs2yxTiseGESXQk=
=NY/g
-----END PGP SIGNATURE-----

--thSEbQheuSBCbqVjCsgyXxVSiLx1VAoR1--

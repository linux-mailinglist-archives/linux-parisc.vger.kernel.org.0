Return-Path: <linux-parisc+bounces-3243-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00928A1B117
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2025 08:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1D913AED84
	for <lists+linux-parisc@lfdr.de>; Fri, 24 Jan 2025 07:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7E51DB121;
	Fri, 24 Jan 2025 07:46:29 +0000 (UTC)
X-Original-To: linux-parisc@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB741D95A2
	for <linux-parisc@vger.kernel.org>; Fri, 24 Jan 2025 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737704789; cv=none; b=QUdzywNg+RCqwwXcissfWyTpjNFa5MaXBen/qJMPLqXfP0AuPW92pqK1ZtkBPrfgsMUzC2nPIqgqeHjbs+eixq5TZZ4ryoCn8dHPqGJqs2Nkb3vQ3Rk5JeYxZ4KHoaczbUAXKyuqy0HwcbxVGrzunIICKKcoPyI8548QvgZ4JJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737704789; c=relaxed/simple;
	bh=vlwuYKz6ZcYiOUZFHUh4zPFqDDBu0LAblvqM/+ahXKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbwN4TbratHJJFonEp28sOZb4oAWGDx1fivRnC0WO7e74Ly9vN5dlR9BAbCXO7JvLy/VXZb789XCW/7Z2pF4hUAVhN6jQCKh27zcmCsym2PNEfKKRYQVelDQmQFzXEJ1Tjb4mBdZqPTKOwWliuLfYTQF8IdYdWhgqQErVMQzChg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu; spf=pass smtp.mailfrom=vivier.eu; arc=none smtp.client-ip=212.227.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vivier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivier.eu
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5Qhx-1tc3Cc3Tdt-00F5V8; Fri, 24 Jan 2025 08:46:07 +0100
Message-ID: <b93628eb-96a8-4a68-b515-a2bef2c51c27@vivier.eu>
Date: Fri, 24 Jan 2025 08:46:07 +0100
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] linux-user: netlink: Add missing IFA_PROTO to
 host_to_target_data_addr_rtattr()
To: Helge Deller <deller@kernel.org>, linux-parisc@vger.kernel.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, deller@gmx.de
References: <20250120213340.359195-1-deller@kernel.org>
 <20250120213340.359195-2-deller@kernel.org>
 <fa016fb1-1f24-4e03-876e-58b4a0296962@vivier.eu> <Z5FhGi9HD0GzLbjQ@p100>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; keydata=
 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
In-Reply-To: <Z5FhGi9HD0GzLbjQ@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:it+F7rnn6tW75octmnuFIxhBhwyyNUR14uadN3Qb8F8KxSTItf2
 9F+2KSsKcRaRDCQjP9DBJ6dhQDIdI/nmTpYfvjgH2uZ6yIu+T4uwopbngown2Z+yhc9lu0y
 Hv+mKFpk75KoO7SdiW4JIymwwZ4r2LHgOYKu4OvnjusIdun5XyNvWIagz885MHtcDZxMWPS
 qww5RQ0uxudQaUDApLYvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FuE3u06qoLw=;38lEFIZnEwjYdLex71eWAElzo+p
 rKWG3U2UWwZ8esdtlNwU5cKBZlLdgQ8S7y7phf/B78q2tTRUE3gHaB4JJfuauciajj6oK3IEE
 5SZzzvB4e3vkeufJ3Ra6TuO/szBJ3RqZeQxPyTrrBSIKtmkatKZJOcIgOWhi4JeMlRkOZgWD0
 7bNzBVV6jxhQzHTWA1Z/KpBT0g+Njrsuy7+OgBGjjMmgffkR6sUaASOR3gKDQxmdPHbhfki+X
 2N8VBqAn272qD2LaU5OziO45vzRJoJ2W24gV+XsmwcopgNtwccK/JTKjRzO0bOgB4iRwB4cQ6
 efhG7PmOKEhmkm35vJrYTFNiQdOuC0MwZdvzvvGCd/09qPD0Zkfk9806r9+WJTVz5Gv7YwuRJ
 GvPTtlCehqWXpJTzTujXgVLbw61AD40dzfVbjEyN/mYG3Q2lyfqggTm7KQ7xaVOysTmFUZyOS
 6FkUlZpioigZZOPFhRbhRyPoMb32eWRMQWK91i82zk24F0n3GdGbsvpf9pLAcW+G0b5+l7mPA
 yyWzqgkzVG0o2OoDuvapIRWFRRW2ZZ08e5iECZfVJxUh2A5WzA+OZIP8S639NRU/cl3b+Odug
 17EwqCWFv1lIf6COhU1+3rXTSpi+pCKxx4Rtg4LhwL/UJ2SsxyQswzmJj8ChR7RMGyiuzmGMp
 khA5PSwLOFgYm34Fei3zJBvO0JyMTlGG0L4B38j7sjwEGxi8WRxc/tj6O70m03k03z+gz8ehm
 7sTd8VJ2iPrHZ6OT5o9Ley9o/yBeVWTK2UyznqReBRBgRdNKidILQDxOh950rI5Wv6RzN1xoh
 VgUINQ/ytEpxja1IPpNSUc3SYNyuFFDclhFagCErDTQkEoJVAIKp/CsRvVj1xujXJjDI/X7kt
 uZ2SjCumdBuGoekZAnkE32nmkihjyEmgeHBUqnNkaq1owuhUpNADHU60Dw1Dqd8ZhEm+8E/hA
 h0qtXhlAUCG88sgaL1Jao7M8GIFhkBpblUfuUnMgu85OBYSB43gsegV4qOY2Rv0uTjYx/bE6b
 28KcjHYBkYPosxmlpAgQmO/1OIKySQiTOJaO8J/LMs/V81yo969HpZECUvxpQY3donUTOTshj
 bCu5J8q6LbIqMr8MHqr3KBLYVzZ7kYvF56mahFNDsvoIDtTzivldPiyGJ2HICE2CpZpDhtXNs
 =

Le 22/01/2025 à 22:20, Helge Deller a écrit :
> * Laurent Vivier <laurent@vivier.eu>:
>> [...]
>> It would be cleaner to replace all the IFA_XXX by their QEMU_IFA_XXX.
> 
> Thanks for review, Laurent!
> 
> Below I've merged patch #1 and #7, as suggested by you.
> Is this OK?

Yes, thanks
> Can you review?

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> 
> Thanks!
> Helge
> ________________________________________
> 
> From: Helge Deller <deller@gmx.de>
> Date: Mon, 20 Jan 2025 22:20:41 +0100
> Subject: [PATCH] linux-user: netlink: Add missing IFA_PROTO to
>   host_to_target_data_addr_rtattr()
> 
> Fix this warning:
>   Unknown host IFA type: 11
> 
> While adding IFA_PROTO, convert all IFA_XXX values over to QEMU_IFA_XXX values
> to avoid a build failure on Ubuntu 22.04 (kernel v5.18 which does not know
> IFA_PROTO yet).
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index c04a97c73a..2e714c8e56 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -31,6 +31,22 @@
>   #include "fd-trans.h"
>   #include "signal-common.h"
>   
> +enum {
> +    QEMU_IFA_UNSPEC,
> +    QEMU_IFA_ADDRESS,
> +    QEMU_IFA_LOCAL,
> +    QEMU_IFA_LABEL,
> +    QEMU_IFA_BROADCAST,
> +    QEMU_IFA_ANYCAST,
> +    QEMU_IFA_CACHEINFO,
> +    QEMU_IFA_MULTICAST,
> +    QEMU_IFA_FLAGS,
> +    QEMU_IFA_RT_PRIORITY,
> +    QEMU_IFA_TARGET_NETNSID,
> +    QEMU_IFA_PROTO,
> +    QEMU__IFA__MAX,
> +};
> +
>   enum {
>       QEMU_IFLA_BR_UNSPEC,
>       QEMU_IFLA_BR_FORWARD_DELAY,
> @@ -1138,20 +1154,21 @@ static abi_long host_to_target_data_addr_rtattr(struct rtattr *rtattr)
>   
>       switch (rtattr->rta_type) {
>       /* binary: depends on family type */
> -    case IFA_ADDRESS:
> -    case IFA_LOCAL:
> +    case QEMU_IFA_ADDRESS:
> +    case QEMU_IFA_LOCAL:
> +    case QEMU_IFA_PROTO:
>           break;
>       /* string */
> -    case IFA_LABEL:
> +    case QEMU_IFA_LABEL:
>           break;
>       /* u32 */
> -    case IFA_FLAGS:
> -    case IFA_BROADCAST:
> +    case QEMU_IFA_FLAGS:
> +    case QEMU_IFA_BROADCAST:
>           u32 = RTA_DATA(rtattr);
>           *u32 = tswap32(*u32);
>           break;
>       /* struct ifa_cacheinfo */
> -    case IFA_CACHEINFO:
> +    case QEMU_IFA_CACHEINFO:
>           ci = RTA_DATA(rtattr);
>           ci->ifa_prefered = tswap32(ci->ifa_prefered);
>           ci->ifa_valid = tswap32(ci->ifa_valid);
> @@ -1398,8 +1415,8 @@ static abi_long target_to_host_data_addr_rtattr(struct rtattr *rtattr)
>   {
>       switch (rtattr->rta_type) {
>       /* binary: depends on family type */
> -    case IFA_LOCAL:
> -    case IFA_ADDRESS:
> +    case QEMU_IFA_LOCAL:
> +    case QEMU_IFA_ADDRESS:
>           break;
>       default:
>           qemu_log_mask(LOG_UNIMP, "Unknown target IFA type: %d\n",



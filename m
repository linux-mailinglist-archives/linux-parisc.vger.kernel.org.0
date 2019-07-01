Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E966254A4
	for <lists+linux-parisc@lfdr.de>; Tue, 21 May 2019 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbfEUPyt (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 21 May 2019 11:54:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37844 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728099AbfEUPys (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 21 May 2019 11:54:48 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4LFqS5E057766
        for <linux-parisc@vger.kernel.org>; Tue, 21 May 2019 11:54:47 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2smk73ktb7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-parisc@vger.kernel.org>; Tue, 21 May 2019 11:54:47 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-parisc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Tue, 21 May 2019 16:54:45 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 21 May 2019 16:54:43 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x4LFsgGU47644812
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 May 2019 15:54:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D85A2A405B;
        Tue, 21 May 2019 15:54:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 47969A4060;
        Tue, 21 May 2019 15:54:42 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.204.239])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 21 May 2019 15:54:42 +0000 (GMT)
Date:   Tue, 21 May 2019 18:54:40 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Helge Deller <deller@gmx.de>
Cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc: Kconfig: remove ARCH_DISCARD_MEMBLOCK
References: <1557898882-28507-1-git-send-email-rppt@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557898882-28507-1-git-send-email-rppt@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19052115-0028-0000-0000-0000037007EC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052115-0029-0000-0000-0000242FB2CF
Message-Id: <20190521155440.GD24470@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-21_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210099
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Gentle ping ...

On Wed, May 15, 2019 at 08:41:22AM +0300, Mike Rapoport wrote:
> Since commit 350e88bad496 ("mm: memblock: make keeping memblock memory
> opt-in rather than opt-out") the default behaviour is to discard memblock
> data after init and the ARCH_DISCARD_MEMBLOCK is obsolete.
> 
> Remove it.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/parisc/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 09407ed..13b95125 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -36,7 +36,6 @@ config PARISC
>  	select GENERIC_STRNCPY_FROM_USER
>  	select SYSCTL_ARCH_UNALIGN_ALLOW
>  	select SYSCTL_EXCEPTION_TRACE
> -	select ARCH_DISCARD_MEMBLOCK
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select VIRT_TO_BUS
>  	select MODULES_USE_ELF_RELA
> -- 
> 2.7.4
> 

-- 
Sincerely yours,
Mike.


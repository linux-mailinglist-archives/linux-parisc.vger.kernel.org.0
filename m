Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73891297B71
	for <lists+linux-parisc@lfdr.de>; Sat, 24 Oct 2020 10:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463363AbgJXIWY (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 24 Oct 2020 04:22:24 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:45221 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S463274AbgJXIWX (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Oct 2020 04:22:23 -0400
Received: from cust-3a8def63 ([IPv6:fc0c:c1c9:903d:e9b4:326e:d2bd:718e:17cc])
        by smtp-cloud7.xs4all.net with ESMTPSA
        id WEodk4cy54n8PWEofk6HNE; Sat, 24 Oct 2020 10:22:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1603527741; bh=I5989r2mAXf2pTG2p7ExqRyIjifeHlmRCQh48GhDoUw=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=pijzhcriEZFWbrxKeXswzCcr+7vGP7OlnLth0wGLVpPUoYuuYJXqhR9r4JxEws7Mf
         E/ax9BgCsRpF1tdaXB6bBPR1KXd8+dK9fAK7ju5btK3uTQuFg1MMitOq9nybfXyXzo
         DFg1ZEwJ6ulydA0PL0qu+j17k+WY6zaWP5ldkrwK+trGFUL8frQq1y6++vNqgezemJ
         j0Eskp2DkE6ty7bgJ1iPG/eBj5QGFx8s6SnXpvPw96t9YfcYXYk+QwF8fHalyCsM2/
         ZReJSeX1um6D7LlcmbcIDUCwfqfTCSzdMCWTA2YWtJX+xZncv4SjSUnbZgyTKyYIGZ
         1XnBA29CmNyoA==
Date:   Sat, 24 Oct 2020 10:22:18 +0200
From:   Jeroen Roovers <jer@xs4all.nl>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, Meelis Roos <mroos@linux.ee>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH v3] parisc: Add wrapper syscalls to fix O_NONBLOCK
 flag usage
Message-ID: <20201024102218.72586ac5@wim.jer>
In-Reply-To: <20201023181847.GA6776@ls3530.fritz.box>
References: <20200829122017.GA3988@ls3530.fritz.box>
        <20201020192101.772bedd5@wim.jer>
        <fa0f48dd-ff18-07f9-1084-2c369225e0e7@gmx.de>
        <20201022173824.49b6b7f5@wim.jer>
        <5f21f5f7-aaa3-e760-b5a3-7477913026b7@gmx.de>
        <20201022164007.GA10653@ls3530.fritz.box>
        <20201023181847.GA6776@ls3530.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEOMlJRWH3Go3MHxpo9dDRFSRQ3SjfNKObuN+0/TTLUG/15MldmxX8ArFW3FoledSRJje56llxv5vQ99xuwnU3+9m9m6dkPLvyYRb2/OghjT+scRsiyW
 Naqq3gFDp8uaTwdItUp83bYG0+KKwk6UQE79APxgOGD7Nv8LRTfk/y8M1zKUV3J2GVaGK9O4wzmxU7jh4nijsyE93HI/zw7P0hj2tCIWkEzZCWANZU24FEho
 Go/Dm6dvXnJUqTY/bzWePvPaRYeRhJoEXGzQrkvXKhS0MQqWLiOrdNNut4axnsiXG8nINvgNKHI5EVqhOL8x2w==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 23 Oct 2020 20:18:47 +0200
Helge Deller <deller@gmx.de> wrote:

> +static int FIX_O_NONBLOCK(int flags)
> +{
> +	if (flags & O_NONBLOCK_MASK_OUT) {
> +		struct task_struct *tsk = current;
> +		pr_warn_once("%s(%d) uses a deprecated O_NONBLOCK
> value.\n",
> +			tsk->comm, tsk->pid);
> +	}
> +	return flags & ~O_NONBLOCK_MASK_OUT;
> +}

Would it be interesting to additionally report the calling function in
search for other syscalls that might not be covered yet?


Regards,
     jer

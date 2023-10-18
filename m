Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDE47CD660
	for <lists+linux-parisc@lfdr.de>; Wed, 18 Oct 2023 10:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235167AbjJRI0s (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Wed, 18 Oct 2023 04:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235178AbjJRI0q (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 18 Oct 2023 04:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585F4B6
        for <linux-parisc@vger.kernel.org>; Wed, 18 Oct 2023 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697617556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LjzSocfdAfDkrBURoH/UDEiTk7o5qnArVSGlXdT8TDY=;
        b=PGYvyQI07TexjUD6I0ztY0mIYu/nhDyayGqaOxpdHvSR5XFvyKgC5iEm8Msgg2+e/sxvJe
        KmQ/w1pleHyBNypBVu5+TXL2FHFE/90cgO2dao+BWCLZPeHjPcp95gLg8uTChAwapOqzWU
        SpzDwSUPmHJApq2GsZjsW0c/KS8hM+4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-j0ZPydH1Pv-TAGOnqxKyOA-1; Wed, 18 Oct 2023 04:25:45 -0400
X-MC-Unique: j0ZPydH1Pv-TAGOnqxKyOA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-32d931872cbso3634473f8f.0
        for <linux-parisc@vger.kernel.org>; Wed, 18 Oct 2023 01:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697617544; x=1698222344;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjzSocfdAfDkrBURoH/UDEiTk7o5qnArVSGlXdT8TDY=;
        b=ou9q62Zg1oKU4V91ZmBiqkvJd5fiCamipivnxYIApJIJdG1LpR9ED9evSxn4jGLGyD
         EY7i8yRo+lqGKgVxtfkJaGVhvT8UILk/+2ZvcfKctK8DDwd6LsdzYwTSLOcu/d0F4t8E
         whnsayswqW3EbTXZrjZ1G2Nfg8+zopE3dUzi3t7tcJYaWNQvm3nsLTNbGkIJXaxwTHCF
         oFTCSNBAgNVJW57o5uQpaE+GM0CHWYBYcgUQStpGxNY7c/OB70w3F1tgMoOTzZ1yu+lF
         CS7/CKrkw66PUD58R5a0jXOKXuRicOtVyFCis2NAXf4N0lJbJ8pFRtalcBzUOBwzmH9C
         zVCg==
X-Gm-Message-State: AOJu0YwkJqIiH6+sM868Mzi2mR5EOTKVjquS68i4GCQtPJAGDXWzPy5b
        RPgcIzHvvyGFrae9OsBiWj6qrUQgnPeIlKy/RyP1Tp8QoMrPjmaXYQVeMEACvHBfjlKgN53MTH6
        429VzL78d0cjPPqN7Lw7yr+2/
X-Received: by 2002:a5d:4c89:0:b0:32d:8094:f4c8 with SMTP id z9-20020a5d4c89000000b0032d8094f4c8mr3650291wrs.19.1697617544655;
        Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa4Q8xItiTztaLFOsH4D6hLMKERtw9q396FzIJnVUMQIU6RTlte1VKHlDSYg+C3e5HZRfxSQ==
X-Received: by 2002:a5d:4c89:0:b0:32d:8094:f4c8 with SMTP id z9-20020a5d4c89000000b0032d8094f4c8mr3650275wrs.19.1697617544348;
        Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
Received: from localhost (210.red-80-36-22.staticip.rima-tde.net. [80.36.22.210])
        by smtp.gmail.com with ESMTPSA id j14-20020adfea4e000000b0032d81837433sm1584752wrn.30.2023.10.18.01.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        sam@ravnborg.org, arnd@arndb.de, daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/46] fbdev: Init fb_ops with helpers for I/O memory
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
Date:   Wed, 18 Oct 2023 10:25:43 +0200
Message-ID: <877cnkqquw.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize struct fb_ops for drivers for hardware with framebuffers
> in I/O-memory ranges with the respective helper macros. Also select
> the appropriate Kconfig dependencies.
>
> The patchset is part of a larger effort to modularize the fbdev core
> and make it more adaptable. Most of these drivers do not initialize
> the fb_read, fb_write and fb_mmap callbacks in fb_ops. By leaving the
> callback pointers to NULL, they rely on the fbdev core to invoke the
> I/O-memory helpers by default. This default makes it impossible to
> remove the I/O-memory helpers on systems that don't need them. Setting
> the pointers explicitly will allow for the removal of the default. If
> a callback in fb_ops is unset, the operation will then be unsupported.
>
> Initializing struct fb_ops via helpers macros will also allow for a
> fine-grained setup, depending on Kconfig options. For example, it
> will be possible to leave out file I/O if FB_DEVICE has not been
> set.
>
> This patchset contains the majority of fbdev driver work. The updated
> drivers now initialize fb_ops with __FB_DEFAULT_IOMEM_OPS_RDWR,
> __FB_DEFAULT_IOMEM_OPS_DRAW and/or __FB_DEFAULT_IOMEM_OPS_MMAP if
> possible. Some drivers now use FB_DEFAULT_IOMEM_OPS, which sets all
> fields correctly. In Kconfig, each driver selects FB_IOMEM_FOPS to
> get the helpers for I/O memory. Drivers that use _RDWR, _DRAW and
> _MMAP unconditionally select FB_IOMEM_HELPERS, which selects the
> correct modules automatically.
>

I looked to all the driver changes as well and couldn't spot any issues.
For all the driver patches:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


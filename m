Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F0631E9AD
	for <lists+linux-parisc@lfdr.de>; Thu, 18 Feb 2021 13:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbhBRMSI (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 18 Feb 2021 07:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34457 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231962AbhBRLkB (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Feb 2021 06:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613648311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B2lJDd/EmEyicYFjWmTEhtQFprvghSwizmwUF39uDCA=;
        b=SXpBsPcnzFuwYyF6sjgCzEP473x6FRSW4UmpDWrn4es51lSBkXJgUC9y5/lg9/ZcFI+ULo
        ez7mvYllwPzUUNlzo567J+eNBLSSuj6Fgd3rDA0uHdnRhYAc0VqyjbVX4ewDwx0vjBzHPr
        mT81/yT3f3LoNJwPpitXun8zW9bzaY0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-8tht9IlYMkGRp3rwWz5O6A-1; Thu, 18 Feb 2021 06:27:18 -0500
X-MC-Unique: 8tht9IlYMkGRp3rwWz5O6A-1
Received: by mail-wm1-f71.google.com with SMTP id o18so619949wmq.2
        for <linux-parisc@vger.kernel.org>; Thu, 18 Feb 2021 03:27:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=B2lJDd/EmEyicYFjWmTEhtQFprvghSwizmwUF39uDCA=;
        b=L95fFDwgLtB8pQooLbumYQYfF2GM2voDJb2p6J52fliQbArS09lnYq3gk2fQ8qpzWl
         dQq8fhswFQRnB44EqkZ1G7SQlP9IlHrQFt0pAuQNeGzTDKPP2ASzHBqeAOglo7VJSVlH
         Q6kWNQk1B2P9y/IPQ+A31k5Pg6q93AgZWcmHn9WFdatBznL3jLqjGBzhUxKYOBII2HLn
         KyRtOyHI+WX+TehuxQKhvliV7gCIRYzK4dwdEwrvODdWFPZ9jy5VUzwj9sHv+xFx5glT
         HeCKY8gT+Q91L+aMaVx/2E9ms0W4XaQ9a18Pm8nDp7hHKd+rgomZzAmF3Wo1ntHqPJqf
         IKmw==
X-Gm-Message-State: AOAM533pdm+R7MofDHZfwFsTo9r2ChLfzF3StHduA79GV2ACY1oVHtRW
        FbWssm6eYVRdvmgOWEBLRNcWdR5f9Otl3YJ3/VZY7SPN/9mzOzUg3okdrom6ujaW3LOI6bugZhc
        9lcesjTA9Xx9O46J/QX1kzwqM
X-Received: by 2002:a5d:5603:: with SMTP id l3mr3844594wrv.381.1613647637540;
        Thu, 18 Feb 2021 03:27:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLyyzkRu11gz+G6nk3c6VOzvN//OlBNN/w5+7pt1wCSevM1IKNiAfU0aiolWZiThh5hiWffQ==
X-Received: by 2002:a5d:5603:: with SMTP id l3mr3844554wrv.381.1613647637334;
        Thu, 18 Feb 2021 03:27:17 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6baa.dip0.t-ipconnect.de. [91.12.107.170])
        by smtp.gmail.com with ESMTPSA id h11sm6573479wmq.26.2021.02.18.03.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 03:27:16 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to prefault/prealloc memory
Date:   Thu, 18 Feb 2021 12:27:14 +0100
Message-Id: <254581A8-3108-436F-80AF-129B3F93CBF4@redhat.com>
References: <50f73055950ff7382f2194134ef0f439@sf-tec.de>
Cc:     Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Hansen <dave.hansen@intel.com>,
        Hugh Dickins <hughd@google.com>,
        Rik van Riel <riel@surriel.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
        Linux API <linux-api@vger.kernel.org>
In-Reply-To: <50f73055950ff7382f2194134ef0f439@sf-tec.de>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
X-Mailer: iPhone Mail (18D52)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


> Am 18.02.2021 um 12:15 schrieb Rolf Eike Beer <eike-kernel@sf-tec.de>:
>=20
> =EF=BB=BF
>>=20
>>> Let's introduce MADV_POPULATE with the following semantics
>>> 1. MADV_POPULATED does not work on PROT_NONE and special VMAs. It works
>>>   on everything else.
>>> 2. Errors during MADV_POPULATED (especially OOM) are reported. If we hit=

>>>   hardware errors on pages, ignore them - nothing we really can or
>>>   should do.
>>> 3. On errors during MADV_POPULATED, some memory might have been
>>>   populated. Callers have to clean up if they care.
>>> 4. Concurrent changes to the virtual memory layour are tolerated - we
>                                                    ^t
>>>   process each and every PFN only once, though.
>>> 5. If MADV_POPULATE succeeds, all memory in the range can be accessed
>>>   without SIGBUS. (of course, not if user space changed mappings in the
>>>   meantime or KSM kicked in on anonymous memory).
>=20
> You are talking both about MADV_POPULATE and MADV_POPULATED here.
>=20

Already fixed up :) thanks!

> Eike
>=20


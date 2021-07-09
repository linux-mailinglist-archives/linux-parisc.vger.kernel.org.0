Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0A83C1C9A
	for <lists+linux-parisc@lfdr.de>; Fri,  9 Jul 2021 02:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhGIA3z (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 8 Jul 2021 20:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhGIA3z (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 8 Jul 2021 20:29:55 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C6CC06175F
        for <linux-parisc@vger.kernel.org>; Thu,  8 Jul 2021 17:27:11 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id b14-20020a17090a7aceb029017261c7d206so7227433pjl.5
        for <linux-parisc@vger.kernel.org>; Thu, 08 Jul 2021 17:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=kGUDF61kH7DuKZ9RNXka80YbVY+lTdsyFO1WYdrvzWw=;
        b=wYMT0y5pftXlm42ofM/k5HL7GVLczsZ/CKpg++6+mXmjARsgGdDsHwSjjXQbPiqWih
         E7Q+MiBJAIX41DXE5qm0jR8zcKFW/9KBolGwoQ+qpcziw8gydXHRqWRSEeFzeXlSB6k+
         s4mc8r2N3h8vEv3iRRgyHMiGKudGuITJ4erphjRDkHuXtvwdCsgq1Wmdw9njoZrIQq9h
         p+UE3aL4dhvVSCJLiJDn4Up2sXw7y06srHC7+0y45YoZTmYe/Vl3JfEf31ZcSWLflLNI
         L3ZomiVtTkzgWrc+IOraMqu2s9aBB9k5nW2xdowPNPc1HDcCT0dUXwEy1JBl49hrQpcM
         wfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=kGUDF61kH7DuKZ9RNXka80YbVY+lTdsyFO1WYdrvzWw=;
        b=b636CQE/yLpTbEbqz/4FgW/qO77QEehR85QqTNtPnjbT4K2iFPLak4X7gZ61o3Mufa
         V1cJ8sG4BkyvgUzMa8ve+KNlnb0Fj1jq6tNLsJQymvItS0XHNZWbW2fpO3tPocM+/t5g
         9gGpE+fjBqghy7fp/oiyx4Xxn/jOffM3gEgJCHUYM7bw0WcutGmypoRhIWooPhbiPRvp
         sFjTWhXmRxbazc2t8NQy5ULtAeZAx3PlA/WgVqgI0dgifrTE9NHv2G5IiQToU7Ks8ayB
         CGjuS1RvL2PWEBpTjmGZ1+EQjzy4Olv5IqFmruniQUGdmpnElQsxZBjLWO3mUEIOnxAJ
         79zQ==
X-Gm-Message-State: AOAM531WwWlKBf85lw6tkTztafy7b+BiS2I+9TnN4v91nv2i4VrqhnV9
        bpw9Cbd2SXfTAbtGnaYaGYKL6g==
X-Google-Smtp-Source: ABdhPJwdz9geUWM9jxrc5l+YNr1Ebckl9l1sXse3W1hOWbs8iUeg6/elAtYObCaRypwAlF6HVmE4kA==
X-Received: by 2002:a17:90a:aa8a:: with SMTP id l10mr34849991pjq.227.1625790431170;
        Thu, 08 Jul 2021 17:27:11 -0700 (PDT)
Received: from hermes.local (204-195-33-123.wavecable.com. [204.195.33.123])
        by smtp.gmail.com with ESMTPSA id a31sm4796676pgm.73.2021.07.08.17.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 17:27:10 -0700 (PDT)
Date:   Thu, 8 Jul 2021 17:27:07 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc:     gregkh@linuxfoundation.org, Carlos Bilbao <bilbao@vt.edu>,
        alexander.deucher@amd.com, davem@davemloft.net,
        mchehab+huawei@kernel.org, kuba@kernel.org,
        James.Bottomley@hansenpartnership.com, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: Follow the indentation coding standard on
 printks
Message-ID: <20210708172707.7c4a5d5f@hermes.local>
In-Reply-To: <2148456.iZASKD2KPV@daneel.sf-tec.de>
References: <2784471.e9J7NaK4W3@iron-maiden>
        <2148456.iZASKD2KPV@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/osUijuuKOZk+rhcif3qc0dd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--Sig_/osUijuuKOZk+rhcif3qc0dd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Jul 2021 23:25:37 +0200
Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:

> Am Donnerstag, 8. Juli 2021, 15:10:01 CEST schrieb Carlos Bilbao:
> > Fix indentation of printks that start at the beginning of the line. Cha=
nge
> > this for the right number of space characters, or tabs if the file uses
> > them. =20
>=20
> > diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c

Does anyone still have Linux ATM devices?


--Sig_/osUijuuKOZk+rhcif3qc0dd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn2/DRbBb5+dmuDyPgKd/YJXN5H4FAmDnl9sACgkQgKd/YJXN
5H44YBAAnkAyswyrE/rskVunJmbFn2UtmB7idcIWZNhNmp7BkEhyEYyzCVcAx6bM
bnk6ClVxxIJpdvdvlYcnloA6+MOWcYRXDeL2slbmTsm+B4WP0hoFqDot0y3SW9xo
Y9XTyebLLT+x6xCBE8S+VeaIiIgHDmPiHCyB5XWxYulwcuQ38d3+vi0joRMBF1S7
I6LJ/gQqQCzrjSOnuEFASNOwbVdGUz73UFz1N9FqInsU8w0ihdMHOdeheB73Ib/R
GeEg58853dmIrwAZsejSbk9sgD+vMYpa4giHCyJgbus75SUCK9m246O/bnljf/oC
3rGruoeFAHLvvHk530CMNy4QvyByXOKN8arPItYfXxaHIosjhy8x824fPpknRrnL
emIlOQksSmma+MtUVCZmasKeEBcuWTXIrl1bRcnWtFBr72v/JEi5bH0Pu+z0kVNS
lK46OJwWZy3dE1bkOyiYLIgIEPek9bqpmRsqqy9zDb8597wYjeK+qHZa83j75O0a
vY0j6IvQmxAbmTehfgfjIeXS55x71981Y2wevmBk+8M7FB1oqKTjRefjIs2FbiMl
nSdtBWPqTioCTDE4LR59IbeKOyVf09K1yKvl98BOQReRwPSVGzQ6KrJGMBDAoxbJ
a5gx6B8wcJZjSGw6ydVDm18zrQ8wY1S/cbXvzlTDzXNl1vW9EE8=
=ELNb
-----END PGP SIGNATURE-----

--Sig_/osUijuuKOZk+rhcif3qc0dd--

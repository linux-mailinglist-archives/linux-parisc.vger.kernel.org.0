Return-Path: <linux-parisc+bounces-3800-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7834BB0CB64
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 22:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AADC97B1A1F
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Jul 2025 20:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B532AD0F;
	Mon, 21 Jul 2025 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b="uP2AZNaM"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cmx-torrgo001.bell.net (mta-tor-007.bell.net [209.71.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568BE2376EC
	for <linux-parisc@vger.kernel.org>; Mon, 21 Jul 2025 20:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.71.212.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753128798; cv=none; b=mTFxUJDATXXTFeTckQEZsZFWFnu23EW4ArTMHsLD5oBlQZjsUWyEA/FxoMBmHDGrY3UZ13Id9Fb9H4M+NBFVnmkP1NpAUnfGXKqTT7tQbF1xH3zsUqCzooAylmP0qeFBWflHNHribPOWCeth02G25C7eG+l5vsAfKnrSckrsTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753128798; c=relaxed/simple;
	bh=c4bF5wuDskOoThVYLlSS9MM77WEGPGwZznRO1XJ3UAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfHV+ZNQIOSE67K+UTU09/PKbhJPBRI2+kaVrMYuL6Sqv8tZQCPwt13ugcInGWq8yHpLE8n2T8Fhz2ighsrV2ab+VjQGO8GaWampLr6fY2ib/A6hBcjBQqz6/nXMGwI50vPM9lizp9u7nFC1Hv9t+JTNesiZt9TSZZFBKhBfZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net; spf=pass smtp.mailfrom=bell.net; dkim=pass (2048-bit key) header.d=bell.net header.i=@bell.net header.b=uP2AZNaM; arc=none smtp.client-ip=209.71.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bell.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1753128796; 
        bh=c6AmiQqhaaIy61gxInZeYSvqe0310hGVzMUWBQ9xsG4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=uP2AZNaMTTVNoCjkL4emep1a8XbcRHuyW9j9jEuF1nAbUMzx1Bl7GM/sTp2TP9+onasIU8LtPEdIPxv9VlUbeNSsJ3daCCmUG6MrV3rd343xgqjE5hBY3Sm+j7VsxkNAaNMF7cQWVj/d5aXj0DsileytpDW0WrFYMSe70/fjBCmVBX2Eavppdu+iDg5H3oFl2HT1XZR8VM355hljXOUII8aJNHUKHVTKy6Kq83uQr/oYAQHZdRzbe61Y7ze7YZDZGAEpI+daoZywqDOOcHSU22J4zMK2L8sMQ61ujQaKJneS/7YtitbKvZVXmTToAJVuRFg3Y4tdb3PXVP2DeTRmhg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 687A6B9A00665C24
X-RazorGate-Vade: dmFkZTFVRT3LQ87jrghPBSFb4zX/qDCBjZdpAz/DmIz3wz3RkN0sYrVizs7T4+siT/BPStpe0WsXOjBgaVovoyfaT2ZzMYOdhxRPOzVewQtAFSR//dC4CRbCxE7s7cawZoZQm7EywedVLqONHekkMUHRKOzzsl5m6Vg3qzMVJfuaegVlOkNCRgqtES4GP8jspOluTLe5icFlZ4MwiIKg+rLcLE/HEguBM9ykRa7fwUIXfa7k8ku8HDiZcmwsFqszSI890tLn4qcxZJUzoTY2sLhqhHa1gpqXT2JnleZib4k1iHHmjuSen3X6D6CyDmajJYVByrDNoR8COlkQkFLd82e4IcLdijRJCA5eRVil8nidkQtUi3/MMEoOetXHEbzGr72CiPVhzQtteMzvzzEtMsw2cjDCCrrwDAj/ym380jBuMJJAuTnruE0ImTcLELKiWrjz0bPNUcpYy3/Eyyw6BHhr3RyUnlfRGab06UYB94owjBhtNvITb7v+Do8+TjAvn7S2R8xi1hL2Ej2Jmgka8Vja3pWdyBteJq+zZWXNkbHeugbBwR44QNQas+OfA3vrb84oo+tOiRdNJcwVIhq+YNIB8u9pEfa+QxS7LlezGnxfHlQRPiHVWH/q/brTYjdOqRzwiKhJZohirA28c1Ly3nOa0lD55m92Hw/RrrXm2uv6i/5Sfw
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from mx3210.local (142.126.136.104) by cmx-torrgo001.bell.net (authenticated as dave.anglin@bell.net)
        id 687A6B9A00665C24; Mon, 21 Jul 2025 16:13:15 -0400
Date: Mon, 21 Jul 2025 16:13:13 -0400
From: John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Subject: [PATCH] parisc: Try to fixup kernel exception in
 bad_area_nosemaphore path of do_page_fault()
Message-ID: <aH6fWe6DU2_TWD23@mx3210.local>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ShEAAG0axkqHx+NB"
Content-Disposition: inline


--ShEAAG0axkqHx+NB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

parisc: Try to fixup kernel exception in bad_area_nosemaphore path of do_pa=
ge_fault()

Signed-off-by: John David Anglin <dave.anglin@bell.net>
---

diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index c39de84e98b0..f1785640b049 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -363,6 +363,10 @@ void do_page_fault(struct pt_regs *regs, unsigned long=
 code,
 	mmap_read_unlock(mm);
=20
 bad_area_nosemaphore:
+	if (!user_mode(regs) && fixup_exception(regs)) {
+		return;
+	}
+
 	if (user_mode(regs)) {
 		int signo, si_code;
=20

--ShEAAG0axkqHx+NB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEnRzl+6e9+DTrEhyEXb/Nrl8ZTfEFAmh+n1gACgkQXb/Nrl8Z
TfGzSBAAsFb3xtFEsx7yruBoMKT05RZMAtoXZ949Ro48Tq+yzr19u+lmn/v9r+LT
eUI9Z/N1SE+lFMS95siDUYO6xL6DMYRM5/edYa9ph8rh5LQ3lRZShg4kJ93Qx6hI
jc3PKO/xTpZaJsgoTnlSHlTw9oCY2maq2nuHaXiyMdeaQIciKdQolxSilxUxJydt
Uzjmjjb8CvW/5Ggt3mQqsIAd/yCEPq/9rfh5yqXfjozocWkSIybr6BfFoTsOGd8G
0VvYN74RiYTJvztlg645rIRUlBnj4KQTeJ/PQhwKO8lRkz8aWGyCwqKlwIIInoXr
m+STP4dI8BslZIsNpBpRPlxdXaxTHnNYN9eeg4CT1P8P5UGpR60pcJkqIT7le2Te
F8Da0Wf+es4afeMj8ZcRU6Glh8z7tGwSTLpIFIhbk/w4ySqoWsvc9Agv6pTGFGal
7nOpLyDKNN229isxHyzhvpbZyIQyeVAiLn2jPvxpsLbsTaseWRp9uAZFUGqtdD5F
alvvrnVMvtVnXd+Us59oPRsnGdG2xHQzZ0maPpc1xquIAo0ZYlXLyaXqjmhfLnZU
KTQc8bIUqfv4DInfNOvX3Kri2gnq3bxiqGSzPhEXSesSC3lj+JRteWULqL/v76vT
9KtCGQ3hrI0gvumidqqNpKIBRFmyPDVot3E2Gt95ycy1T6g3shY=
=9WnU
-----END PGP SIGNATURE-----

--ShEAAG0axkqHx+NB--


Return-Path: <linux-parisc+bounces-4135-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E4EB87750
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Sep 2025 02:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005EF1CC04D6
	for <lists+linux-parisc@lfdr.de>; Fri, 19 Sep 2025 00:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A22481B1;
	Fri, 19 Sep 2025 00:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="0BRdqc78"
X-Original-To: linux-parisc@vger.kernel.org
Received: from cdmsr1.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285762629D
	for <linux-parisc@vger.kernel.org>; Fri, 19 Sep 2025 00:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758241292; cv=none; b=Z9gcfS5RNbI+IThP8KFBLqeIV2ds868Deb3lpXSlQoUTbvjoDlEVukyOiXOdDGBe2De9QMlLDRBnr4opsvJov542ErDT9TlBgrId3EBD7yE2cmbX5kHNpMnpxthPD6GfAdwqwZqqJfP70aLhkyUbO+UWFvllMl25gFFR7I1cbsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758241292; c=relaxed/simple;
	bh=NYpvHFrW+6WJdAoVAxtmW6ZPYUGGPlR0B51uZtc+3E0=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=I9grhjkOSwKm+g2aLBdLuy9qW/lGFZfkkzVCGDrGmWoCETvwrFcf3Ghbvli84InBSy3vnUxiFoVN1q8NEOaLSUy9X+2i1i7McT+JhAeRXmMQfyvkmFBEQkcJhkkMUxGN03st7hO3hB9Njqy1MSeurAqP/V92xgVzWcQt4T5YcqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=0BRdqc78; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Received: from cmsr1.hinet.net ([10.199.216.80])
	by cdmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58J0LPOE381777
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Fri, 19 Sep 2025 08:21:26 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1758241286; bh=bHPGMPKfAEEenMl5a6VUBVWn7TE=;
	h=From:To:Subject:Date;
	b=0BRdqc78euDBoopzggToew9QMEjqvb6zERh1DPh+bj7O6nuBiElXJBCfakif0jycz
	 cLvJ0NI0YCvbNPqeXOuR+9ogqIy7X+jSfhFzSGNtjB8jEks7p5WmoZmZBzYp8C8jY7
	 vbzsVR9AX6krNaU002JdUcAiILBjsXLf8HrbcQ+M=
Received: from [127.0.0.1] (114-39-20-11.dynamic-ip.hinet.net [114.39.20.11])
	by cmsr1.hinet.net (8.15.2/8.15.2) with ESMTPS id 58J0GqXo923787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-parisc@vger.kernel.org>; Fri, 19 Sep 2025 08:20:00 +0800
From: "Info - Albinayah 525" <Linux-parisc@ms29.hinet.net>
To: linux-parisc@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gNzkxODYgRnJpZGF5LCBTZXB0ZW1iZXIgMTksIDIwMjUgYXQgMDI6MTk6NTggQU0=?=
Message-ID: <ff97bce7-dfdf-6ff9-2003-38dc0020ca86@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Fri, 19 Sep 2025 00:19:59 +0000
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=LvQxyWdc c=0 sm=1 tr=0 ts=68cca1b1
	p=OrFXhexWvejrBOeqCD4A:9 a=XdTraHvnkcqc+vkk0RF5tw==:117 a=IkcTkHD0fZMA:10
	a=5KLPUuaC_9wA:10

Hi Linux-parisc,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading


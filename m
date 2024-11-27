Return-Path: <linux-parisc+bounces-2943-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D77D49DAE6A
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Nov 2024 21:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE292819AE
	for <lists+linux-parisc@lfdr.de>; Wed, 27 Nov 2024 20:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755EC2CCC0;
	Wed, 27 Nov 2024 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U65JD4ou"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF751FF7B4
	for <linux-parisc@vger.kernel.org>; Wed, 27 Nov 2024 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732738662; cv=none; b=CSYTjTJr8o6nTRVUmGL1n4cHNLpEMYSUCCUJPDR5ZjEKbB+a6tn+ZQNjS4peokb8bclXylau9Qk/yRCOO3QzfW7qH/MfZlV6WK+MBpQ6tW5gDLgPmF82D6n8ufIFWu56V/gXyxVyKPnn/u/ng/U2NDnBwkD4brolC7JSMD8dWpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732738662; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=tgsLLswMsoHg8S1jtV2yCxbYzv/6yYsWVh/kCM0v0hpNkccUKIgz8vaXcAS/qvDMmtDTsXeVcJ54R3WcYejvZpp9MZ50KU4toJ3lpO6UZmjcOz2eO46fR1dz28dt2aFARZSbnNSz6loOTGj/l9XjqaVEg4kSIE5e8VE0Rm51X8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U65JD4ou; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3824aef833bso91250f8f.0
        for <linux-parisc@vger.kernel.org>; Wed, 27 Nov 2024 12:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732738659; x=1733343459; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=U65JD4ou96Gfnmdlf2o0y8WilojgpQuANV26SU01t0cUk7365FZnp2KtQUKkUePTdW
         NCI4BbTRTJ0RfT0SStF2zAQVYKckqxYUTJZh62xTuc7bQuA3tUTVKLuAFRSs9Ikn6HfE
         /5G2oQfdyLvGRbO3sfHCwg1qCmnSDD8lbU+wwMjmo4j/AAIBuw6XrhqnZMNvyyjReYaK
         8mzr3u2yvKp8A9fjxBlBuzq3qRzgx5/YoIaKMF0SnO4wSjxPCV2NcUwynbUQSVUXH98V
         1/f0ExtCx08Ydzsp4WAErdKc6BpMz5W3iTnmc7aH66QzTAI7pKjbav9dz42DjVpw7f1S
         gkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732738659; x=1733343459;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=a5EfXDmN3z5J3oBbmNztgpcbvoP+nizJbltIXh58+GDkmFfCrAAY6dreKyLoeyCvxL
         3IvyA6l1A3x383h/Xc+WCU4cec+mbJm+CHufw0tDhVYxqq6sqM9KPKqXmXZlqrJhOyi5
         7eeFRYYGRkilapDF8X2oL0wjOZb6BfnsjYwYRMWEfXkYNOmO93EdO577ZvtRMbH0lsDi
         SiC1iXG000JX8jNFhUWM+cfMCfnN5ST7CYshquimdt2Q04EfN7CCjFPn7mNSb4wGb5+H
         MRwV+KAmQ2AqLYVl7ZhU6JXvh7JUBepzF/fPRlRQe6uN+sOaQ/RrSdBleapSHzayvFM5
         Mnww==
X-Gm-Message-State: AOJu0YyoJNVfB/WmpQak1wA3Mzz1jNxZdYI25AEdZKYK8xceNsxuUnoq
	tSG111eysq9gcEnb4NCxNI+SCDApJHNAAPKolUchmebFZXdJnMJxJM32Zg==
X-Gm-Gg: ASbGncuhDygQIzdhopej7DtAqrIyMNSyxTjcCZmmSAoxRytcE1kkMOdTg6WR48nXWkh
	OdZovddH+QOWHztyPZKfUJOL/r7VML+UtxYhAuAaEtmqteWRAc/smSYO1dPX1ZCQQimSkbZij08
	hmWcdb/onI8E9rCCZ5KLLNzizj2DM/L49g+oCCRFsc4ef0DuqSbR37PzW7L/WIxJQiOS9LwnI1R
	GAJ7XhAtA1Qjhec7b5mQLNiHQMqx+NFrwruAn+17ZVYeywDoeg=
X-Google-Smtp-Source: AGHT+IFZnxdImsFvrYQwMYMEOI09nC3EYEZA4yCAcJ2ktZSSsqGP9XH/VPX4n88j7YwrwJfK3Am8Hg==
X-Received: by 2002:a05:6000:2d12:b0:37c:d244:bdb1 with SMTP id ffacd0b85a97d-385c6ebae04mr3070645f8f.26.1732738659040;
        Wed, 27 Nov 2024 12:17:39 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm17052356f8f.33.2024.11.27.12.17.38
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2024 12:17:38 -0800 (PST)
From: William Cheung <tammywoodhdhfsg84432@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <a478d3dc44eaabab3daa6301f6140a257612a3ca698d0218f6da1e836351218a@mx.google.com>
Reply-To: willchg@hotmail.com
To: linux-parisc@vger.kernel.org
Subject: Lucrative Proposal
Date: Wed, 27 Nov 2024 12:17:18 -0800
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.


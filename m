Return-Path: <linux-parisc+bounces-4145-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCDEB97E88
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Sep 2025 02:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AD9419C3717
	for <lists+linux-parisc@lfdr.de>; Wed, 24 Sep 2025 00:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8176319ABC6;
	Wed, 24 Sep 2025 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="Af1gAMK3"
X-Original-To: linux-parisc@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1378C18C008
	for <linux-parisc@vger.kernel.org>; Wed, 24 Sep 2025 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674103; cv=pass; b=XrDupg06UibEH16fD0UYYuXQqiXq3W2Pl0xJlKmyp8/wcWBINQ5qJnyOy3JnuTeGQ+OdXNC+Y+YoT/n344Ae2/tzrMmeRgazUEyc1960O4ZxF3JlYfko58wzuYRCjpuLFCQ66ZkMgZzxTjNBsT8JpJPCz3DTSByyOQaanId8wws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674103; c=relaxed/simple;
	bh=L5RfDDx5E9Al44+W7OTkwsd3IV0tK6SKW3qbGVgtFUc=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=ob2gqklaorvaoeee8LiOvh/H2pMGU2XVUXGTf6zBGLNmbBG+tryENTwQ02lFo4DdTjOQIGUuOpWsrOIC44d9uD359y2fO6P/J4ac8I8z0X5IU5yFjVGTZysHfJWJOqkWUgttGHr8Pk/sZxE6o5F0ex3QwQTCrJvXk30JhQn7gkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=Af1gAMK3; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674101; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=DMF4HsdwZ5ksCWyoRsvlBXTU/jtYdYpkk2g2YDgfGZXemwttSB550TX4cMVahL4B6tjCPYGopxg8JsI5OWGZWPiSdX7CZX9EgPnXdt1El7BaZ3WAFQnA4yWneJxo1mIs9RZv+uOx9IyA54M1oWwqe5s9Sqe75JSfsQSPS1jOrzs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674101; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=L5RfDDx5E9Al44+W7OTkwsd3IV0tK6SKW3qbGVgtFUc=; 
	b=lZI9VSdq7dsbqDKohKOQwSRpYPJSA0l9lQ32OIUJunKXXnMLOxnZm6SoZOof8V7zak8PHdQO6Xl9BawWJZHOnoHjXFAiMnZsA72J2HTiEiRYix6+h0QsidpK472GPerkf9WoW+iKLL8FTTbwWQ7gLcbFlSD8w3j717FGjmimHX4=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9aa04d00-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 175867165353153.1471674992365;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=Af1gAMK37Z5gDXDA307Ff95wkBO5OgLEQ8ePWQujlHJ+LngzXlHARkauIrU7rJesvcpG3hxN2PUMK1VdBDRoQlAwws6yk467jAdxj5+zc6WrUu1avhwBhYaRN5bZTwt39n8G5AiGJjUJwdHubSVAJoyc/9RRE7u0/PtraAGID7w=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=L5RfDDx5E9Al44+W7OTkwsd3IV0tK6SKW3qbGVgtFUc=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-parisc@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9aa04d00-98d8-11f0-8217-5254007ea3ec.19978ffc5d0@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9aa04d00-98d8-11f0-8217-5254007ea3ec.19978ffc5d0
X-JID: 2d6f.1aedd99b146bc1ac.s1.9aa04d00-98d8-11f0-8217-5254007ea3ec.19978ffc5d0
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9aa04d00-98d8-11f0-8217-5254007ea3ec.19978ffc5d0
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9aa04d00-98d8-11f0-8217-5254007ea3ec.19978ffc5d0
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9aa04d00-98d8-11f0-8217-5254007ea3ec.19978ffc5d0@zeptomail.com>
X-ZohoMailClient: External

To: linux-parisc@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director


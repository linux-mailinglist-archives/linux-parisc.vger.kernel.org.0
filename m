Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E62D46003A
	for <lists+linux-parisc@lfdr.de>; Sat, 27 Nov 2021 17:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346831AbhK0Qh4 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 27 Nov 2021 11:37:56 -0500
Received: from mta-mtl-001.bell.net ([209.71.208.11]:46574 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbhK0Qfz (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 27 Nov 2021 11:35:55 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197730200C3EDD5
X-CM-Envelope: MS4xfG6xF7rZsfbPoKMOC0ywNaBV79ER3AGp4JttddbQAuCOo8+EY4OX9ZcmzrdyBG2QbNJb09rwED7JOK9wCH3m9aluKeU0RA+7Ch422QalKwzVFtD5daTj
 zMirqkqxr0HmP4iTR8qjAKyuo5HHyvSwCAx5B+s/J8x9FCSg4kz1XwQpcMkNZP4MSRabTPdpUgURNu4z8BpS5jnXbKLGfOcyY/zlcpvWwHlg5IKIb4GMf4M8
 2JgUx6HvXYs9d/2dXNxKsq+R9zXW1mHt1RQHxdpsOE/vvUxVLlLptMwYkOWg2inqNhoFzlzZdNreJHmwXcJ0sCiTVMLlEM7aj7KqQkEIRw1FS9wUyxHdHtj1
 0MpISgh3
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61a25da7
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=VPUhKpuZaOU0Yvd6DKgA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197730200C3EDD5; Sat, 27 Nov 2021 11:32:39 -0500
Message-ID: <0ed4c18f-79fb-fc95-5baf-ae9a1f99625b@bell.net>
Date:   Sat, 27 Nov 2021 11:32:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] parisc: Do not export __lshrdi3 on 64-bit with gcc >= 11
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        Sven Schnelle <svens@stackframe.org>
References: <20211127105818.299902-1-deller@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <20211127105818.299902-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-11-27 5:58 a.m., Helge Deller wrote:
> It seems the __lshrdi3 symbol was dropped from libgcc.a from gcc-11 for
> 64-bit executables.
This is gcc bug.  There's a typo in libgcc/config/pa/t-dimode:

# Extra DImode libgcc2 functions to build.
lib2difuncs = _muldi3 _negdi2 _lshrdi _ashldi3 _ashrdi3 _cmpdi2 _ucmpdi2

Will fix.

__lshrdi3 isn't needed anymore for 64-bit binaries with gcc-11 and later.  Not sure for other shifts
but it should be possible to handle them in pa.md.

Dave

-- 
John David Anglin  dave.anglin@bell.net


Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F26470C6A
	for <lists+linux-parisc@lfdr.de>; Fri, 10 Dec 2021 22:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244017AbhLJVWE (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 10 Dec 2021 16:22:04 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:30516 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S243990AbhLJVWD (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Dec 2021 16:22:03 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197648701EDFAA9
X-CM-Envelope: MS4xfKyp6A8ZnvV+wfGym50+GteyToEoQawuq4iQfUIceyvetWq2qn/n1mYNL3OjQKwu49zcjEMzoMrEaOIeZcnBBcKx7sQqqZL1M/mgX6bPWQPlM8OprJ1s
 DdlxI6vep9yoG1GSay8K9Qdstk90XaSbwBRXELuriJ/3caejwEkVewTpgSHIqBrOliXBird7bm3kppyaiTCaN3aeINlHH+w71J7xECMIcWht1gu6T/Vsda05
 JvHVJbVnYqIilgZjK9usG3i1LRBz6YvD8BS7f8snX78j1dkbp5DE8VF/CeYTX2qhr5ExQ87SUSLjXVecbcgmgQ==
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=61b3c41f
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=nx_0LQpeSx6JqU0RufoA:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197648701EDFAA9; Fri, 10 Dec 2021 16:18:23 -0500
Message-ID: <456e7622-3d3e-e37e-c40a-d3af5bf5bb27@bell.net>
Date:   Fri, 10 Dec 2021 16:18:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
 <a5eef9c4-8e0d-95e8-0c3d-0d0052d8edae@bell.net>
 <8a56f234-1126-e068-a70c-3b333320ef14@gmx.de>
 <87fsr0s0cc.fsf@x1.stackframe.org>
 <970b7b0a-eef9-df91-e474-e68dbcc3ae25@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <970b7b0a-eef9-df91-e474-e68dbcc3ae25@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-10 4:14 p.m., Helge Deller wrote:
> Btw, it seems I currently have vDSO (32bit) working with signal return code:-)
Awesome.  Will you post change?

Dave

-- 
John David Anglin  dave.anglin@bell.net


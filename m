Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F24A468DDD
	for <lists+linux-parisc@lfdr.de>; Mon,  6 Dec 2021 00:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhLEXI5 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sun, 5 Dec 2021 18:08:57 -0500
Received: from mta-mtl-001.bell.net ([209.71.208.11]:41022 "EHLO
        cmx-mtlrgo001.bell.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbhLEXI5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 5 Dec 2021 18:08:57 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197730201906C4A
X-CM-Envelope: MS4xfBcvQkVYCtRY5n/gZh4xENjB+w86HcqKPQSm3KtTnkrWvgSVoSGyS6XJBvVrLCtNbAiMrvsFR4FmdO8AZN+r5G5ix2rn9DevgKy3ufWqxCQd3CGqGxCv
 jXAEZhqvl6t+OyBP9e0FrMZf2unt+lU+9iatENDAPFv1mVr7aORoTW+khbaLNARvrlnHASSJf2mhB7JU4jH98Gy2Fif9RhpYa8K3rVBOMnN5mKfwQ2WMPTuI
 5LkiKrtibYJ1vmfeZiO9pGQv/qwVhENgDn+IFjO2q+0=
X-CM-Analysis: v=2.4 cv=eZxew5IH c=1 sm=1 tr=0 ts=61ad45b8
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=PrlL4mABic7yGiltdWcA:9 a=QEXdDO2ut3YA:10
 a=ATlVsGG5QSsA:10 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-mtlrgo001.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197730201906C4A; Sun, 5 Dec 2021 18:05:28 -0500
Message-ID: <a00c91d7-85d4-7c5d-85db-af812aadcb31@bell.net>
Date:   Sun, 5 Dec 2021 18:05:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Your System ate a SPARC! Gah! in map_pages()
Content-Language: en-US
From:   John David Anglin <dave.anglin@bell.net>
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <f3ba5c65-37d9-60a5-d2ae-19faa5dba384@bell.net>
 <872b7d67-82f6-cf6b-93b8-68fc79abcbaf@gmx.de>
 <8341244f-5db3-3dd0-5952-88e706eb9e81@bell.net>
In-Reply-To: <8341244f-5db3-3dd0-5952-88e706eb9e81@bell.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2021-12-05 4:00 p.m., John David Anglin wrote:
>> Does it boot if you remove the __init in front of map_pages?
> I'll try.  I thought of trying it but wasn't sure if map_pages() had to be an init routine or not.
This appears to fix boot.  System booted okay about six times.

Dave

-- 
John David Anglin  dave.anglin@bell.net


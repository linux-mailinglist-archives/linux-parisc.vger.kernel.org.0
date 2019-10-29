Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D788BE89FE
	for <lists+linux-parisc@lfdr.de>; Tue, 29 Oct 2019 14:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389032AbfJ2Nvl (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 29 Oct 2019 09:51:41 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:53418 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388871AbfJ2Nvk (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 29 Oct 2019 09:51:40 -0400
To:     linux-parisc@vger.kernel.org
From:   Meelis Roos <mroos@linux.ee>
Subject: INEQUIVALENT ALIASES ... in file systemd
Message-ID: <ff4d587e-ff33-c3ab-6d54-15d78e83cba4@linux.ee>
Date:   Tue, 29 Oct 2019 15:50:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: et-EE
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I just noticed the following warnings in dmesg in debian-ports userland with
the following packaged kernel:

Linux a400 5.3.0-1-parisc64 #1 SMP Debian 5.3.7-1 (2019-10-19) parisc64 GNU/Linux

it's a uniprocessor machine with SMP kernel.

Is this some problem in the kernel, or in the systemd binary? Systemd seems to work,
at least I did not notice anything wrong with it yet.

[ 4233.645281] INEQUIVALENT ALIASES 0x41cea000 and 0x42170000 in file systemd
[ 4233.655187] INEQUIVALENT ALIASES 0x41cec000 and 0x42172000 in file systemd
[ 4233.688577] INEQUIVALENT ALIASES 0x41ce9000 and 0x4216f000 in file systemd
[ 4233.718091] INEQUIVALENT ALIASES 0x41baf000 and 0x42035000 in file systemd
[ 4233.726336] INEQUIVALENT ALIASES 0x41bae000 and 0x42034000 in file systemd
[ 4233.752263] INEQUIVALENT ALIASES 0x41b97000 and 0x4201d000 in file systemd
[ 4233.781539] INEQUIVALENT ALIASES 0x41b96000 and 0x4201c000 in file systemd
[ 4233.821741] INEQUIVALENT ALIASES 0x41b9b000 and 0x42021000 in file systemd
[ 4233.829539] INEQUIVALENT ALIASES 0x41b9a000 and 0x42020000 in file systemd
[ 4233.854346] INEQUIVALENT ALIASES 0x41b99000 and 0x4201f000 in file systemd
[ 4233.872107] INEQUIVALENT ALIASES 0x41b98000 and 0x4201e000 in file systemd
[ 4233.915944] INEQUIVALENT ALIASES 0x41b9d000 and 0x42023000 in file systemd
[ 4234.056515] INEQUIVALENT ALIASES 0x41b9c000 and 0x42022000 in file systemd
[ 4234.081001] INEQUIVALENT ALIASES 0x41ba7000 and 0x4202d000 in file systemd
[ 4234.197039] INEQUIVALENT ALIASES 0x41ba6000 and 0x4202c000 in file systemd
[ 4234.340657] INEQUIVALENT ALIASES 0x41cde000 and 0x42164000 in file systemd
[ 4234.359754] INEQUIVALENT ALIASES 0x41ce7000 and 0x4216d000 in file systemd
[ 4234.480054] INEQUIVALENT ALIASES 0x41ced000 and 0x42173000 in file systemd
[ 4234.500783] INEQUIVALENT ALIASES 0x41b90000 and 0x42016000 in file systemd
[ 4234.626776] INEQUIVALENT ALIASES 0x41ce6000 and 0x4216c000 in file systemd
[ 4234.779875] INEQUIVALENT ALIASES 0x41cdd000 and 0x42163000 in file systemd
[ 4234.807300] INEQUIVALENT ALIASES 0x41b9f000 and 0x42025000 in file systemd
[ 4234.906048] INEQUIVALENT ALIASES 0x41b9e000 and 0x42024000 in file systemd
[ 4234.930052] INEQUIVALENT ALIASES 0x41b92000 and 0x42018000 in file systemd
[ 4235.046574] INEQUIVALENT ALIASES 0x41ceb000 and 0x42171000 in file systemd
[ 4235.184554] INEQUIVALENT ALIASES 0x41ba9000 and 0x4202f000 in file systemd
[ 4235.207196] INEQUIVALENT ALIASES 0x41ba8000 and 0x4202e000 in file systemd
[ 4235.335777] INEQUIVALENT ALIASES 0x41b93000 and 0x42019000 in file systemd
[ 4235.464729] INEQUIVALENT ALIASES 0x41b95000 and 0x4201b000 in file systemd
[ 4235.488730] INEQUIVALENT ALIASES 0x41b94000 and 0x4201a000 in file systemd
[ 7145.612693] INEQUIVALENT ALIASES 0x41be7000 and 0x4206d000 in file systemd
[ 7145.621103] INEQUIVALENT ALIASES 0x41be5000 and 0x4206b000 in file systemd
[ 7145.655818] INEQUIVALENT ALIASES 0x41be4000 and 0x4206a000 in file systemd
[ 7145.681522] INEQUIVALENT ALIASES 0x41be2000 and 0x42068000 in file systemd
[ 7145.706089] INEQUIVALENT ALIASES 0x41be1000 and 0x42067000 in file systemd
[ 7145.728249] INEQUIVALENT ALIASES 0x41be0000 and 0x42066000 in file systemd
[ 7145.759853] INEQUIVALENT ALIASES 0x41bdf000 and 0x42065000 in file systemd
[ 7145.780538] INEQUIVALENT ALIASES 0x41bde000 and 0x42064000 in file systemd
[ 7145.802321] INEQUIVALENT ALIASES 0x41bdd000 and 0x42063000 in file systemd
[ 7145.823421] INEQUIVALENT ALIASES 0x41bdc000 and 0x42062000 in file systemd
[ 7145.844442] INEQUIVALENT ALIASES 0x41bdb000 and 0x42061000 in file systemd
[ 7145.889834] INEQUIVALENT ALIASES 0x41bda000 and 0x42060000 in file systemd
[ 7146.030395] INEQUIVALENT ALIASES 0x41bd9000 and 0x4205f000 in file systemd
[ 7146.051576] INEQUIVALENT ALIASES 0x41bd8000 and 0x4205e000 in file systemd
[ 7146.176347] INEQUIVALENT ALIASES 0x41bd7000 and 0x4205d000 in file systemd
[ 7146.318623] INEQUIVALENT ALIASES 0x41bd6000 and 0x4205c000 in file systemd
[ 7146.333215] INEQUIVALENT ALIASES 0x41bd5000 and 0x4205b000 in file systemd
[ 7146.454474] INEQUIVALENT ALIASES 0x41bd4000 and 0x4205a000 in file systemd
[ 7146.475296] INEQUIVALENT ALIASES 0x41bd3000 and 0x42059000 in file systemd
[ 7146.597399] INEQUIVALENT ALIASES 0x41bd2000 and 0x42058000 in file systemd
[ 7146.739379] INEQUIVALENT ALIASES 0x41bd1000 and 0x42057000 in file systemd
[ 7146.755561] INEQUIVALENT ALIASES 0x41bd0000 and 0x42056000 in file systemd
[ 7146.879594] INEQUIVALENT ALIASES 0x41bcf000 and 0x42055000 in file systemd
[ 7146.897000] INEQUIVALENT ALIASES 0x41bce000 and 0x42054000 in file systemd
[ 7147.020598] INEQUIVALENT ALIASES 0x41bcd000 and 0x42053000 in file systemd
[ 7147.180553] INEQUIVALENT ALIASES 0x41cbe000 and 0x42144000 in file systemd
[ 7147.197632] INEQUIVALENT ALIASES 0x41cbd000 and 0x42143000 in file systemd
[ 7147.304563] INEQUIVALENT ALIASES 0x41cbc000 and 0x42142000 in file systemd
[ 7147.442849] INEQUIVALENT ALIASES 0x41cbb000 and 0x42141000 in file systemd
[ 7147.462815] INEQUIVALENT ALIASES 0x41cba000 and 0x42140000 in file systemd
[ 7147.586520] INEQUIVALENT ALIASES 0x41cb9000 and 0x4213f000 in file systemd
[ 7147.603987] INEQUIVALENT ALIASES 0x41cb8000 and 0x4213e000 in file systemd
[ 7147.724916] INEQUIVALENT ALIASES 0x41cb7000 and 0x4213d000 in file systemd
[ 7147.860865] INEQUIVALENT ALIASES 0x41cb6000 and 0x4213c000 in file systemd
[ 7147.882825] INEQUIVALENT ALIASES 0x41cb5000 and 0x4213b000 in file systemd
[ 7148.001942] INEQUIVALENT ALIASES 0x41cb4000 and 0x4213a000 in file systemd
[ 7148.023365] INEQUIVALENT ALIASES 0x41bcc000 and 0x42052000 in file systemd
[ 7148.142906] INEQUIVALENT ALIASES 0x41bcb000 and 0x42051000 in file systemd
[ 7148.288390] INEQUIVALENT ALIASES 0x41bca000 and 0x42050000 in file systemd
[ 7148.306333] INEQUIVALENT ALIASES 0x41bc9000 and 0x4204f000 in file systemd
[ 7148.424867] INEQUIVALENT ALIASES 0x41bc8000 and 0x4204e000 in file systemd
[ 7148.566525] INEQUIVALENT ALIASES 0x41bc7000 and 0x4204d000 in file systemd
[ 7148.586676] INEQUIVALENT ALIASES 0x41bc6000 and 0x4204c000 in file systemd
[ 7148.706000] INEQUIVALENT ALIASES 0x41bc5000 and 0x4204b000 in file systemd
[ 7148.726979] INEQUIVALENT ALIASES 0x41bc4000 and 0x4204a000 in file systemd
[ 7148.851915] INEQUIVALENT ALIASES 0x41bc3000 and 0x42049000 in file systemd
[ 7148.990512] INEQUIVALENT ALIASES 0x41bc2000 and 0x42048000 in file systemd
[ 7149.011792] INEQUIVALENT ALIASES 0x41bc1000 and 0x42047000 in file systemd
[ 7149.128846] INEQUIVALENT ALIASES 0x41bc0000 and 0x42046000 in file systemd
[ 7149.274490] INEQUIVALENT ALIASES 0x41bbf000 and 0x42045000 in file systemd
[ 7149.295450] INEQUIVALENT ALIASES 0x41bbe000 and 0x42044000 in file systemd
[ 7149.415962] INEQUIVALENT ALIASES 0x41bbd000 and 0x42043000 in file systemd
[ 7149.434241] INEQUIVALENT ALIASES 0x41bbc000 and 0x42042000 in file systemd
[ 7149.550677] INEQUIVALENT ALIASES 0x41bbb000 and 0x42041000 in file systemd
[ 7149.691576] INEQUIVALENT ALIASES 0x41bba000 and 0x42040000 in file systemd
[ 7149.712353] INEQUIVALENT ALIASES 0x41bb9000 and 0x4203f000 in file systemd
[ 7149.832464] INEQUIVALENT ALIASES 0x41bb8000 and 0x4203e000 in file systemd
[ 7149.853788] INEQUIVALENT ALIASES 0x41bb7000 and 0x4203d000 in file systemd
[ 7149.973666] INEQUIVALENT ALIASES 0x41bb6000 and 0x4203c000 in file systemd
[ 7150.114354] INEQUIVALENT ALIASES 0x41bb5000 and 0x4203b000 in file systemd
[ 7150.135148] INEQUIVALENT ALIASES 0x41bb4000 and 0x4203a000 in file systemd
[ 7150.257858] INEQUIVALENT ALIASES 0x41bb3000 and 0x42039000 in file systemd
[ 7150.401662] INEQUIVALENT ALIASES 0x41bb2000 and 0x42038000 in file systemd
[ 7150.416915] INEQUIVALENT ALIASES 0x41bb1000 and 0x42037000 in file systemd
[ 7150.541352] INEQUIVALENT ALIASES 0x41bb0000 and 0x42036000 in file systemd

-- 
Meelis Roos <mroos@linux.ee>

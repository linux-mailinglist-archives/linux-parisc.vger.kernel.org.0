Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F1C24481C
	for <lists+linux-parisc@lfdr.de>; Fri, 14 Aug 2020 12:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgHNKd1 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Fri, 14 Aug 2020 06:33:27 -0400
Received: from mx2.cyber.ee ([193.40.6.72]:42934 "EHLO mx2.cyber.ee"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgHNKd0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 14 Aug 2020 06:33:26 -0400
X-Greylist: delayed 477 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Aug 2020 06:33:25 EDT
To:     linux-parisc@vger.kernel.org
From:   Meelis Roos <mroos@linux.ee>
Subject: rp2470 boot crash in post-5.8 git
Message-ID: <820716ab-0c6d-5154-0789-072b01011313@linux.ee>
Date:   Fri, 14 Aug 2020 13:24:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

While 5.8.0 worked fine on my HP RP2470 (Gentoo with 10.2.0 kgcc), yesterdays dddcbc139e96 and todays a1d21081a60d crash on boot. I have started bisecting it.

Last output lines from 5.8.0-13161-gdddcbc139e96:

[    1.150985] 1. Crescendo 750 W2 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5e3, 0x00004 }
[    1.243570] 2. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
[    1.243792] 3. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[    1.382893] 4. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[    1.522243] 5. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[    1.660767] 6. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
[    1.799247] 7. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
[    1.799500]
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
        ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
h support not available.
[    2.639001] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
        ON       FLASH         FLASH     ON         ON
LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
Check Chassis and Console Logs for error messages.

processor                 system panic               1B00

---------------------------------------------------------------------------------------------------
Last output lines from 5.8.0-13249-ga1d21081a60d:

[    1.151696] 1. Crescendo 750 W2 at 0xfffffffffffa0000 [160] { 0, 0x0, 0x5e3, 0x00004 }
[    1.242819] 2. Memory at 0xfffffffffed08000 [8] { 1, 0x0, 0x09b, 0x00009 }
[    1.243041] 3. Astro BC Runway Port at 0xfffffffffed00000 [0] { 12, 0x0, 0x582, 0x0000b }
[    1.383414] 4. Elroy PCI Bridge at 0xfffffffffed30000 [0/0] { 13, 0x0, 0x782, 0x0000a }
[    1.523072] 5. Elroy PCI Bridge at 0xfffffffffed34000 [0/2] { 13, 0x0, 0x782, 0x0000a }
[    1.662053] 6. Elroy PCI Bridge at 0xfffffffffed38000 [0/4] { 13, 0x0, 0x782, 0x0000a }
[    1.800405] 7. Elroy PCI Bridge at 0xfffffffffed3c000 [0/6] { 13, 0x0, 0x782, 0x0000a }
[    1.800658]
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
        ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
        ON       FLASH         FLASH     ON         ON
LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
Check Chassis and Console Logs for error messages.

processor                 system panic               1B00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
        ON       FLASH         FLASH     ON         ON
LED State: System Running.  Unexpected Reboot.  Non-critical Error Detected.
Check Chassis and Console Logs for error messages.

processor                 system panic               1B00


-- 
Meelis Roos <mroos@linux.ee>

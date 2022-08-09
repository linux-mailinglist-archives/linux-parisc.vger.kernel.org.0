Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7904958D8EF
	for <lists+linux-parisc@lfdr.de>; Tue,  9 Aug 2022 14:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239344AbiHIMwT (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 9 Aug 2022 08:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243189AbiHIMwS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 9 Aug 2022 08:52:18 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61E26384
        for <linux-parisc@vger.kernel.org>; Tue,  9 Aug 2022 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1660049523;
        bh=PRfr3V2KxH1qgC90GADWo1WUI3hWagMzR9mDCEKVC+8=;
        h=X-UI-Sender-Class:Date:To:From:Subject;
        b=Xs8XVPT9L/K7lDSmzOXVw7odYaepsXeRZHP2gd/2ctKLhCoCf4e6FgkG6lpIIuNuK
         hhjT7HQK8ncbDEglmInqla3IpT+bv3IXBpBRd6GLjpQyCtgSJrXJQCIDCHc37LnVvX
         4HbsAjReeX5Rp2CMpxT4wQ2S8HOrfg3DmTA+8+vE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.54]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNbkv-1o1ESm2rdb-00P9gW; Tue, 09
 Aug 2022 14:52:03 +0200
Message-ID: <15eee327-ff0a-2bea-408d-259158915813@gmx.de>
Date:   Tue, 9 Aug 2022 14:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>,
        gentoo-hppa@lists.gentoo.org,
        HPPA porters <debian-hppa@lists.debian.org>
From:   Helge Deller <deller@gmx.de>
Subject: palo v2.22 released - PA-RISC bootloader v2.22
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pv2RvBN220faurEsIsX1Wk9Zev6vvWwx6XQ/mrA4m8z01cKxDd/
 rOL0RuhRCejP41a/E7YkO6bVx79zvBHG4Pw4D1NAD7Zcze7uMJsGullYvZktrWLSTCb7gpR
 ddxEIJWu44o0Y/woqhoi0fhKmU5bunzd5OqLr2545IDjvagBfFfg/zDa9x/KRgIGPPEYMVa
 sIjOy1WSrUXnKP5yhYGvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XVypPQPOLSU=:qD4UK6LQ4Vfji+RzDIhCOs
 OX8FHAFIrFzBB0/opFHm2sDq8SAAnRSP98ExpGmSgo2z/iR9H3wC6JnJFzS4idquZ0mCWdM5K
 SBOyDVJQTGzh5oo5Ljld4bvirrkfbP4sPz6rj1UwDV/6p4Vv+Um40+TLv96bUy/ofnfCAYJtk
 43EU7PD5y0iwDo6zXP8DIT4Dv2E5cB/0ZFhEB/tiCv39VGUdSWp7dhULixbg4/NBYDYidd5fs
 YxCRSqiaRDpSVsLME9Mf1YQ7C2MoTLvgemnx9p36R6nti6ZZFh3JdZlLVoDkn//iSdLsO1CUq
 Gn/emNW095VQRzBLbdcKNMfiMxTLZ1oiZjOiGUtaBcugPJ+JrGp95mFHwFClG/MZObmIKJEqM
 Wtj84m4d18f5EbteKWUDGHcZ3aSE6BEkq68j0Sta75NtFtAxjsIAY0+CXxx7+LXDy2+KJrbrg
 6BHRt1M2Lqrog49A38DFBwasMZWuW9W5x7UCuJueAUoYVqSJYyuYChBpGtkawGKYjcPQbBKTN
 KR0ioektT00Y4HhXnphYElustLE2Rjx5B5eIfIHrc5Knov0fUE7Qnu0REZnN5/ec6k+FjRMbh
 WBW3aYgvP7p/ln1jWirb4doSM5r+wA4AYH1+OJlKXPTa6H877836/oSHjYQ+AYZeXmwIrGlRq
 5Lyqu0QHr/Ui1+TEIyWsZgNi8L7N+bgqPM71D5Lrxi17k6Emd7+KSRtcLqEsjD6r//KTa2OyL
 l0JR4wA0OcUD5OS0EXr3jFzZ88CVv/VguEUm27yx7D6eRTQoaTtYY2EN3r/WbOmf70bO7W/Ug
 p0e6tiRlINUoe1mhSHD9ZxHGoLI7y0GFHTzz+VdMZaJA6oQmg4KAhg+V1RFW1A7SPf63tU1jr
 bGCpnXi8ZswwTQVEN2Bfw/o+N7sDQaNspzBSIANoN0735sWeEvVWmKZCYqgeR3u+wdwRKHG2H
 dUN1Tve2MczFaoPDHlVFhHU1o4XcMzE4+ulo9v4IpR9hLet1KbWDugfoTPYIY01WTFAqhromN
 zYk7Z0R2oF/gmq8yoyGqJFNZQyxZ72B8P8CG7/uGlbcsrQ1kx6LBJC79fTYPPTbOXA/HIs4Pj
 +yGOsMhqi2qfx1ex1GV0ISf9+XGa/XaBj9V
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello everyone,

I've released a new version of the PA-RISC bootloader "palo" v2.22.
The new version is available via git:
https://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git/
A pre-compiled debian package is available at:
http://parisc.parisc-linux.org/ftp/palo/palo_2.22_hppa.deb

Former palo versions were limited that the Linux Kernel and initrd
had to be located in the first 2GB of the drive, e.g. stored in the
palo partition or in an ext2-formatted /boot partition.

With the new palo release, this limitation isn't valid any longer
for the majority of PA-RISC machines. All newer machines, starting
from B/C-class (e.g. B160L) and all 64-bit machines (B2000, C3000, C8000)
provide firmware boot capatibility > 2GB, which is now being used by
palo if available.

If the firmware provides such support, palo will report at bootup:
 Boot limited to sectors below 2GB: NO

In that case, you may omit creation of a palo and /boot partition
and boot directly from any ext2/ext3/ext4 partition on this drive.

If you want to test the new version, simply build palo from source,
or use the debian package mentioned above. After installation, run
"palo -v" once to update the bootloader on your boot drive.
If you test, please let me know if it worked for you.

I'll upload this new version to the debian unstable archives soon.

Helge

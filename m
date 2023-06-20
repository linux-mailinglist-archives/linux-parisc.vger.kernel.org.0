Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 827DE737644
	for <lists+linux-parisc@lfdr.de>; Tue, 20 Jun 2023 22:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjFTUqM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 20 Jun 2023 16:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjFTUqL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 20 Jun 2023 16:46:11 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1479125
        for <linux-parisc@vger.kernel.org>; Tue, 20 Jun 2023 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687293947; x=1687898747; i=deller@gmx.de;
 bh=bJXdHBOj7O6BOr5gK+npknlim0NhWhDVQLyIZMZZFlM=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=BLDPVVllOr3I7CbA0aFvSmydyyUaBeNWawrniTg6dSXDRAdrw2ReBt84/0ktgmDLDg57qpt
 qirLuZL+0C76jEIrpG3zedIo3gDhjQ8O60nvlK1/z2v+mYYly98x5fTiM0+haNTlcZMF6sTvH
 +cuooSDjp1MxO43AQgGmoZ2HsEXfMtOPoUDBLhwyHiFn/1fXHPntPa/BEKl4Mo81HiXCspuEc
 gy7/ZfNtkqbCDu99/KL4tRsWNHOhXf1TAyh8U/qAobT2BQCFuxRPOA8C9vjbwiSOd4rNvM2zy
 mXKAyCxn/R0+nxr99WIMDaOe3k0wx4tRBbd36aareqH1eG5KQfuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.8]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLi8g-1qTNbn2XFg-00HdDr; Tue, 20
 Jun 2023 22:45:47 +0200
Message-ID: <5045152b-7f91-9e87-bb57-8e6852d2c8a1@gmx.de>
Date:   Tue, 20 Jun 2023 22:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Updated installation images for Debian Ports
Content-Language: en-US
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        debian-hppa <debian-hppa@lists.debian.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <630a95f4dfe3d407efac0aaccb334eeb33777ff1.camel@physik.fu-berlin.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <630a95f4dfe3d407efac0aaccb334eeb33777ff1.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HxKtVn74eLlvmmPO85IK5AU9/pM6HFoKxbwOM99HKlR6UB3QdRI
 91qnJPn5CvT8fnw0W0oUyF13mHXN7OfGB0X0nWwoXfxbsA3V8aPeu8YJhNYUiujyR2dy0Ou
 tra9stV11mwxS7n4lzfpxTDNvlkjlQcnvdK6mn8j2YRDAE86cgZiWGlEPKX18thrY1PdcAV
 amQ0XUjkeIeKnTi1p4GQA==
UI-OutboundReport: notjunk:1;M01:P0:xsIJywFpoWI=;NiOaYJcEeH/tk4vWYPAhDB5TYAJ
 glNrd+oTel1AIeRtKaff0DAZdpZeX8W08RY5zcejMRHJhEiA77+izF6Mu4lx2eH9vppTjMwWP
 GCOs7f3Z3L9yEtzDA5znrYPEKKxewhIoYEOBg9Q+IV1nKHMDqohcpJlCuBZSgh2P8nCSXvLMi
 Ur1xCToll63McYKc0ze81hZKqjDezyHI4gpXCqJR6sN4touVa9DHBcBdKqsPYQ5/6UseByf5Q
 5lJ7SNefDFb11L1V8LxAak1IpaKU71ANKne1Ve+VrQQ3/usxFCWzFo6WQmUoAEe/cWgxGSH3Z
 DPx50zWxds0r/V/YQWHXP1oMnDeOMMJUPHSZB2ie26gvdy+yPKSjdEn1d7/3rvUU301dl9wC9
 BFZ8IWE61MaseiYhr/3L4hvatItMp9MyoCVoLCIx9qQZSCTmZntg7tqU+ocj1QdmXQ1bVlBdC
 /jTDj995hzd9ZDyZT8kZRoLcOVI+TVy86Zrakng5NN49TkC57BcLl9HfT0i0A83eO5HV623rJ
 i2mZtf1Rchn71j3B0SjRzuroj+Qocj0QngWsksSRoY0XwVoIaJNwGP989MXux6k53THZZt3Ww
 vKR3O9UkaPoSkWQfhgWzDQkPK0YqlKG+PTz4kMyuVyXHAOT7YrNLErGuFr+TnK6bIutLn+lmc
 EHLjCOS7uw1vn1d5rmcR3groFcAYUrbGFhfiJ/sx2KjlJjwSRknnz9W/R7AQXEHaptednysbb
 uYMSylvsCDtAo+k3cMtDPyuR+KY0IYJQHhrrpq+M0ymNgrA19GIgrFc455r0Mf4N3TK1cN4AA
 hJjA8iaqX+Wn0SimMQe/6Xzmid0eBJqeiaqTqZRGHB4ZXlLgAqgeY2E21+8uMZ0sBEJ38hUX+
 dJA8eOgy6oh40rBPxM0Uwf9/ws66QYh+vLNCQ5rRH2RHjKJpPzsK4WoF/EX3N50bDGjOZSHjJ
 nay5hyxTDhWEfPQ4ooSz7ljCRI8=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Adrian,

On 6/14/23 15:07, John Paul Adrian Glaubitz wrote:
> I have created updated installation images for Debian Ports.
>
> These can be found here:
>
> - https://cdimage.debian.org/cdimage/ports/snapshots/2023-06-14/

Thanks a lot for providing those Debian-12 installation images!

If people want to try those with QEMU, please use at least QEMU version 8.
Furthermore, the SeaBIOS-hppa firmware v6 which comes with QEMU-8 has a bu=
g
and isn't able to boot the Debian-12 CD images.
Instead use qemu git head, or download this precompiled firmware:
http://backup.parisc-linux.org/qemu/hppa-firmware.img
and put it into the pc-bios directory (or in the directory where you run q=
emu).

Helge

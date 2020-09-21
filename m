Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61A2272925
	for <lists+linux-parisc@lfdr.de>; Mon, 21 Sep 2020 16:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgIUOwV (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Mon, 21 Sep 2020 10:52:21 -0400
Received: from mout.gmx.net ([212.227.17.22]:50609 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbgIUOwU (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Sep 2020 10:52:20 -0400
X-Greylist: delayed 312 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 10:52:18 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1600699937;
        bh=/tqt7AcYw/xj/BaE9mE3TD81wr4BRTn5Hzm6WcU2Qbg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=dzPTqh59DX3UqcYgtGlWODc4JhmSX1BtXO/13IRx92VbbDa/cZHdJunDjR/B2r4xV
         eJKP3813+5ZLNutkJ40VOTsaSgdGOVThEbS1mydNLVt6BcGdJoEGLEBioubQw7UPJD
         NbDZbGl8rEtsDEoEuSjQM6mr4gkXDAbMuYhuivpc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.178.91]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MStCY-1jtRkl3oFS-00UMPF; Mon, 21
 Sep 2020 16:46:49 +0200
Subject: Re: HPPA support for IGNITE-UX install discs
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Keith Monahan <keith@techtravels.org>,
        Sven Schnelle <svens@stackframe.org>
Cc:     qemu-discuss@nongnu.org, Richard Henderson <rth@twiddle.net>,
        linux-parisc <linux-parisc@vger.kernel.org>
References: <fad1bbcf-51c4-f381-87cf-23d5f9787df3@techtravels.org>
 <69e13e3a-f236-871c-0491-bb8d53c74a18@amsat.org>
From:   Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <d84eea18-3bd6-bda9-3e63-749a96e1ed94@gmx.de>
Date:   Mon, 21 Sep 2020 16:46:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <69e13e3a-f236-871c-0491-bb8d53c74a18@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DC9g5F0V8GOE5X6oFrktyM6+iYAUAxMWv33PcEXEo/maFvNAfTn
 zmRhgvdk8oMMr/0Uu9itnsclLmR3sIw+tfxnhMS9AuJIsJk9dwMnzoJ9Vp7BN4G70aCVoNf
 AEEvSKpVGvppCIimfotSFo9Jsyydpgyd4UDzMv2DmORgAColvW5F/cmOZRsr5lBrZiWbFD0
 CQ1Mx8KCXdDNABVPmcZ0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XpqOzDYis6Q=:MR0IDMfqq6bpkku7nYySXl
 76mPRss9Cr3Q79xqB0jyc/1E5+96QaekyaXqjUbp3PPmZbEKBAsQoebQYkBEZyO03WZCWL1z0
 Zw6BAG9Dd6NfSi71QHsUwaG7VDoLA3hL9Jrdv/77bfd9ZV3l7B9imwKniBESGYyVLVZqZbAqY
 0geq27QlVKuxD0N7Ki2XG3sDe4Af+AmBaSM+hJIL58SEU918R2R/ayoo/Pu0pE4x1FoCgsViG
 3hw1F9S0ojb0ybJz95hj3O+YsFUw3RCdxS4wAeAbHQqSKOJK569LHvm8Qn1JbrHjTjqZMi+xC
 Spn4MEY3GRRrUj8VJo9khtAvgz5JsY1qKuC51qSdzMgoEx+aAalOtXgDIJTjlEKWk3QQCmOKN
 mn4tj4cXEINMHIdfSocfnQzKbjVrgORYRJoubYhq1MbHpn3Q+JdVxZW8jaz6YtNsM9sW/QY4G
 OVPK9z3tEovj6J8mbA9NBR6eXqkTQFCEnmAratRHmJ3UzO8v0YIr45pUgbY+/Fqhw4LNIayLQ
 dg4TMyUjj3e+YjnPli62ip+RxaBnbOPYIFz2INrwgZwst5P1Dbk99f1tvE0T6MUbwq25aDHOc
 lIv8ShglBlWFOVe89JL6yfDk/w3zze4UuslrqeVkL7+cN8t2hOsCbQb1B+KEXUE4M68arYyd2
 875HosrHZFPJGGao6yGj8m3nDpVzEXPcj/fX+1PP0k5nPXJJpjTz7Wj+VdM6lcFedUBrf++ks
 0X1Ofq+r2jdA1P97IfjnJTIdlB/FL2wAGeHkDKTYJe6U9ikqfGWEiWafhHFSEElAQfGLC7mKV
 Etz6SZcC5SUclV8TQzoay6VNC9k7fmSZMjvUj97gZWEHLRPaVaPLIHrNjELiJDAxB9tKivhmx
 Ulemx7WWQxcWTp36P2LZ0OqV6bgtl5huPNYlSAHIxMcq2j+N1M5BJ/PZMVOQsmgZXEsU8RJ2G
 dfWX+oxNNpAYVkJKg9MV4cWfZFsPUv1yckNW9ZjImHWKgFi+AyIohaAkkFkgvB+XuPxvfyHrd
 94VnwaIKvLGR4DlnpumyKXNzGaI/Qij3NI49ndpxSKL9xz7bmMR/OhongVm75jXlgKix19a4Z
 nL2VJB8+Kuexpvi6emXbnsxWdpkmt9VQguAVRFQOIfH1Mgq4mbNDW8rwLCGQCflnsuQKxwDz8
 8MaLkoqfd6EqW8WpPg1IBcTlebPz6sOdmtpbjWlXVi0VPI4SirWTj+TWyfFP6YOk7lJC64yXA
 qQRCFr2vN4ujD/u37
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 21.09.20 05:41, Philippe Mathieu-Daud=C3=A9 wrote:
> Cc'ing the HPPA team.

CC'ing parisc linux development list.

> On 9/20/20 9:42 PM, Keith Monahan via wrote:
>> HI there,
>>
>> In QEMU 5.1.50 (also tried 4.2.1) built from source, I have a particula=
r
>> IGNITE-UX disk associated with an HP Logic Analyzer 16700A that I'm
>> trying to boot and install. It's based on HP-UX 10.20. The regular LA
>> hardware shows up via uname as "HP-UX no_hostn B.10.20 C 9000/779
>> 2008038539 32-user license" I've seen reference to 9000/779/rock. This
>> should be fairly similar to the B132L/B160L.

The 9000/779 seems to be like an RDI PrecisionBook:
https://www.openpa.net/systems/rdi_precisionbook.html
which is quite similiar to a B160L.

There is even an entry for your logic analyzer:
https://www.openpa.net/systems/hp_16600_16700_logic_agilent.html

>> While SeaBIOS identifies the attached virtual drive, and the specified
>> CDROM boots, the install init script fails to find any IO devices, and
>> so no installation can occur.
>>
>> Other HP-UX 10.20 Ignite-UX disks work without issue in the same qemu
>> environment with the same command line options.
>>
>> A successful run has the "Scanning system for IO devices..." take a few
>> seconds, followed by a "Querying disk device" message for each of the
>> devices it sees. That whole process takes 30 seconds or so in emulation=
.
>>
>> A bad run immediately goes from "Scanning system..." to "There were no
>> disk devices found during the scan."
>>
>> I have noticed that the "install/init" Revision on one that works is a
>> 10.3, but the failing one is 10.124. Not sure if this telltale or not.
>>
>> Anyone super familiar with this type of install disk? Or how the boot
>> process works with HP-UX CDs in general? What gets loaded first? How ca=
n
>> I find this script and/or executable that's evaluating the readiness of
>> the drives? My thoughts are that I could "update" via editing the ISO,
>> which both mount easily in Linux.

In qemu the B160L emulation isn't complete yet.
The SCSI disc is emulated by a "virtual built-in" PCI SCSI card, while
the original B160L has a NCR 53C710 SCSI chip internal in the LASI control=
ler.
Additionally the LASI emulation isn't complete either.
My assumption is, that your Install CD for the analyzer will only detect
real LASI/53C710 chips and ignore the virtual PCI card. That's why it does=
n't
detect any discs.

>> But I'm open to thoughts, including redirection to a different more
>> appropriate mailing list! :)
>>
>> Thanks for any general advice.
>> Keith
>>
>>
>> I'm invoking like this:
>>
>> ./qemu-system-hppa -boot d -serial mon:stdio -drive
>> if=3Dscsi,bus=3D0,index=3D6,file=3D./hpux.img,format=3Draw -D /tmp/foo =
-nographic
>> -m 512 -d nochain -cdrom ./HP16700_cdrom.iso -net nic,model=3Dtulip=C2=
=A0 -net tap

You could drop the "nochain", it slows things down.
Without "nographic" the STI framebuffer might work.

>> and see this:
>>
>> =C2=A0 Primary boot path:=C2=A0=C2=A0=C2=A0 FWSCSI.6.0
>> =C2=A0 Alternate boot path:=C2=A0 FWSCSI.2.0

both are on the virtual PCI card...

>> =C2=A0 Console path:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SE=
RIAL_1.9600.8.none
>> =C2=A0 Keyboard path:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PS2
>>
>> Available boot devices:
>> 1. DVD/CD [lsi 00:00.0 2:0 Drive QEMU QEMU CD-ROM 2.5+]
>> 2. lsi 00:00.0 6:0 Drive QEMU QEMU HARDDISK 2.5+
>>
>> Booting from DVD/CD [lsi 00:00.0 2:0 Drive QEMU QEMU CD-ROM 2.5+]
>>
>> Booting...
>> Boot IO Dependent Code (IODC) revision 153
>>
>> HARD Booted.
>>
>> ISL Revision A.00.38=C2=A0 OCT 26, 1994
>>
>> ISL booting=C2=A0 hpux (;0):INSTALL
>>
>> Boot
>> : disc(8/0/0/0.2.0;0):INSTALL
>> 4999156 + 446464 + 361504 start 0x184268
>> No BTLB entries found for processor 0
>> vuseg=3D1a5a000
>>
>> =C2=A0=C2=A0=C2=A0 System Console is on the Built-In Serial Interface
>> Networking memory for fragment reassembly is restricted to 49061888 byt=
es
>> =C2=A0=C2=A0=C2=A0 Swap device table:=C2=A0 (start & size given in 512-=
byte blocks)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entry 0 - auto-configured on=
 root device; ignored - no room
>> WARNING: No dump device configured.=C2=A0 Dump is disabled.
>> Starting the STREAMS daemons.
>> =C2=A0=C2=A0=C2=A0 9245XB HP-UX (B.10.20) #1: Sun Jun=C2=A0 9 06:31:19 =
PDT 1996
>>
>> Memory Information:
>> =C2=A0=C2=A0=C2=A0 physical page size =3D 4096 bytes, logical page size=
 =3D 4096 bytes
>> =C2=A0=C2=A0=C2=A0 Physical: 524288 Kbytes, lockable: 404768 Kbytes, av=
ailable: 465588
>> Kbytes
>>
>> =3D=3D=3D=3D=3D=3D=3D=C2=A0 09/19/20 16:01:14 EDT=C2=A0 HP-UX Installat=
ion Initialization. (Sat
>> Sep 19
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 16:01:14 EDT 2020)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @(#) Ignite-UX Revisio=
n 1.32
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @(#) install/init (opt=
) $Revision: 10.124 $
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * EISA configuration has completed=
.=C2=A0 Following the completion of a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 successful HP-UX insta=
llation, please check the
>> "/etc/eisa/config.err"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file for any EISA conf=
iguration messages.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Scanning system for IO devices..=
.
>> NOTE:=C2=A0=C2=A0=C2=A0 There were no disk devices found during the sca=
n.=C2=A0 Make sure
>> that the
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destination disks are =
connected and powered on.=C2=A0 You may choose to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scan for more disk dri=
ves from next menu on the console.
>> WARNING: Could not verify access to LAN interface: 8/0/1/0
>> ERROR:=C2=A0=C2=A0 could not find source device 8/0/0/0 in ioscan outpu=
t

That's strange.... I think 8/... might be LASI.

>> Would you like to switch source to network? (y/[n]): y
>>
>>
>> Hardware Summary:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Syste=
m Model: 9000/778/B160L
>> =C2=A0 +---------------------+----------------+-------------------+ [ S=
can
>> Again=C2=A0 ]
>> =C2=A0 | Disks: 0=C2=A0 (=C2=A0 0.0GB) |=C2=A0 Floppies: 0=C2=A0=C2=A0 =
| LAN cards:=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0 |
>> =C2=A0 | CDs:=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Tapes:=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0 | =
Memory:=C2=A0=C2=A0=C2=A0 512Mb=C2=A0 |
>> =C2=A0 | Graphics Ports: 0=C2=A0=C2=A0 |=C2=A0 IO Buses: 1=C2=A0=C2=A0 =
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | [ H/W
>> Details ]
>> =C2=A0 +---------------------+----------------+-------------------+

I'm not an HP-UX expert.
Maybe it's possible to install HP-UX from another install CD and
install the Analyzer packages afterwards?

Helge

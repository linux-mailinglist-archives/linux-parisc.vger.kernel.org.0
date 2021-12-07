Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9EF46C6EB
	for <lists+linux-parisc@lfdr.de>; Tue,  7 Dec 2021 22:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbhLGVvM (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 7 Dec 2021 16:51:12 -0500
Received: from mta-tor-004.bell.net ([209.71.212.31]:17746 "EHLO
        cmx-torrgo002.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230374AbhLGVvL (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 Dec 2021 16:51:11 -0500
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [67.71.8.137]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6197648701B0ACF0
X-CM-Envelope: MS4xfJ4CiEUgTlYzUigb1i5h3EWK3ZISVEwdKsyGBzUPShBk9yinvB2P0XBga89GH3NaY7ThhghGwo3eB6FOvULAaju+68zrHKEShBjTrhSfZL99KM/fENog
 UNrOqps90w6uyfis3WstCRquvkAO8eWDRcnlcwjR6huB8pYAD8ly1aTJoi+mZWwHtIC/uphMXKQ16cF3VUfcqGTULPdZ/aMI2/nKtf+YXZj8YtIVIyId76LS
 YCszdt9oB48wSkaja9ZEydk9/3DiezuS+o0kz36R2Xw=
X-CM-Analysis: v=2.4 cv=W7Vb6Tak c=1 sm=1 tr=0 ts=61afd67b
 a=jrdA9tB8yuRqUzQ1EpSZjA==:117 a=jrdA9tB8yuRqUzQ1EpSZjA==:17
 a=r77TgQKjGQsHNAKrUKIA:9 a=mDV3o1hIAAAA:8 a=FBHGMhGWAAAA:8
 a=n6xlndhtZGby_Ol8FBgA:9 a=QEXdDO2ut3YA:10 a=dI9p-avQWAUA:10
 a=8BsbkpV6Gsh8xm3qT-AA:9 a=JMNH9X61SiQA:10 a=_FVE-zBwftR9WsbkzFJk:22
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (67.71.8.137) by cmx-torrgo002.bell.net (5.8.716.03) (authenticated as dave.anglin@bell.net)
        id 6197648701B0ACF0; Tue, 7 Dec 2021 16:47:39 -0500
Content-Type: multipart/mixed; boundary="------------SAWXWsZKt7EHnGo9ZsjObI8p"
Message-ID: <c58ea7e4-f0df-3840-478e-0c3459aa4318@bell.net>
Date:   Tue, 7 Dec 2021 16:47:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     deller@kernel.org
From:   John David Anglin <dave.anglin@bell.net>
Subject: glibc tst-minsigstksz-5 failure
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a multi-part message in MIME format.
--------------SAWXWsZKt7EHnGo9ZsjObI8p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The glibc tst-minsigstksz-5 test fails with a protection id trap.
tst-minsigstksz (pid 19958): Protection id trap (code 7) at 00000000f5b00497

The problem seems to be that the signal return trampoline is placed on the alternate stack
but the alternate is not executable.  It is allocated by malloc.

dave@mx3210:~/gnu/glibc/objdir$ gdb tst-minsigstksz-5                           GNU gdb (Debian 10.1-2) 10.1.90.20210103-git
Copyright (C) 2021 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type "show copying" and "show warranty" for details.
This GDB was configured as "hppa-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
     <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from tst-minsigstksz-5...
(gdb) break handler
Breakpoint 1 at 0x1079c: file tst-minsigstksz-5.c, line 43.
(gdb) r
Starting program: /home/dave/gnu/glibc/objdir/tst-minsigstksz-5

Program received signal SIGUSR1, User defined signal 1.
getpid () at ../sysdeps/unix/syscall-template.S:91
91      ../sysdeps/unix/syscall-template.S: No such file or directory.
(gdb) c
Continuing.

Breakpoint 1, handler (signo=16) at tst-minsigstksz-5.c:43
warning: Source file is more recent than executable.
43
(gdb) p/x $sp
$1 = 0xf5b00900
(gdb) p/x $rp
$2 = 0xf5b00494
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
<signal handler called>
(gdb) disass $pc-16,$pc+16
Dump of assembler code from 0xf5b00484 to 0xf5b004a4:
    0xf5b00484:  movib,>= 6,r6,0xf5b01af0
    0xf5b00488:  movib,>= 6,r6,0xf5b01af4
    0xf5b0048c:  movib,>= 6,r6,0xf5b01af8
    0xf5b00490:  movib,>= 6,r6,0xf5b01afc
=> 0xf5b00494:  ldi 1,r25
    0xf5b00498:  ldi ad,r20
    0xf5b0049c:  be,l 100(sr2,r0),sr0,r31
    0xf5b004a0:  nop
End of assembler dump.

tst-minsigstksz (pid 8032): Protection id trap (code 7) at 00000000f5b00497

dave@mx3210:/proc/8032$ cat maps
00010000-00012000 r-xp 00000000 08:11 6958050                            /home/dave/gnu/glibc/objdir/tst-minsigstksz-5
00012000-00013000 rwxp 00002000 08:11 6958050                            /home/dave/gnu/glibc/objdir/tst-minsigstksz-5
00013000-00034000 rwxp 00000000 00:00 0                                  [heap]
f3b00000-f7b01000 rw-p 00000000 00:00 0
f7b01000-f7b23000 rwxp 00000000 00:00 0                                  [stack]
f90b8000-f9239000 r-xp 00000000 08:25 38369008                           /lib/hppa-linux-gnu/libc-2.32.so
f9239000-f923b000 r--p 00181000 08:25 38369008                           /lib/hppa-linux-gnu/libc-2.32.so
f923b000-f9240000 rwxp 00183000 08:25 38369008                           /lib/hppa-linux-gnu/libc-2.32.so
f9240000-f9242000 rwxp 00000000 00:00 0
f98b8000-f98e2000 r-xp 00000000 08:25 38368971                           /lib/hppa-linux-gnu/ld-2.32.so
f98e2000-f98e3000 r--p 0002a000 08:25 38368971                           /lib/hppa-linux-gnu/ld-2.32.so
f98e3000-f98e7000 rwxp 0002b000 08:25 38368971                           /lib/hppa-linux-gnu/ld-2.32.so
f9afb000-f9b00000 rw-p 00000000 00:00 0

Stacks are normally executable on hppa so the trampoline works.  But user code wouldn't normally make an alternate
stack executable.

Dave
-- 
John David Anglin  dave.anglin@bell.net
--------------SAWXWsZKt7EHnGo9ZsjObI8p
Content-Type: text/plain; charset=UTF-8; name="tst-minsigstksz-5.c"
Content-Disposition: attachment; filename="tst-minsigstksz-5.c"
Content-Transfer-Encoding: base64

LyogVGVzdCBvZiBzaWduYWwgZGVsaXZlcnkgb24gYW4gYWx0ZXJuYXRlIHN0YWNrIHdpdGgg
TUlOU0lHU1RLU1ogc2l6ZS4KICAgQ29weXJpZ2h0IChDKSAyMDIwIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbiwgSW5jLgogICBUaGlzIGZpbGUgaXMgcGFydCBvZiB0aGUgR05VIEMgTGli
cmFyeS4KCiAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCiAgIExpY2Vuc2UgYXMgcHVibGlzaGVk
IGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlcgogICB2ZXJzaW9uIDIu
MSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lv
bi4KCiAgIFRoZSBHTlUgQyBMaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCiAgIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiAgIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCiAgIExl
c3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCgogICBZb3Ug
c2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwg
UHVibGljCiAgIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeTsgaWYgbm90
LCBzZWUKICAgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4gICovCgojaW5jbHVk
ZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0cmluZy5oPgoj
aW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8ZXJybm8u
aD4KCiNkZWZpbmUgRkFJTF9SRVQocywuLi4pIFwKICBkbyB7IFwKICAgIHByaW50ZiAocywg
ZXJybm8pOyBcCiAgICByZXR1cm4gMTsgXAogIH0gd2hpbGUgKDApCgpzdGF0aWMgdm9sYXRp
bGUgc2lnX2F0b21pY190IGhhbmRsZXJfcnVuOwoKc3RhdGljIHZvaWQKaGFuZGxlciAoaW50
IHNpZ25vKQp7CiAgLyogQ2xlYXIgYSBiaXQgb2Ygb24tc3RhY2sgbWVtb3J5LiAgKi8KICB2
b2xhdGlsZSBjaGFyIGJ1ZmZlclsyNTZdOwogIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgc2l6
ZW9mIChidWZmZXIpOyArK2kpCiAgICBidWZmZXJbaV0gPSAwOwogIGhhbmRsZXJfcnVuID0g
MTsKfQoKaW50CmRvX3Rlc3QgKHZvaWQpCnsKICBzaXplX3Qgc3RhY2tfYnVmZmVyX3NpemUg
PSA2NCAqIDEwMjQgKiAxMDI0OwogIHZvaWQgKnN0YWNrX2J1ZmZlciA9IG1hbGxvYyAoc3Rh
Y2tfYnVmZmVyX3NpemUpOwogIHZvaWQgKnN0YWNrX2VuZCA9IHN0YWNrX2J1ZmZlciArIHN0
YWNrX2J1ZmZlcl9zaXplOwogIG1lbXNldCAoc3RhY2tfYnVmZmVyLCAweENDLCBzdGFja19i
dWZmZXJfc2l6ZSk7CgogIHZvaWQgKnN0YWNrX2JvdHRvbSA9IHN0YWNrX2J1ZmZlciArIChz
dGFja19idWZmZXJfc2l6ZSArIE1JTlNJR1NUS1NaKSAvIDI7CiAgdm9pZCAqc3RhY2tfdG9w
ID0gc3RhY2tfYm90dG9tICsgTUlOU0lHU1RLU1o7CiAgc3RhY2tfdCBzdGFjayA9CiAgICB7
CiAgICAgIC5zc19zcCA9IHN0YWNrX2JvdHRvbSwKICAgICAgLnNzX3NpemUgPSBNSU5TSUdT
VEtTWiwKICAgIH07CiAgaWYgKHNpZ2FsdHN0YWNrICgmc3RhY2ssIE5VTEwpIDwgMCkKICAg
IEZBSUxfUkVUICgic2lnYWx0c3RhY2s6ICVtXG4iKTsKCiAgc3RydWN0IHNpZ2FjdGlvbiBh
Y3QgPQogICAgewogICAgICAuc2FfaGFuZGxlciA9IGhhbmRsZXIsCiAgICAgIC5zYV9mbGFn
cyA9IFNBX09OU1RBQ0ssCiAgICB9OwogIGlmIChzaWdhY3Rpb24gKFNJR1VTUjEsICZhY3Qs
IE5VTEwpIDwgMCkKICAgIEZBSUxfUkVUICgic2lnYWN0aW9uOiAlbVxuIik7CgogIGlmIChr
aWxsIChnZXRwaWQgKCksIFNJR1VTUjEpIDwgMCkKICAgIEZBSUxfUkVUICgia2lsbDogJW1c
biIpOwoKICBpZiAoaGFuZGxlcl9ydW4gIT0gMSkKICAgIEZBSUxfUkVUICgiaGFuZGxlciBk
aWQgbm90IHJ1blxuIik7CgogIGZvciAodm9pZCAqcCA9IHN0YWNrX2J1ZmZlcjsgcCA8IHN0
YWNrX2JvdHRvbTsgKytwKQogICAgaWYgKCoodW5zaWduZWQgY2hhciAqKSBwICE9IDB4Q0Mp
CiAgICAgIEZBSUxfUkVUICgiY2hhbmdlZCBieXRlICVsZCBieXRlcyBiZWxvdyBjb25maWd1
cmVkIHN0YWNrXG4iLAoJCShsb25nKSAoc3RhY2tfYm90dG9tIC0gcCkpOwogIGZvciAodm9p
ZCAqcCA9IHN0YWNrX3RvcDsgcCA8IHN0YWNrX2VuZDsgKytwKQogICAgaWYgKCoodW5zaWdu
ZWQgY2hhciAqKSBwICE9IDB4Q0MpCiAgICAgIEZBSUxfUkVUICgiY2hhbmdlZCBieXRlICVs
ZCBieXRlcyBhYm92ZSBjb25maWd1cmVkIHN0YWNrXG4iLAoJCShsb25nKSAocCAtIHN0YWNr
X3RvcCkpOwoKICBmcmVlIChzdGFja19idWZmZXIpOwoKICByZXR1cm4gMDsKfQoKaW50Cm1h
aW4gKHZvaWQpCnsKICByZXR1cm4gZG9fdGVzdCgpOwp9Cg==
--------------SAWXWsZKt7EHnGo9ZsjObI8p--


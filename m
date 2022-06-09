Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2E0544E40
	for <lists+linux-parisc@lfdr.de>; Thu,  9 Jun 2022 15:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240077AbiFIN6A (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 9 Jun 2022 09:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbiFIN6A (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 9 Jun 2022 09:58:00 -0400
Received: from cmx-mtlrgo002.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BCAAA294230
        for <linux-parisc@vger.kernel.org>; Thu,  9 Jun 2022 06:57:58 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [64.229.209.22]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6296A35D01B23F16
X-CM-Envelope: MS4xfHVzWijdYtHsMeL5jATXBJJiKUOmQrMeV7IPbdnoRCBcTNJusGusyWkU5d0tQa9W2Cq1hGJhSjUTSYZXSAKRbiMzhyba2eFaoNnaWj6Cp0RsXpNaLKWH
 Cd1YpW/nLqsRKjqFEyZXp25gdrPfV5CaMZx092vyVoKc7WECXkio3njm4GfUhcsjcNYCey0+Mcm3qhhw4785xB6Jzbrmaxxo6exUOmulxVg/BatyvRY1Dulr
 ovuq3H6cvDEKHlgptEtmRA==
X-CM-Analysis: v=2.4 cv=FMx4e8ks c=1 sm=1 tr=0 ts=62a1fc65
 a=PzUcMIm+zPr1bDMlhKZIxQ==:117 a=PzUcMIm+zPr1bDMlhKZIxQ==:17
 a=IkcTkHD0fZMA:10 a=FBHGMhGWAAAA:8 a=KNLZY90truYCj1tRHzsA:9 a=QEXdDO2ut3YA:10
 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (64.229.209.22) by cmx-mtlrgo002.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6296A35D01B23F16; Thu, 9 Jun 2022 09:57:57 -0400
Message-ID: <95019848-fc76-aa99-b37d-04b353e05e2b@bell.net>
Date:   Thu, 9 Jun 2022 09:57:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     linux-parisc <linux-parisc@vger.kernel.org>
From:   John David Anglin <dave.anglin@bell.net>
Subject: glibc fails with 5.18.2-32bit+ kernel on c3750
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I ran a build and check of glibc master (commit 0218463dd8265ed937622f88ac68c7d984fe0cfc)
with 5.18.2-64bit+ and 5.18.2-32bit+ kernels on c3750.

The results with the 64bit kernel were as expected:

FAIL: dirent/tst-readdir64-compat
UNSUPPORTED: elf/tst-valgrind-smoke
UNSUPPORTED: misc/tst-adjtimex
UNSUPPORTED: misc/tst-adjtimex-time64
UNSUPPORTED: misc/tst-clock_adjtime
UNSUPPORTED: misc/tst-clock_adjtime-time64
UNSUPPORTED: misc/tst-ntp_adjtime
UNSUPPORTED: misc/tst-ntp_adjtime-time64
UNSUPPORTED: misc/tst-pkey
UNSUPPORTED: misc/tst-rseq
UNSUPPORTED: misc/tst-rseq-disable
UNSUPPORTED: nptl/test-cond-printers
UNSUPPORTED: nptl/test-condattr-printers
UNSUPPORTED: nptl/test-mutex-printers
UNSUPPORTED: nptl/test-mutexattr-printers
UNSUPPORTED: nptl/test-rwlock-printers
UNSUPPORTED: nptl/test-rwlockattr-printers
UNSUPPORTED: nptl/tst-rseq-nptl
UNSUPPORTED: posix/tst-sysconf-empty-chroot
UNSUPPORTED: stdlib/test-bz22786
UNSUPPORTED: stdlib/tst-strtod-overflow
UNSUPPORTED: string/tst-memmove-overflow
UNSUPPORTED: time/tst-clock_settime
UNSUPPORTED: time/tst-clock_settime-time64
UNSUPPORTED: time/tst-settimeofday
UNSUPPORTED: time/tst-settimeofday-time64
UNSUPPORTED: time/tst-y2039
Summary of test results:
       1 FAIL
    4328 PASS
      26 UNSUPPORTED
      20 XFAIL
26682.70user 9315.40system 10:50:29elapsed 92%CPU (0avgtext+0avgdata 836428maxresident)k
1523568inputs+5082320outputs (30130major+82857374minor)pagefaults 0swaps

However, there are a bunch of unexpected fails with the 32bit kernel:

FAIL: debug/tst-backtrace4
FAIL: debug/tst-backtrace5
FAIL: debug/tst-backtrace6
FAIL: dirent/tst-readdir64-compat
UNSUPPORTED: elf/tst-dlopen-self-container
UNSUPPORTED: elf/tst-dlopen-tlsmodid-container
UNSUPPORTED: elf/tst-glibc-hwcaps-prepend-cache
UNSUPPORTED: elf/tst-ldconfig-bad-aux-cache
UNSUPPORTED: elf/tst-ldconfig-ld_so_conf-update
UNSUPPORTED: elf/tst-pldd
UNSUPPORTED: elf/tst-preload-pthread-libc
UNSUPPORTED: elf/tst-valgrind-smoke
UNSUPPORTED: grp/tst-initgroups1
UNSUPPORTED: grp/tst-initgroups2
UNSUPPORTED: io/tst-getcwd-abspath
UNSUPPORTED: io/tst-getcwd-smallbuff
UNSUPPORTED: locale/tst-localedef-path-norm
UNSUPPORTED: localedata/tst-localedef-hardlinks
FAIL: malloc/tst-mallocfork3-mcheck
UNSUPPORTED: misc/tst-adjtimex
UNSUPPORTED: misc/tst-adjtimex-time64
UNSUPPORTED: misc/tst-clock_adjtime
UNSUPPORTED: misc/tst-clock_adjtime-time64
UNSUPPORTED: misc/tst-ntp_adjtime
UNSUPPORTED: misc/tst-ntp_adjtime-time64
UNSUPPORTED: misc/tst-pkey
UNSUPPORTED: misc/tst-rseq
UNSUPPORTED: misc/tst-rseq-disable
FAIL: misc/tst-sigcontext-get_pc
UNSUPPORTED: misc/tst-syslog
UNSUPPORTED: misc/tst-ttyname
UNSUPPORTED: nptl/test-cond-printers
UNSUPPORTED: nptl/test-condattr-printers
UNSUPPORTED: nptl/test-mutex-printers
UNSUPPORTED: nptl/test-mutexattr-printers
UNSUPPORTED: nptl/test-rwlock-printers
UNSUPPORTED: nptl/test-rwlockattr-printers
FAIL: nptl/tst-atfork4
FAIL: nptl/tst-cancel24
FAIL: nptl/tst-cancel24-static
FAIL: nptl/tst-cancelx16
FAIL: nptl/tst-cancelx17
FAIL: nptl/tst-cancelx18
FAIL: nptl/tst-cancelx20
FAIL: nptl/tst-cancelx21
FAIL: nptl/tst-cancelx4
FAIL: nptl/tst-cancelx5
FAIL: nptl/tst-cleanupx4
FAIL: nptl/tst-oncex3
FAIL: nptl/tst-oncex4
UNSUPPORTED: nptl/tst-pthread-getattr
UNSUPPORTED: nptl/tst-rseq-nptl
UNSUPPORTED: nss/tst-nss-compat1
UNSUPPORTED: nss/tst-nss-db-endgrent
UNSUPPORTED: nss/tst-nss-db-endpwent
UNSUPPORTED: nss/tst-nss-files-alias-leak
UNSUPPORTED: nss/tst-nss-files-alias-truncated
UNSUPPORTED: nss/tst-nss-files-hosts-erange
UNSUPPORTED: nss/tst-nss-files-hosts-getent
UNSUPPORTED: nss/tst-nss-files-hosts-long
UNSUPPORTED: nss/tst-nss-files-hosts-multi
UNSUPPORTED: nss/tst-nss-gai-actions
UNSUPPORTED: nss/tst-nss-test3
UNSUPPORTED: nss/tst-reload1
UNSUPPORTED: nss/tst-reload2
UNSUPPORTED: posix/bug-ga2
UNSUPPORTED: posix/bug-ga2-mem
UNSUPPORTED: posix/tst-sysconf-empty-chroot
UNSUPPORTED: posix/tst-vfork3
UNSUPPORTED: posix/tst-vfork3-mem
UNSUPPORTED: resolv/mtrace-tst-leaks2
UNSUPPORTED: resolv/tst-leaks2
UNSUPPORTED: resolv/tst-resolv-res_init
UNSUPPORTED: resolv/tst-resolv-res_init-thread
UNSUPPORTED: resolv/tst-resolv-threads
FAIL: rt/tst-mqueue8x
UNSUPPORTED: stdlib/test-bz22786
UNSUPPORTED: stdlib/tst-strtod-overflow
UNSUPPORTED: stdlib/tst-system
UNSUPPORTED: string/tst-memmove-overflow
UNSUPPORTED: string/tst-strerror
UNSUPPORTED: string/tst-strsignal
UNSUPPORTED: sunrpc/tst-svc_register
UNSUPPORTED: time/tst-clock_settime
UNSUPPORTED: time/tst-clock_settime-time64
UNSUPPORTED: time/tst-settimeofday
UNSUPPORTED: time/tst-settimeofday-time64
UNSUPPORTED: time/tst-y2039
Summary of test results:
      20 FAIL
    4267 PASS
      68 UNSUPPORTED
      20 XFAIL
26600.80user 6639.75system 14:07:38elapsed 65%CPU (0avgtext+0avgdata 837956maxresident)k
0inputs+0outputs (37599major+80538657minor)pagefaults 0swaps

It appears there is a problem with the vdso exception support with the 32bit kernel:

$ cat nptl/tst-cancel24.out
exception not caught

There are also more unsupported tests with 32bit kernel.

Dave

-- 
John David Anglin  dave.anglin@bell.net


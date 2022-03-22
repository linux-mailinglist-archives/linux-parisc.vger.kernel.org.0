Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CCC4E480D
	for <lists+linux-parisc@lfdr.de>; Tue, 22 Mar 2022 22:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbiCVVGW (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 22 Mar 2022 17:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiCVVGV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 22 Mar 2022 17:06:21 -0400
Received: from cmx-mtlrgo001.bell.net (mta-mtl-003.bell.net [209.71.208.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 605F139804
        for <linux-parisc@vger.kernel.org>; Tue, 22 Mar 2022 14:04:53 -0700 (PDT)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-Originating-IP: [70.50.7.94]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 6238C363001C4DDF
X-CM-Envelope: MS4xfP1BOBMcX/B8laQJiHYlyadhwXQAgGhS4p34IFh1hoz+FZF51pUQnfEaroD9unohTtC6W5Evs8Cxpafz/+xeLz77laixMnX4RzTdKfaBj5aNILtcoLmX
 iJkeqgVRcT/hNY6daxhiC1/WQHNwnI+/hA/7u0bxNeCjUl7J6sRcH8xv+8QlygHUzdja0JffrNDlxGOG6XjLtC4Ara5Iw5vwlowvgJXQlG3JnbZY16FjGHOq
 14FxKqpvrZiHHe2tugnHhqaD5BnV4mTRwKBaxWcvLs6w3nlxnAGzVCwfbBjgWGttcPOvDdGRJE+Ol3EE6qKzqQ==
X-CM-Analysis: v=2.4 cv=YYreWydf c=1 sm=1 tr=0 ts=623a39f0
 a=9k1bCY7nR7m1ZFzoCuQ56g==:117 a=9k1bCY7nR7m1ZFzoCuQ56g==:17
 a=r77TgQKjGQsHNAKrUKIA:9 a=FBHGMhGWAAAA:8 a=t5DttLsFM1BjXEjqeSQA:9
 a=QEXdDO2ut3YA:10 a=fKR227dseSlTr2TUCuAA:9 a=De_Ol2h6w80A:10
 a=1d9taX949Dl2REJ9ZAYA:9 a=9gvnlMMaQFpL9xblJ6ne:22
Received: from [192.168.2.49] (70.50.7.94) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as dave.anglin@bell.net)
        id 6238C363001C4DDF; Tue, 22 Mar 2022 17:04:48 -0400
Content-Type: multipart/mixed; boundary="------------iN6xcanfwzcP03Oj6rtqf3ev"
Message-ID: <1f0d062d-2168-c1b7-f5be-f018aa79927d@bell.net>
Date:   Tue, 22 Mar 2022 17:04:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Recurring INEQUIVALENT ALIASES issues and userland
 corruption/crashes
Content-Language: en-US
To:     Sam James <sam@gentoo.org>, Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org, hppa@gentoo.org
References: <63DA313A-FCE1-4535-9BF3-11E36B2DE422@gentoo.org>
 <b84f1c67-eea7-f07a-0163-6e06b0f5f650@bell.net>
 <309C1399-6AA2-44BD-8EB9-FDB66F5D972E@gentoo.org>
 <a8756bee-e149-c03c-36cd-6842eb12d2de@gmx.de>
 <FBC408F2-F3D7-4148-8006-DC6189DC78CB@gentoo.org>
From:   John David Anglin <dave.anglin@bell.net>
In-Reply-To: <FBC408F2-F3D7-4148-8006-DC6189DC78CB@gentoo.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

This is a multi-part message in MIME format.
--------------iN6xcanfwzcP03Oj6rtqf3ev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2022-03-22 4:42 p.m., Sam James wrote:
>> I suspected that as well, because I had the impression we still carry a patch in
>> debian's glibc. But I checked debian glibc sources again, and I think all such
>> relevant patches are now upstreamed.
> Yeah, I had a rough look at Debian's toolchain bits and didn't see any patches
> which might be relevant. But of course I could have missed something as I'm
> not super familiar with Debian's development processes etc.
There two patches in debian's glibc for hppa.  I'm not familiar with history of the local-inlining.diff
patch.  I don't test with it.  Thus I think it can be removed.

The other relates to NONBLOCK defines.  O_NONBLOCK warns have come back with 2.33, so this
needs looking at.  For example,

acngtool(8325) uses a deprecated O_NONBLOCK value. Please recompile with newer glibc.

Dave

-- 
John David Anglin  dave.anglin@bell.net

--------------iN6xcanfwzcP03Oj6rtqf3ev
Content-Type: text/plain; charset=UTF-8; name="git-fcntl.h-update.diff"
Content-Disposition: attachment; filename="git-fcntl.h-update.diff"
Content-Transfer-Encoding: base64

SW5kZXg6IGdsaWJjLTIuMzEvc3lzZGVwcy91bml4L3N5c3YvbGludXgvaHBwYS9iaXRzL2V2
ZW50ZmQuaAo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Ci0tLSBnbGliYy0yLjMxLm9yaWcvc3lzZGVwcy91bml4
L3N5c3YvbGludXgvaHBwYS9iaXRzL2V2ZW50ZmQuaAorKysgZ2xpYmMtMi4zMS9zeXNkZXBz
L3VuaXgvc3lzdi9saW51eC9ocHBhL2JpdHMvZXZlbnRmZC5oCkBAIC0yNiw2ICsyNiw2IEBA
IGVudW0KICNkZWZpbmUgRUZEX1NFTUFQSE9SRSBFRkRfU0VNQVBIT1JFCiAgICAgRUZEX0NM
T0VYRUMgPSAwMTAwMDAwMDAsCiAjZGVmaW5lIEVGRF9DTE9FWEVDIEVGRF9DTE9FWEVDCi0g
ICAgRUZEX05PTkJMT0NLID0gMDAyMDAwMDQgLyogSFBVWCBoYXMgc2VwYXJhdGUgTkRFTEFZ
ICYgTk9OQkxPQ0sgKi8KKyAgICBFRkRfTk9OQkxPQ0sgPSAwMDIwMDAwMAogI2RlZmluZSBF
RkRfTk9OQkxPQ0sgRUZEX05PTkJMT0NLCiAgIH07CkluZGV4OiBnbGliYy0yLjMxL3N5c2Rl
cHMvdW5peC9zeXN2L2xpbnV4L2hwcGEvYml0cy9pbm90aWZ5LmgKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQot
LS0gZ2xpYmMtMi4zMS5vcmlnL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L2hwcGEvYml0cy9p
bm90aWZ5LmgKKysrIGdsaWJjLTIuMzEvc3lzZGVwcy91bml4L3N5c3YvbGludXgvaHBwYS9i
aXRzL2lub3RpZnkuaApAQCAtMjQsNiArMjQsNiBAQCBlbnVtCiAgIHsKICAgICBJTl9DTE9F
WEVDID0gMDEwMDAwMDAwLAogI2RlZmluZSBJTl9DTE9FWEVDIElOX0NMT0VYRUMKLSAgICBJ
Tl9OT05CTE9DSyA9IDAwMDIwMDAwNCAvKiBIUFVYIGhhcyBzZXBhcmF0ZSBOREVMQVkgJiBO
T05CTE9DSyAqLworICAgIElOX05PTkJMT0NLID0gMDAwMjAwMDAwCiAjZGVmaW5lIElOX05P
TkJMT0NLIElOX05PTkJMT0NLCiAgIH07CkluZGV4OiBnbGliYy0yLjMxL3N5c2RlcHMvdW5p
eC9zeXN2L2xpbnV4L2hwcGEvYml0cy9zaWduYWxmZC5oCj09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGds
aWJjLTIuMzEub3JpZy9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9ocHBhL2JpdHMvc2lnbmFs
ZmQuaAorKysgZ2xpYmMtMi4zMS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9ocHBhL2JpdHMv
c2lnbmFsZmQuaApAQCAtMjQsNiArMjQsNiBAQCBlbnVtCiAgIHsKICAgICBTRkRfQ0xPRVhF
QyA9IDAxMDAwMDAwMCwKICNkZWZpbmUgU0ZEX0NMT0VYRUMgU0ZEX0NMT0VYRUMKLSAgICBT
RkRfTk9OQkxPQ0sgPSAwMDIwMDAwNCAvKiBIUFVYIGhhcyBzZXBhcmF0ZSBOREVMQVkgJiBO
T05CTE9DSyAqLworICAgIFNGRF9OT05CTE9DSyA9IDAwMjAwMDAwCiAjZGVmaW5lIFNGRF9O
T05CTE9DSyBTRkRfTk9OQkxPQ0sKICAgfTsKSW5kZXg6IGdsaWJjLTIuMzEvc3lzZGVwcy91
bml4L3N5c3YvbGludXgvaHBwYS9iaXRzL3RpbWVyZmQuaAo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBn
bGliYy0yLjMxLm9yaWcvc3lzZGVwcy91bml4L3N5c3YvbGludXgvaHBwYS9iaXRzL3RpbWVy
ZmQuaAorKysgZ2xpYmMtMi4zMS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9ocHBhL2JpdHMv
dGltZXJmZC5oCkBAIC0yNCw2ICsyNCw2IEBAIGVudW0KICAgewogICAgIFRGRF9DTE9FWEVD
ID0gMDEwMDAwMDAwLAogI2RlZmluZSBURkRfQ0xPRVhFQyBURkRfQ0xPRVhFQwotICAgIFRG
RF9OT05CTE9DSyA9IDAwMDIwMDAwNCAvKiBIUFVYIGhhcyBzZXBhcmF0ZSBOREVMQVkgJiBO
T05CTE9DSyAqLworICAgIFRGRF9OT05CTE9DSyA9IDAwMDIwMDAwMAogI2RlZmluZSBURkRf
Tk9OQkxPQ0sgVEZEX05PTkJMT0NLCiAgIH07Cg==
--------------iN6xcanfwzcP03Oj6rtqf3ev
Content-Type: text/plain; charset=UTF-8; name="local-inlining.diff"
Content-Disposition: attachment; filename="local-inlining.diff"
Content-Transfer-Encoding: base64

SW5jcmVhc2UgdGhlIG1heGltYWwgb3ZlcmFsbCBncm93dGggb2YgdGhlIGNvbXBpbGF0aW9u
IHVuaXQgY2F1c2VkCmJ5IGlubGluaW5nIGZvciBkbC1yZWxvYy5jIG9uIGhwcGEuIFRoaXMg
cmVtb3ZlIHNvbWUgd2FybmluZ3MgYW5kIApzdHJhbmdlbHkgaXQgcmVkdWNlcyB0aGUgc2l6
ZSBvZiB0aGUgZmluYWwgYmluYXJ5LgoKLS0tCiBzeXNkZXBzL2hwcGEvTWFrZWZpbGUgfCAg
ICAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKLS0tIGEvc3lzZGVwcy9o
cHBhL01ha2VmaWxlCisrKyBiL3N5c2RlcHMvaHBwYS9NYWtlZmlsZQpAQCAtMjMsNiArMjMs
NyBAQAogCiBpZmVxICgkKHN1YmRpciksZWxmKQogQ0ZMQUdTLXJ0bGQuYyArPSAtbWRpc2Fi
bGUtZnByZWdzCitDRkxBR1MtZGwtcmVsb2MuYyArPSAtLXBhcmFtIGlubGluZS11bml0LWdy
b3d0aD0xMDAKIHN5c2RlcC1kbC1yb3V0aW5lcyArPSBkbC1zeW1hZGRyIGRsLWZwdHIKICMg
ZGwtZnB0ci5jIG5lZWRzIGEgY29tcGxldGUgcmV3cml0ZSB0byBmaXggSVNPIEMgYWxpYXNp
bmcgdmlvbGF0aW9ucy4KIENGTEFHUy1kbC1mcHRyLmMgPSAtV25vLWVycm9yCg==

--------------iN6xcanfwzcP03Oj6rtqf3ev--

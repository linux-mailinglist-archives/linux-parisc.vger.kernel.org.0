Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B057301679
	for <lists+linux-parisc@lfdr.de>; Sat, 23 Jan 2021 16:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbhAWPrJ (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Sat, 23 Jan 2021 10:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbhAWPrI (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 23 Jan 2021 10:47:08 -0500
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 23 Jan 2021 07:46:28 PST
Received: from mail.sf-mail.de (mail.sf-mail.de [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D7BC06174A
        for <linux-parisc@vger.kernel.org>; Sat, 23 Jan 2021 07:46:28 -0800 (PST)
Received: (qmail 23789 invoked from network); 23 Jan 2021 15:39:41 -0000
Received: from p548c7f40.dip0.t-ipconnect.de ([::ffff:84.140.127.64]:52888 HELO daneel.sf-tec.de) (auth=eike@sf-mail.de)
        by mail.sf-mail.de (Qsmtpd 0.37dev) with (TLS_AES_256_GCM_SHA384 encrypted) ESMTPSA
        for <linux-parisc@vger.kernel.org>; Sat, 23 Jan 2021 16:39:41 +0100
From:   Rolf Eike Beer <eike-kernel@sf-tec.de>
To:     linux-parisc@vger.kernel.org
Subject: Signal timing problems in python testsuite
Date:   Sat, 23 Jan 2021 16:39:37 +0100
Message-ID: <5448233.DvuYhMxLoT@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4639827.31r3eYUQgx"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

--nextPart4639827.31r3eYUQgx
Content-Type: multipart/mixed; boundary="nextPart5696590.lOV4Wx5bFT"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart5696590.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The Python testsuite in all versions of Python3 I remember fails the eintr 
tests with output like this:

FAIL: test_poll (__main__.SelectEINTRTest)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.9/test/eintrdata/eintr_tester.py", line 451, in 
test_poll
    self.assertGreaterEqual(dt, self.sleep_time)
AssertionError: 0.19999999995343387 not greater than or equal to 0.2

There are 2 more failing tests with likewise output. This happens on my 4-core 
C8000. I have attached the testcase, when running it with "python3 
test_eintr.py" I also get that results.

I suspect this could be some cross-cpu clock scew, but of course it can be 
something entirely different. Could someone have a look what is up there? 
Kernel is currently 5.10.4, but this has been there for a while.

Eike
--nextPart5696590.lOV4Wx5bFT
Content-Disposition: attachment; filename="test_eintr.py"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-python; charset="UTF-8"; name="test_eintr.py"

import os
import signal
import subprocess
import sys
import unittest

from test import support
from test.support import script_helper


@unittest.skipUnless(os.name == "posix", "only supported on Unix")
class EINTRTests(unittest.TestCase):

    @unittest.skipUnless(hasattr(signal, "setitimer"), "requires setitimer()")
    def test_all(self):
        # Run the tester in a sub-process, to make sure there is only one
        # thread (for reliable signal delivery).
        tester = support.findfile("eintr_tester.py", subdir="eintrdata")
        # use -u to try to get the full output if the test hangs or crash
        args = ["-u", tester, "-v"]
        if support.verbose:
            print()
            print("--- run eintr_tester.py ---", flush=True)
            # In verbose mode, the child process inherit stdout and stdout,
            # to see output in realtime and reduce the risk of losing output.
            args = [sys.executable, "-E", "-X", "faulthandler", *args]
            proc = subprocess.run(args)
            print(f"--- eintr_tester.py completed: "
                  f"exit code {proc.returncode} ---", flush=True)
            if proc.returncode:
                self.fail("eintr_tester.py failed")
        else:
            script_helper.assert_python_ok("-u", tester, "-v")


if __name__ == "__main__":
    unittest.main()

--nextPart5696590.lOV4Wx5bFT--

--nextPart4639827.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYAxDOQAKCRBcpIk+abn8
TlQhAJ4kDn8+vjH7XsqtxlnYEjYjQEsAwQCeMoCAKkuYLqDoz2ssVP8Y7y+RsOI=
=zM1J
-----END PGP SIGNATURE-----

--nextPart4639827.31r3eYUQgx--




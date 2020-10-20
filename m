Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E4A293E80
	for <lists+linux-parisc@lfdr.de>; Tue, 20 Oct 2020 16:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407979AbgJTOXF (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 20 Oct 2020 10:23:05 -0400
Received: from belmont79srvr.owm.bell.net ([184.150.200.79]:44746 "EHLO
        mtlfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2407921AbgJTOXF (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 20 Oct 2020 10:23:05 -0400
Received: from bell.net mtlfep01 184.150.200.30 by mtlfep01.bell.net
          with ESMTP
          id <20201020142303.DBGJ120733.mtlfep01.bell.net@mtlspm01.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Tue, 20 Oct 2020 10:23:03 -0400
Received: from [192.168.2.49] (really [76.66.134.232]) by mtlspm01.bell.net
          with ESMTP
          id <20201020142303.IQVX130487.mtlspm01.bell.net@[192.168.2.49]>;
          Tue, 20 Oct 2020 10:23:03 -0400
Subject: Re: Kernel 5.8 and 5.9 fail to boot on C8000
To:     Helge Deller <deller@gmx.de>,
        linux-parisc <linux-parisc@vger.kernel.org>
Cc:     James Bottomley <James.Bottomley@HansenPartnership.com>
References: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Message-ID: <82afed77-6c1f-2e85-7ed2-aa00ad3e2160@bell.net>
Date:   Tue, 20 Oct 2020 10:23:03 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <e6e6dcfa-1a09-21d7-69e0-b9e3c0360eb6@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=E9SzWpVl c=1 sm=1 tr=0 a=lNGNHD24gN8CBUU6PHFJmA==:117 a=lNGNHD24gN8CBUU6PHFJmA==:17 a=IkcTkHD0fZMA:10 a=afefHYAZSVUA:10 a=FBHGMhGWAAAA:8 a=Qtu54I01LsqUED2Pzw4A:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfMR+Oh7Y8fgk9JhVr0WOK0TshEBHMpjnBvs2+C7q1mSpvqZab4TeOtBWwIUCEpN3a+vTqdmfh41cfM3OcdbB4lhA2JwUFgkzFrpPUvku0cKg0Z7NGi1F MeSRqbsG9pp3UUmuJxKZ/ctIg71bHu1KLuBeokBXDAVfwRN2YbP6zDhPnN8/7mxZija9JvY0hOFxfA==
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2020-10-20 9:45 a.m., Helge Deller wrote:
> Latest Linux kernels v5.8 and v5.9 fail to boot for me on the C8000
> machines with this error:
>  mptspi: probe of 0000:40:01.0 failed with error -12
>  mptbase: ioc1: ERROR - Insufficient memory to add adapter!
>  mptspi: probe of 0000:40:01.1 failed with error -12
>
> The c8000 has a built-in Broadcom / LSI 53c1030 PCI-X Fusion-MPT Dual
> Ultra320 SCSI controller.
>
> Do other people see this as well?
> Any idea?
I'm not seeing on my c8000:

[   25.403687] mptbase alternatives: applied 0 out of 3 patches
...
[   26.362776] Fusion MPT base driver 3.04.20
...
[   27.234708] Fusion MPT SPI Host driver 3.04.20
[   27.322420] ohci_hcd alternatives: applied 0 out of 13 patches
[   27.344976] mptbase: ioc0: Initiating bringup
...

Recent versions of 5.8 don't seem very stable on rp3440:
Log Entry 105: 20 Oct 2020 03:52:27
Alert Level 2: Informational
Keyword: Type-02 127002 1208322
Soft Reset
Logged by: Baseboard Management Controller;
Sensor: System Event
0x205F8E5EFB0208D0 FFFF027000120300


Log Entry 104: 20 Oct 2020 03:52:27
Alert Level 5: Critical
Keyword: Type-02 236f01 2322177
Watchdog timer expired - hard reset
Logged by: Baseboard Management Controller;
Sensor: Watchdog 2 - Watchdog Timer
Data1: Hard Reset
Data2: EVT Ext1: 0x04
0x205F8E5EFB0208C0 FF04C16F0C230300

Earlier versions seemed better.

Dave

-- 
John David Anglin  dave.anglin@bell.net


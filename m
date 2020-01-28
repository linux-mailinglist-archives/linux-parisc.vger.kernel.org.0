Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89CCE14AF35
	for <lists+linux-parisc@lfdr.de>; Tue, 28 Jan 2020 06:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgA1Fw0 (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Tue, 28 Jan 2020 00:52:26 -0500
Received: from mga05.intel.com ([192.55.52.43]:27093 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgA1Fw0 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 28 Jan 2020 00:52:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jan 2020 21:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,372,1574150400"; 
   d="scan'208";a="277101581"
Received: from linux.intel.com ([10.54.29.200])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2020 21:52:23 -0800
Received: from [10.252.25.124] (abudanko-mobl.ccr.corp.intel.com [10.252.25.124])
        by linux.intel.com (Postfix) with ESMTP id 63AD1580277;
        Mon, 27 Jan 2020 21:52:15 -0800 (PST)
From:   Alexey Budankov <alexey.budankov@linux.intel.com>
Subject: [PATCH v6 00/10] Introduce CAP_PERFMON to secure system performance
 monitoring and observability
To:     Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "james.bottomley@hansenpartnership.com" 
        <james.bottomley@hansenpartnership.com>,
        Serge Hallyn <serge@hallyn.com>, Will Deacon <will@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>
Cc:     "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        Jiri Olsa <jolsa@redhat.com>, Andi Kleen <ak@linux.intel.com>,
        Stephane Eranian <eranian@google.com>,
        Igor Lubashev <ilubashe@akamai.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
        oprofile-list@lists.sf.net
Organization: Intel Corp.
Message-ID: <74d524ab-ac11-a7b8-1052-eba10f117e09@linux.intel.com>
Date:   Tue, 28 Jan 2020 08:52:13 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Currently access to perf_events, i915_perf and other performance monitoring and
observability subsystems of the kernel is open only for a privileged process [1]
with CAP_SYS_ADMIN capability enabled in the process effective set [2].

This patch set introduces CAP_PERFMON capability designed to secure system
performance monitoring and observability operations so that CAP_PERFMON would
assist CAP_SYS_ADMIN capability in its governing role for performance monitoring
and observability subsystems of the kernel.

CAP_PERFMON intends to harden system security and integrity during system
performance monitoring and observability operations by decreasing attack surface
that is available to a CAP_SYS_ADMIN privileged process [2]. Providing the access
to system performance monitoring and observability operations under CAP_PERFMON
capability singly, without the rest of CAP_SYS_ADMIN credentials, excludes chances
to misuse the credentials and makes the operation more secure. Thus, CAP_PERFMON
implements the principal of least privilege for performance monitoring and
observability operations (POSIX IEEE 1003.1e: 2.2.2.39 principle of least
privilege: A security design principle that states that a process or program be
granted only those privileges (e.g., capabilities) necessary to accomplish its
legitimate function, and only for the time that such privileges are actually
required)

CAP_PERFMON intends to meet the demand to secure system performance monitoring
and observability operations for adoption in security sensitive, restricted,
multiuser production environments (e.g. HPC clusters, cloud and virtual compute
environments), where root or CAP_SYS_ADMIN credentials are not available to mass
users of a system, and securely unblock applicability and scalability of system
performance monitoring and observability operations beyond root or CAP_SYS_ADMIN
process use cases.

CAP_PERFMON intends to take over CAP_SYS_ADMIN credentials related to system
performance monitoring and observability operations and balance amount of
CAP_SYS_ADMIN credentials following the recommendations in the capabilities man
page [2] for CAP_SYS_ADMIN: "Note: this capability is overloaded; see Notes to
kernel developers, below." For backward compatibility reasons access to system
performance monitoring and observability subsystems of the kernel remains open
for CAP_SYS_ADMIN privileged processes but CAP_SYS_ADMIN capability usage for
secure system performance monitoring and observability operations is discouraged
with respect to the designed CAP_PERFMON capability.

Possible alternative solution to this system security hardening, capabilities
balancing task of making performance monitoring and observability operations
more accessible could be to use the existing CAP_SYS_PTRACE capability to govern
system performance monitoring and observability subsystems. However CAP_SYS_PTRACE
capability still provides users with more credentials than are required for secure
performance monitoring and observability operations and this excess is avoided by
the designed CAP_PERFMON capability.

Although software running under CAP_PERFMON can not ensure avoidance of related
hardware issues, the software can still mitigate those issues following the official
embargoed hardware issues mitigation procedure [3]. The bugs in the software itself
can be fixed following the standard kernel development process [4] to maintain and
harden security of system performance monitoring and observability operations.
Finally, the patch set is shaped in the way that simplifies backtracking procedure
of possible induced issues [5] as much as possible.

The patch set is for tip perf/core repository:
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip perf/core
sha1: 56ee04aa63285d6bc8a995a26e2441ae3d419bcd

---
Changes in v6:
- avoided noaudit checks in perfmon_capable() to explicitly advertise CAP_PERFMON
  usage thru audit logs to secure system performance monitoring and observability
Changes in v5:
- renamed CAP_SYS_PERFMON to CAP_PERFMON
- extended perfmon_capable() with noaudit checks
Changes in v4:
- converted perfmon_capable() into an inline function
- made perf_events kprobes, uprobes, hw breakpoints and namespaces data available
  to CAP_SYS_PERFMON privileged processes
- applied perfmon_capable() to drivers/perf and drivers/oprofile
- extended __cmd_ftrace() with support of CAP_SYS_PERFMON
Changes in v3:
- implemented perfmon_capable() macros aggregating required capabilities checks
Changes in v2:
- made perf_events trace points available to CAP_SYS_PERFMON privileged processes
- made perf_event_paranoid_check() treat CAP_SYS_PERFMON equally to CAP_SYS_ADMIN
- applied CAP_SYS_PERFMON to i915_perf, bpf_trace, powerpc and parisc system
  performance monitoring and observability related subsystems

---
Alexey Budankov (10):
  capabilities: introduce CAP_PERFMON to kernel and user space
  perf/core: open access to the core for CAP_PERFMON privileged process
  perf/core: open access to probes for CAP_PERFMON privileged process
  perf tool: extend Perf tool with CAP_PERFMON capability support
  drm/i915/perf: open access for CAP_PERFMON privileged process
  trace/bpf_trace: open access for CAP_PERFMON privileged process
  powerpc/perf: open access for CAP_PERFMON privileged process
  parisc/perf: open access for CAP_PERFMON privileged process
  drivers/perf: open access for CAP_PERFMON privileged process
  drivers/oprofile: open access for CAP_PERFMON privileged process

 arch/parisc/kernel/perf.c           |  2 +-
 arch/powerpc/perf/imc-pmu.c         |  4 ++--
 drivers/gpu/drm/i915/i915_perf.c    | 13 ++++++-------
 drivers/oprofile/event_buffer.c     |  2 +-
 drivers/perf/arm_spe_pmu.c          |  4 ++--
 include/linux/capability.h          |  4 ++++
 include/linux/perf_event.h          |  6 +++---
 include/uapi/linux/capability.h     |  8 +++++++-
 kernel/events/core.c                |  6 +++---
 kernel/trace/bpf_trace.c            |  2 +-
 security/selinux/include/classmap.h |  4 ++--
 tools/perf/builtin-ftrace.c         |  5 +++--
 tools/perf/design.txt               |  3 ++-
 tools/perf/util/cap.h               |  4 ++++
 tools/perf/util/evsel.c             | 10 +++++-----
 tools/perf/util/util.c              |  1 +
 16 files changed, 47 insertions(+), 31 deletions(-)

---
Testing and validation (Intel Skylake, 8 cores, Fedora 29, 5.5.0-rc3+, x86_64):

libcap library [6], [7], [8] and Perf tool can be used to apply CAP_PERFMON 
capability for secure system performance monitoring and observability beyond the
scope permitted by the system wide perf_event_paranoid kernel setting [9] and
below are the steps for evaluation:

  - patch, build and boot the kernel
  - patch, build Perf tool e.g. to /home/user/perf
  ...
  # git clone git://git.kernel.org/pub/scm/libs/libcap/libcap.git libcap
  # pushd libcap
  # patch libcap/include/uapi/linux/capabilities.h with [PATCH 1]
  # make
  # pushd progs
  # ./setcap "cap_perfmon,cap_sys_ptrace,cap_syslog=ep" /home/user/perf
  # ./setcap -v "cap_perfmon,cap_sys_ptrace,cap_syslog=ep" /home/user/perf
  /home/user/perf: OK
  # ./getcap /home/user/perf
  /home/user/perf = cap_sys_ptrace,cap_syslog,cap_perfmon+ep
  # echo 2 > /proc/sys/kernel/perf_event_paranoid
  # cat /proc/sys/kernel/perf_event_paranoid 
  2
  ...
  $ /home/user/perf top
    ... works as expected ...
  $ cat /proc/`pidof perf`/status
  Name:	perf
  Umask:	0002
  State:	S (sleeping)
  Tgid:	2958
  Ngid:	0
  Pid:	2958
  PPid:	9847
  TracerPid:	0
  Uid:	500	500	500	500
  Gid:	500	500	500	500
  FDSize:	256
  ...
  CapInh:	0000000000000000
  CapPrm:	0000004400080000
  CapEff:	0000004400080000 => 01000100 00000000 00001000 00000000 00000000
                                     cap_perfmon,cap_sys_ptrace,cap_syslog
  CapBnd:	0000007fffffffff
  CapAmb:	0000000000000000
  NoNewPrivs:	0
  Seccomp:	0
  Speculation_Store_Bypass:	thread vulnerable
  Cpus_allowed:	ff
  Cpus_allowed_list:	0-7
  ...

Usage of cap_perfmon effectively avoids unused credentials excess:

- with cap_sys_admin:
  CapEff:	0000007fffffffff => 01111111 11111111 11111111 11111111 11111111

- with cap_perfmon:
  CapEff:	0000004400080000 => 01000100 00000000 00001000 00000000 00000000
                                    38   34               19
                               perfmon   syslog           sys_ptrace

---
[1] https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html
[2] http://man7.org/linux/man-pages/man7/capabilities.7.html
[3] https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
[4] https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
[5] https://www.kernel.org/doc/html/latest/process/management-style.html#decisions
[6] http://man7.org/linux/man-pages/man8/setcap.8.html
[7] https://git.kernel.org/pub/scm/libs/libcap/libcap.git
[8] https://sites.google.com/site/fullycapable/, posix_1003.1e-990310.pdf
[9] http://man7.org/linux/man-pages/man2/perf_event_open.2.html

-- 
2.20.1


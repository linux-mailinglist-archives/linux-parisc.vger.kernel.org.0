Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE5647E895
	for <lists+linux-parisc@lfdr.de>; Thu, 23 Dec 2021 21:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350181AbhLWUAH (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 23 Dec 2021 15:00:07 -0500
Received: from mout.gmx.net ([212.227.17.20]:45925 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244949AbhLWUAG (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 23 Dec 2021 15:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1640289595;
        bh=AT2FpgGXT2XdIPd/ZOFAyzhP5u0l1pT2rMruxY1Y1xU=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=WtS4UvIhUZQL2IF31WtnrJyMbry8ccGqjfh01VRykmWHsOLbsCjt3foC0KUWkK/wb
         jTlqru401l2Pk2TbmXaZ7LT8KmPqWHZ1VHmlSLi6U//XhrvP0sjLPcZBd/iXqMb8cf
         E9T6XNbhWvoVVRMbZlufAR29iMBBZZtRAhunRRoA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.188]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOiDX-1mp8GS13gl-00QEJX; Thu, 23
 Dec 2021 20:59:55 +0100
Message-ID: <64c7d22c-1a19-7a28-fa7c-18e3219278bb@gmx.de>
Date:   Thu, 23 Dec 2021 20:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] parisc: Rewrite light-weight syscall and futex code
Content-Language: en-US
From:   Helge Deller <deller@gmx.de>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        Deller <deller@kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>
References: <YcScAR4cPgyI5B6d@mx3210.localdomain> <YcTEOhVnmT8kQRmf@ls3530>
 <888da884-86e0-e6f4-68c3-e3448eb4c9c8@bell.net>
 <6e4b0354-c3d9-ec11-4303-525e04c2d5d8@gmx.de>
In-Reply-To: <6e4b0354-c3d9-ec11-4303-525e04c2d5d8@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7opmvoVbA2WTv/Iq17PxBWL/rncCybeDp4MrmDzFzISBGkZUBDL
 UmGb+We4mTIn0/rFRuxJxlD1UbDom9VwEccFAQkHt2z9XnT3gm7jE3wSToHEeJ9wxjdk6TH
 QFtn3UW18Bw7C6ohxshFleCxKp1I21/D/Fclz4230+f0xsZ/GQloPY6FNusDaQ6sPRICEOc
 EsnN11X7UJ5zmkvMvqhAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UqAfds9UOh8=:A3HoambZsfDkf288sXyFQb
 qMc0SMTaIYQ9uaj3wynA1Ya9QkpLE+29T3MykxKcQIH6hS4U4udOYVsVlgTyl+HCeS+TJH5qx
 YGwa3FLfO7QCFEtK2pXC1zjvVvuWvqiYqW8zCE1k6dTa+ZzOtcfVspEmyJ0nwxO9dsK5QS4Jx
 GOv0MkVdcFhcLzU7/sGUTozEA8+IIvDo7HfQyTf+kv5WF9hrNeUlxTxo9v9pjFB9DHftLHzzV
 rbq5l+c+zI0PAac8OXDC/UU0I0/9ZtEMpUb7qttdxMQQggPpZDZyeRrlW5gEzXnrNr5ZGIUSx
 OEL5uePj4GOxS815boT/Sr2ZWBjZJsyPZjndFFEJV2sR+DfkRQNfwjUo3MYL22JCw0xCOO5WI
 kWX4YwCBtoCVoQG7VglG5pLzQHxoX3iXII1kDRbRlAqw2MkeEdrk6kUQudNXr3ofbv93CWB4y
 V7djWyoGQbve5wyAAViB0KE0Z3rO4Ke+sfnx/ye75VXntE1Rq639NfF/9OFLnPe8fdvv5VxCr
 GxxGdbMkpYzJNcLxUQZrzURK08+2OdlnDLm1BN3CY7WaXYUzEUMvLQor4JPzgUpE9zEEaki0A
 8sJ4GkF3mmAREtkvmLrOxhiXnaZ6jnl1k+avwZSicrC6Y04x14wc6SDPQE7skjJtYOXnPoWu8
 1RQQ7qTEhfN4RdVv/tf3rPOf1qDGphZ5lF4TXBy2nCqWekPbWDVCOeP1s5wO5XObeYdYXZ9h5
 GA3lkjYHHn6/s9iJvBZTyIM+tA9yabpBcqibIF9+mXIisYV7p9Hq3u96hgIfyyXUyNWSpgasM
 B/74pAJDklMI+Y82F46Rcy34LxALi3qgY30x60KQGR/ZHAladALv7p+P12H7BQ2uDN+3oVYfD
 BjcfmXKzEw9/a3AqzbE+a+RhmKOteDJCenOGyZLEwOX2mBnsP8PdxYs5isy0puHXPuQWXSNkd
 kMQbB7MX3AdJhlW01pdWypue0FPvBsEpbX0RAxQK1MJJ2JCgvJ1HP0x2gYyIMsvfQrYr2wzmL
 wiaC73E6/eLOcTxh/FGm50yUuectZ4h67CryDDfyVm7Cz4vtatv4plFSTkEnOafDpUdGqyvx+
 QOESfP4kpYIk0E=
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 12/23/21 20:31, Helge Deller wrote:
> On 12/23/21 20:17, John David Anglin wrote:
>> On 2021-12-23 1:47 p.m., Helge Deller wrote:
>>> ...
>>>> In order to do this, we need a mechanism to trigger COW breaks outsid=
e the
>>>> critical region. Fortunately, parisc has the "stbys,e" instruction. W=
hen
>>>> the leftmost byte of a word is addressed, this instruction triggers a=
ll
>>>> the exceptions of a normal store but it does not write to memory. Thu=
s,
>>>> we can use it to trigger COW breaks outside the critical region witho=
ut
>>>> modifying the data that is to be updated atomically.
>>> ...
>>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/as=
m/futex.h
>>>> index 9cd4dd6e63ad..8f97db995b04 100644
>>>> --- a/arch/parisc/include/asm/futex.h
>>>> +++ b/arch/parisc/include/asm/futex.h
>>> ...
>>>> +static inline bool _futex_force_interruptions(unsigned long ua)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 bool result;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__(
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%1), %0\n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%1)\=
n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\tcomclr,=3D %%r0, %%r0,=
 %0\n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\tldi 1, %0\n"
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(=
1b, 3b)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(=
2b, 3b)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (result) : "r" =
(ua) : "memory"
>>>> +=C2=A0=C2=A0=C2=A0 );
>>>> +=C2=A0=C2=A0=C2=A0 return result;
>>> I wonder if we can get rid of the comclr,=3D instruction by using
>>> ASM_EXCEPTIONTABLE_ENTRY_EFAULT instead of ASM_EXCEPTIONTABLE_ENTRY,
>>> e.g.:
>>>
>>> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm=
/futex.h
>>> index 8f97db995b04..ea052f013865 100644
>>> --- a/arch/parisc/include/asm/futex.h
>>> +++ b/arch/parisc/include/asm/futex.h
>>> @@ -21,20 +21,21 @@ static inline unsigned long _futex_hash_index(unsi=
gned long ua)
>>> =C2=A0=C2=A0 * if load and store fault.
>>> =C2=A0=C2=A0 */
>>>
>>> -static inline bool _futex_force_interruptions(unsigned long ua)
>>> +static inline unsigned long _futex_force_interruptions(unsigned long =
ua)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 bool result;
>>> +=C2=A0=C2=A0=C2=A0 register unsigned long error __asm__ ("r8") =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 register unsigned long temp;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __asm__ __volatile__(
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%1), %0\n"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%1)\n=
"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "\tcomclr,=3D %%r0, %%r0, =
%0\n"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\tldi 1, %0\n"
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(1=
b, 3b)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY(2=
b, 3b)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (result) : "r" (=
ua) : "memory"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\tldw 0(%2), %0\n"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2:\tstbys,e %%r0, 0(%2)\n=
"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "3:\n"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY_E=
FAULT(1b, 3b)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASM_EXCEPTIONTABLE_ENTRY_E=
FAULT(2b, 3b)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (temp), "=3Dr" (e=
rror)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (ua), "1" (error) : =
"memory"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
>>> -=C2=A0=C2=A0=C2=A0 return result;
>>> +=C2=A0=C2=A0=C2=A0 return error;
>>> =C2=A0 }
>> I don't think this is a win.
>>
>> 1) Register %r8 needs to get loaded with 0. So, that's one instruction.
>
> True. On the other hand you don't need the "ldi 1,%0" then, which brings=
 parity.
>
>> 2) Register %r8 is a caller saves register. Using it will cause gcc to =
save and restore it from stack. This may
>> cause a stack frame to be created when one isn't needed. The save and r=
estore instructions are more
>> expensive, particularly if they cause a TLB miss.
>
> Because of this reason, wouln't it make sense to switch the uaccess func=
tions away from r8 too,
> and use another temp register in both?
>
>> Note that the comclr both clears result and nullifies the following ldi=
 instruction, so it is not executed in the fast path.
>
> Yes, but when emulating with qemu, it generates comparism and jumps, whi=
le the loading of r8 (see 1)), is trivial.
>
> If we change the uaccess functions away from r8, then we can drop comclr=
 (and save one instruction).

Independend of your patch I think we should go away in uacces from r8.
I did some testing (on 32bit kernel) and r29 seems good.
Opinion?

When changing from r8 to r22:
# scripts/bloat-o-meter vmlinux1 vmlinux
add/remove: 0/0 grow/shrink: 23/85 up/down: 216/-964 (-748)
...

and when changing from r8 to r29:
# scripts/bloat-o-meter vmlinux1 vmlinux
add/remove: 0/0 grow/shrink: 23/86 up/down: 228/-980 (-752)
Function                                     old     new   delta
tty_mode_ioctl                              1468    1512     +44
fat_generic_ioctl                           1428    1464     +36
__receive_fd                                 260     276     +16
vt_do_kdsk_ioctl                             880     892     +12
futex_requeue                               2972    2984     +12
do_tcp_getsockopt.constprop                 4724    4736     +12
blkdev_ioctl                                2644    2656     +12
vt_do_diacrit                               1000    1008      +8
tty_jobctrl_ioctl                           1060    1068      +8
tioclinux                                    700     708      +8
sg_read                                     1256    1264      +8
scsi_ioctl                                  2004    2012      +8
uart_ioctl                                  1468    1472      +4
sys_sendfile64                               204     208      +4
sys_sendfile                                 188     192      +4
sys_rt_sigreturn                             288     292      +4
st_ioctl                                    5436    5440      +4
rtc_dev_read                                 412     416      +4
ipv6_get_msfilter                            252     256      +4
ip_get_mcast_msfilter                        196     200      +4
futex_unlock_pi                              756     760      +4
fillonedir                                   276     280      +4
dev_ifconf                                   256     260      +4
vt_ioctl                                    4084    4080      -4
sg_ioctl                                    2120    2116      -4
n_tty_ioctl                                  316     312      -4
handle_futex_death.part                      404     400      -4
do_ipv6_getsockopt.constprop                2068    2064      -4
count.constprop                              248     244      -4
autofs_root_ioctl                            576     572      -4
write_sysrq_trigger                           96      88      -8
write_port                                   220     212      -8
sys_utime32                                  132     124      -8
sys_time32                                    80      72      -8
sys_settimeofday                             208     200      -8
sys_pselect6_time32                          320     312      -8
sys_pselect6                                 320     312      -8
sys_name_to_handle_at                        488     480      -8
sys_msgsnd                                    80      72      -8
sys_ioctl                                   2396    2388      -8
sys_io_submit                               2944    2936      -8
sys_gettimeofday                             160     152      -8
sys_getresgid                                124     116      -8
sys_getgroups                                140     132      -8
sys_getdents64                               288     280      -8
sys_getdents                                 280     272      -8
sys_getcpu                                   112     104      -8
sock_getsockopt                             2476    2468      -8
serport_ldisc_ioctl                           88      80      -8
schedule_tail                                100      92      -8
raw_getsockopt                               196     188      -8
proc_bus_pci_write                           604     596      -8
proc_bus_pci_read                            624     616      -8
pipe_ioctl                                   184     176      -8
move_addr_to_user                            156     148      -8
mmc_ioctl_cdrom_last_written                  84      76      -8
mm_release                                   180     172      -8
load_elf_binary                             4336    4328      -8
ksys_msgsnd                                   80      72      -8
kpagecount_read                              552     544      -8
kpagecgroup_read                             424     416      -8
kernel_wait4                                 304     296      -8
ip_mc_msfget                                 472     464      -8
generic_ptrace_peekdata                      100      92      -8
futex_wait_setup                             248     240      -8
futex_get_value_locked                        92      84      -8
fat_dir_ioctl                                340     332      -8
do_signal.part                               332     324      -8
do_signal                                   1144    1136      -8
do_recvmmsg                                  632     624      -8
do_msg_fill                                  108     100      -8
do_compat_futimesat                          204     196      -8
check_syscallno_in_delay_branch.constprop     172     164      -8
autofs_expire_multi                           76      68      -8
__sys_socketpair                             560     552      -8
__sys_sendmmsg                               396     388      -8
__save_altstack                               92      84      -8
udp_ioctl                                    168     156     -12
tcp_ioctl                                    512     500     -12
sys_waitid                                   312     300     -12
sys_setgroups                                484     472     -12
sys_getresuid                                140     128     -12
sys_get_robust_list                          220     208     -12
sys_capset                                   460     448     -12
sys_capget                                   344     332     -12
pty_set_lock                                 224     212     -12
futex_cmpxchg_value_locked                   216     204     -12
fpr_set                                      240     228     -12
fault_in_writeable                           176     164     -12
fault_in_readable                            188     176     -12
copy_to_kernel_nofault                       352     340     -12
copy_from_kernel_nofault                     400     388     -12
strncpy_from_kernel_nofault                  284     268     -16
put_cmsg                                     340     324     -16
packet_ioctl                                 344     328     -16
check_zeroed_user                            220     204     -16
cap_validate_magic                           336     320     -16
strncpy_from_user                            484     464     -20
random_ioctl                                 532     512     -20
do_epoll_wait                               1704    1684     -20
vt_do_kdskled                                632     608     -24
unix_ioctl                                   484     460     -24
read_port                                    208     184     -24
ns_ioctl                                     260     236     -24
ata_sas_scsi_ioctl                           704     680     -24
pty_bsd_ioctl                                288     260     -28
arch_ptrace                                  524     496     -28
pty_unix98_ioctl                             312     280     -32
copy_process                                6364    6316     -48
Total: Before=3D8913722, After=3D8912970, chg -0.01%

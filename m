Return-Path: <linux-parisc+bounces-800-lists+linux-parisc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F84871329
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Mar 2024 03:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189771C21A44
	for <lists+linux-parisc@lfdr.de>; Tue,  5 Mar 2024 02:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA0C8005A;
	Tue,  5 Mar 2024 02:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w17bTa5M"
X-Original-To: linux-parisc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC57F48D
	for <linux-parisc@vger.kernel.org>; Tue,  5 Mar 2024 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709604152; cv=none; b=pQtajQRylKfNyke2KT+qIqtfhWK+vV36UHMXuRvQuwTU5bOb/oetnjKiV+eyN7oODYe4A7dxYEdrZFpXfYl2ss7/1ISsZu42ls02ZDUws25+4LbWDrenliDaliBKdQeilewOMQsleZaaSQgMGmiIb0Mo/WeaMYIiRl4jtuwQzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709604152; c=relaxed/simple;
	bh=hhTn9p1XwzISL7C5gKFqnqFXBENnD/3OZxHQrtbcllo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nt5dG9kmJYq3OJp/ClvDxViDlhnBEe1woBLx0XJK5PR/clcokfOypcYLzw+uQyGYpC4Kq4cb5tHgSSxuoUNXykjEdVzm0DlEo3eg7qg5Okz6jTVx0xcH8FzfsjJ2vFMJujqE7ATmCHyy7aAJ1Hk5LgMVWQ+S4taNNGC8sMAuLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w17bTa5M; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6b5d1899eso8540103276.0
        for <linux-parisc@vger.kernel.org>; Mon, 04 Mar 2024 18:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709604145; x=1710208945; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUyayvOEBz5zFtmb2xO91k6ZefxPKefgjTfaK+UBmnk=;
        b=w17bTa5M225BWOQiacVMQk3NsbaF20OsZ8bWyRMwDm3uuVeaC03KX+GSWeZQp2Pccs
         z2iSO8nWE5EkUJ5Bi0WJtikgEsQoaCWk6Tz8EL2SElTap5wqdAgPb3OH2nSVjRX+wktR
         j8zjnINRYbbMwt5k8sOKOxGP0oJxZGODIRXZEFqMhfI5dxJybufOcIQlZEdHHKrH92A4
         keLaS4Tg7BAEluHNCNFVKXQHQssJKpStmAOX6XpvAC142iU9GW3NM3/Yq+REpTAZU6tD
         eEYjvMHjD1UqwSSXcPd9nn+JRKX9+GFKRUedq0Q+NibFOOJVbMRvYTxnc1Xr/CLrTrgP
         trAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604145; x=1710208945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUyayvOEBz5zFtmb2xO91k6ZefxPKefgjTfaK+UBmnk=;
        b=BC98UON+ON0FZ+sV5R2uYG17JvC135FaOzPl6rXh7QnSecy677RDesqgl351fZBaAh
         p8yWBT1cSUUWX1RxZW6za4AdZRT5fQXluKn7ltgFY5agCulD0mr1+BENGAKaYsSN4Mkn
         EfQGSxILjkcawOSaEMcv/cPovp89HW313Z4pBSUkNQ64JYV7ZPpf50G7w92tZpnw4uMX
         V5WOJjKTYtBJ0U/ZG2r1YzbTOemd5gRZ0mfiCUfmriZR64qW+nvL0fbmKTL4OMmHsim/
         jdIPAU4sGtLTXiyfWCJ441C3OsUnVOCXGk5QTvA+KsT9u5F5hFQaBmbUidWFiFEEVfx7
         D5WA==
X-Forwarded-Encrypted: i=1; AJvYcCXpCQnFvFv8V7oRJaiZFu3vf6DDhWpFAAFet0iFBxPmzyuninX9+019UAa5ZefTZzzdO9DhhqG/pwY+sUR3TNL4+xpT5+OwHPwXZUqu
X-Gm-Message-State: AOJu0YzWHczQywWVkyhd8rWUh2ZMow7sPRtSmfCUN1ky8fCDI51qGQpb
	Av9dIgNhQKlrtQ5MsvLQsfgADauOyEfIdxQnLEborw71rc/bI0cAFrL6PyluhXtdD3Fw/9M3fIR
	MWPSd0cx+au98ckQ9wbXbFQ==
X-Google-Smtp-Source: AGHT+IEVe2f+6gX4f/5Yp9IRtUBATduc0b7uGJUOANcYQJ+1Gd6klga0NwHYpgk9lt3U5b/aEx5xca1gppEUFHGrHw==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:b614:914c:63cd:3830])
 (user=almasrymina job=sendgmr) by 2002:a05:6902:110c:b0:dc6:e884:2342 with
 SMTP id o12-20020a056902110c00b00dc6e8842342mr341920ybu.5.1709604145324; Mon,
 04 Mar 2024 18:02:25 -0800 (PST)
Date: Mon,  4 Mar 2024 18:01:48 -0800
In-Reply-To: <20240305020153.2787423-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305020153.2787423-1-almasrymina@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305020153.2787423-14-almasrymina@google.com>
Subject: [RFC PATCH net-next v6 13/15] net: add SO_DEVMEM_DONTNEED setsockopt
 to release RX frags
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an interface for the user to notify the kernel that it is done
reading the devmem dmabuf frags returned as cmsg. The kernel will
drop the reference on the frags to make them available for reuse.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v6:
- Squash in locking optimizations from edumazet@google.com. With his
  changes we lock the xarray once per sock_devmem_dontneed operation
  rather than once per frag.

Changes in v1:
- devmemtoken -> dmabuf_token (David).
- Use napi_pp_put_page() for refcounting (Yunsheng).
- Fix build error with missing socket options on other asms.

---
 arch/alpha/include/uapi/asm/socket.h  |  1 +
 arch/mips/include/uapi/asm/socket.h   |  1 +
 arch/parisc/include/uapi/asm/socket.h |  1 +
 arch/sparc/include/uapi/asm/socket.h  |  1 +
 include/uapi/asm-generic/socket.h     |  1 +
 include/uapi/linux/uio.h              |  4 ++
 net/core/sock.c                       | 61 +++++++++++++++++++++++++++
 7 files changed, 70 insertions(+)

diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
index 1a9439f1c02e..43c98719120a 100644
--- a/arch/alpha/include/uapi/asm/socket.h
+++ b/arch/alpha/include/uapi/asm/socket.h
@@ -140,6 +140,7 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	78
 #define SO_DEVMEM_LINEAR	79
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	80
diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/asm/socket.h
index a940747504a0..9a71ee8f36db 100644
--- a/arch/mips/include/uapi/asm/socket.h
+++ b/arch/mips/include/uapi/asm/socket.h
@@ -151,6 +151,7 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	78
 #define SO_DEVMEM_LINEAR	79
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	80
diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
index 1d399f104f08..1e77efcc6d63 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -132,6 +132,7 @@
 #define SO_PASSPIDFD		0x404A
 #define SO_PEERPIDFD		0x404B
 
+#define SO_DEVMEM_DONTNEED	97
 #define SO_DEVMEM_LINEAR	98
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	99
diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi/asm/socket.h
index a5961ecff31d..ecfc8bfa9fe0 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -133,6 +133,7 @@
 #define SO_PASSPIDFD             0x0055
 #define SO_PEERPIDFD             0x0056
 
+#define SO_DEVMEM_DONTNEED       0x0057
 #define SO_DEVMEM_LINEAR         0x0058
 #define SCM_DEVMEM_LINEAR        SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF         0x0059
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index 25a2f5255f52..1acb77780f10 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -135,6 +135,7 @@
 #define SO_PASSPIDFD		76
 #define SO_PEERPIDFD		77
 
+#define SO_DEVMEM_DONTNEED	97
 #define SO_DEVMEM_LINEAR	98
 #define SCM_DEVMEM_LINEAR	SO_DEVMEM_LINEAR
 #define SO_DEVMEM_DMABUF	99
diff --git a/include/uapi/linux/uio.h b/include/uapi/linux/uio.h
index ad92e37699da..65f33178a601 100644
--- a/include/uapi/linux/uio.h
+++ b/include/uapi/linux/uio.h
@@ -30,6 +30,10 @@ struct dmabuf_cmsg {
 	__u32  dmabuf_id;	/* dmabuf id this frag belongs to. */
 };
 
+struct dmabuf_token {
+	__u32 token_start;
+	__u32 token_count;
+};
 /*
  *	UIO_MAXIOV shall be at least 16 1003.1g (5.4.1.1)
  */
diff --git a/net/core/sock.c b/net/core/sock.c
index df2ac54a8f74..dc15d676f46f 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1049,6 +1049,63 @@ static int sock_reserve_memory(struct sock *sk, int bytes)
 	return 0;
 }
 
+#ifdef CONFIG_PAGE_POOL
+static noinline_for_stack int
+sock_devmem_dontneed(struct sock *sk, sockptr_t optval, unsigned int optlen)
+{
+	unsigned int num_tokens, i, j, k, netmem_num = 0;
+	struct dmabuf_token *tokens;
+	netmem_ref netmems[16];
+	int ret;
+
+	if (sk->sk_type != SOCK_STREAM || sk->sk_protocol != IPPROTO_TCP)
+		return -EBADF;
+
+	if (optlen % sizeof(struct dmabuf_token) ||
+	    optlen > sizeof(*tokens) * 128)
+		return -EINVAL;
+
+	tokens = kvmalloc_array(128, sizeof(*tokens), GFP_KERNEL);
+	if (!tokens)
+		return -ENOMEM;
+
+	num_tokens = optlen / sizeof(struct dmabuf_token);
+	if (copy_from_sockptr(tokens, optval, optlen))
+		return -EFAULT;
+
+	ret = 0;
+
+	xa_lock_bh(&sk->sk_user_frags);
+	for (i = 0; i < num_tokens; i++) {
+		for (j = 0; j < tokens[i].token_count; j++) {
+			netmem_ref netmem = (__force netmem_ref)__xa_erase(
+				&sk->sk_user_frags, tokens[i].token_start + j);
+
+			if (netmem &&
+			    !WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
+				netmems[netmem_num++] = netmem;
+				if (netmem_num == ARRAY_SIZE(netmems)) {
+					xa_unlock_bh(&sk->sk_user_frags);
+					for (k = 0; k < netmem_num; k++)
+						WARN_ON_ONCE(!napi_pp_put_page(netmems[k],
+									       false));
+					netmem_num = 0;
+					xa_lock_bh(&sk->sk_user_frags);
+				}
+				ret++;
+			}
+		}
+	}
+
+	xa_unlock_bh(&sk->sk_user_frags);
+	for (k = 0; k < netmem_num; k++)
+		WARN_ON_ONCE(!napi_pp_put_page(netmems[k], false));
+
+	kvfree(tokens);
+	return ret;
+}
+#endif
+
 void sockopt_lock_sock(struct sock *sk)
 {
 	/* When current->bpf_ctx is set, the setsockopt is called from
@@ -1200,6 +1257,10 @@ int sk_setsockopt(struct sock *sk, int level, int optname,
 			ret = -EOPNOTSUPP;
 		return ret;
 		}
+#ifdef CONFIG_PAGE_POOL
+	case SO_DEVMEM_DONTNEED:
+		return sock_devmem_dontneed(sk, optval, optlen);
+#endif
 	}
 
 	sockopt_lock_sock(sk);
-- 
2.44.0.rc1.240.g4c46232300-goog



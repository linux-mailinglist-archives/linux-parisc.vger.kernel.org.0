Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Original-To: lists+linux-parisc@lfdr.de
Delivered-To: lists+linux-parisc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1184D4489
	for <lists+linux-parisc@lfdr.de>; Thu, 10 Mar 2022 11:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbiCJK0t (ORCPT <rfc822;lists+linux-parisc@lfdr.de>);
        Thu, 10 Mar 2022 05:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241354AbiCJK03 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 10 Mar 2022 05:26:29 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05C6140754
        for <linux-parisc@vger.kernel.org>; Thu, 10 Mar 2022 02:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1646907861;
        bh=ZceMk4M6MJE1LYw5gQ5QQ9MDaZZH+nnaRt85q91K4eA=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=SiGgBHUMiV7cH3g4ubjspGOYvFH4U0Yi/9DgfUIKpIm3d9YtucoDm0lDpcJU0TxEG
         Qd9M2hGgL1BV72Ku8G5XrnYyMGaHW0Rsdbpa2HCKjkwcJHheL2cL3aqQkaiJgNOU9Q
         iJJSnItE8GO8DvIFqWklN7GYQKQTSTaMh/yO6MTo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.187.196]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3DW-1nLgOj2sIK-00FTe8; Thu, 10
 Mar 2022 11:24:21 +0100
Message-ID: <c32d97c8-b5f1-ec33-06e0-2659b0875004@gmx.de>
Date:   Thu, 10 Mar 2022 11:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: support for DEBUG_VM_PGTABLE
Content-Language: en-US
To:     Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-parisc@vger.kernel.org
References: <2621439.mvXUDI8C0e@eto.sf-tec.de>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <2621439.mvXUDI8C0e@eto.sf-tec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XT8CBi74J4jZgLbVklUYaRLWMpm8WBbAINVlSDBgmbNGa2dGqpw
 tAetdDbiYyOGb1ZJ7PJetq0ty1NTQpajBoSQxbQ4liOG7Yfbjd9+aewAYP2IDKn1vfhfIPM
 ne/Bbz5i4kxHAO46n+ReSn8S49IhebZ0NWIXlHQs+oTvi4YOsHfMuirGmCh+dUy7aEdKsu/
 9rnGcxEiSyglEcV5EDSEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:elJLgyMvxQQ=:VAG6hdO7ZGbJ/NXhFVlHN1
 m++zS5sFPJbeGPYd1dBSKxN8d9j49BOejUciR7B9EX2gww1Z6uk98metcsymdRMHMvmYykW2i
 BlI2faizdUp7ntg8PbSwVsnwFOHbGVBBPPETZhyNk/mGdXLdydVQMDGjyDtZbtTIVuZx5YW50
 8NxTNXxGYQJI1Uf1oEwHMX5YEjRo9bk8ueJ9Q7seDWFtUhVPobWmXukmzopL91FWHle1/LpDk
 HxIQPXk13S6LJZvKHx5HdtjoIAcaY1SkYxstUvvuwXogbOmN9RbRBQ5nNSpz4rjRTnILssmBi
 GTVXM0Zw7x8tRZMvNOxUMCvaL5If8alVCADU/Pad+xoi+q7QcFS9Oq+5JO8LOEH4yps/7Vn+7
 flEJPxf58wSFkV8ALvpLVosQtkP8THv6A8UwnWR8ri756CHRqctfNy6OEdJ33XGvn5iQxG8vh
 kR6HvR8YNKG7X7cCyHPFO2v39Ahk6KsJMb6q6tLmZw2yHqqiQn+1oNyzLZwQdltjwL5XykwZw
 5dUje3Nclj9TJ+vSPflUjNobZqBcGMp7DKpSf8hnxcI94rV8PfhiIzMIBlE21xQZ75nVOK2MP
 3Yk8XFa8PE4eG6I7+6drhAXrJBk83CqhPlVvGTlvogIdOvsmAKP1CpkyHjY/r4AN81VP2g6Z9
 7pAwOtGPkjeMJoJXW7CfVycpbqFoWCkQShlgJJ/XwBD1DJ0a/Rfwb/RJMXtWFhca+SS60+uyx
 J4DH8wsu2QFQy6ZMTgg0r8nHD7Wrd/sZzGQFOGeHsmcKZqhBTm2Kc1rDiI2UTJXKlOAWGLdAI
 G72UpnIuvZnFMnu/2DX8sYxCDBfTaYYGc9maaUj7oAYTbe/A7xCoaNRBNtgQJrjXgqVM33sAB
 295Ly4KIYfPjvp6HoeM/crhILlL9yRon+Qyl9gZYHUagOU7txe0G4RylRnwdc7ZBj/O+FVhby
 lQ/55JtM7ia1o9sEccIIiIPmFEERqWgJzmayW+2m162QqibEovB4fHa8PDmQm6hNtpI9ZagRY
 byc/O/bjptNN/HODkghbrNjMc+7MRKuWm9ngIBeW87NNOFZQMVUiDn0ETqc27N0FNgvHpD8or
 3js8GVvDlS4vKk=
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Eike,

On 3/9/22 15:56, Rolf Eike Beer wrote:
> Some recent patches made me aware of DEBUG_VM_PGTABLE. Has anyone tried =
to get
> this working on hppa?

No, I haven't tried yet.

> Given the constant problems with caches and memory it
> may help find some subtle bugs in the code.

I'm sure it makes sense to make it work and test it once.
Will you try?

Helge

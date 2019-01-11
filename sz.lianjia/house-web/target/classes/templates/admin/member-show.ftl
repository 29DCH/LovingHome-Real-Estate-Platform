<@admin_common.meta/>
<title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
	<img class="avatar size-XL l" src="${(user.avatar)!}">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18">${(user.name)!}</span>
		</dt>
		<dd class="pt-10 f-12" style="margin-left:0">${(user.aboutme=='')?string("这家伙很懒，什么也没有留下", user.aboutme)}</dd>
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
			<tr>
				<th class="text-r">手机：</th>
				<td>${(user.phone)!}</td>
			</tr>
			<tr>
				<th class="text-r">邮箱：</th>
				<td>${(user.email)!}</td>
			</tr>
			<tr>
				<th class="text-r">注册时间：</th>
				<td>${(user.createTime?date)!}</td>
			</tr>
		</tbody>
	</table>
</div>
<@admin_common.footer/>
</body>
</html>
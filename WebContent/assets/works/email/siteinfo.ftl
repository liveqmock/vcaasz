<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>会畅通讯 - 会议系统</title>
		<style type="text/css">
			*{margin: 0;padding: 0;font-family: 'Microsoft Yahei','微软雅黑','宋体';}
			html, body{background: #FFFFFF;font-size: 12px;}
			body{padding: 5px;}

			a, a:link, a:visited{color: #0172FE;text-decoration: none;}

			a:hover,.underline{text-decoration: underline!important;}

			.common-table{border-collapse: collapse;border-spacing: 0;width: 100%;}

			.common-table th,.common-table td{border: 1px solid #A5A19E;padding: 8px 15px;text-align: center;}

			.common-table th.name ,.common-table td.name{width: 130px;background-color: #E3F0FF;font-weight: bold;text-align: left;}

			.box{margin-top: 15px;}

			.box .box-head{font-weight: bold;padding: 10px 20px;background: transparent url(http://meeting.confcloud.cn/assets/images/email/item.jpg) 5px center no-repeat;}

			.box .support{line-height: 24px;margin-bottom: 20px;}

			.box .support b{color: #003672;}

			.language{text-align: right;padding: 10px 0;}

			#header, #content, #footer{width: 670px;margin: 0 auto;}

			#header{height: 110px;background: #003674 url(http://meeting.confcloud.cn/assets/images/email/logo.jpg) 0 center no-repeat;}

			#footer {text-align: right;padding: 50px 0 10px;font-size: 22px;font-weight: bold;font-family: 'Microsoft Yahei';color: #003576;}

			#title{text-align: center;}

			#title h1{font-size: 16px;padding: 15px 0 10px;}

			#title h3 a{color: #003672;font-size: 14px;}
			#details{width: 610px;margin: 10px auto;padding-top: 25px;border-top: 1px solid #CCCCCC;}
			#details .desc{margin-top: 10px;}
			#details .instruct{margin-bottom: 10px;}
		</style>
	</head>
	<body>
		<div id="header"></div>
		<div id="content">
			<div class="wrapper">
				<p class="language"><a href="" class="underline">English Version</a></p>
				<div id="title">
					<h1>欢迎使用会畅通讯商会云会议中心</h1>
					<h3><a href="">企业站点信息</a></h3>
				</div>
				<div id="details">
					<p class="honorific"><b>尊敬的${userBase.trueName}，您好！</b></p>
					<p class="desc">感谢您使用商会云企业管理平台，您可以点击 <a href="http://${siteBase.siteSign}.confcloud.cn/admin"  class="underline">商会云企业管理</a> 登录系统。</p>
					<div class="box">
						<div class="box-head">您的企业站点相关信息如下：</div>
						<div class="box-body">
							<table class="common-table">
								<tbody>
									<tr>
										<td class="name">企业名称</td>
										<td class="value">${siteBase.siteName}</td>
									</tr>
									<tr>
										<td class="name">站点时区</td>
										<td class="value">${timezone}</td>
									</tr>
									<tr>
										<td class="name">站点类型</td>
										<td class="value">
											<#if siteBase.siteFlag==1>
										             正式
										         <#else>
										            试用
										    </#if>
										</td>
									</tr>
									<tr>
										<td class="name">租用模式</td>
										<td class="value">
											 <#if siteBase.hireMode==1>
										            包月
										         <#else>
										            记时  
										         </#if>
										</td>
									</tr>
									<tr>
										<td class="name">计费类型</td>
										<td class="value">
											<#if siteBase.chargeMode==1>
									            name host
									        <#elseif siteBase.chargeMode==2>
									            active user
									        <#elseif siteBase.chargeMode==3>
									            seats
									        <#elseif siteBase.chargeMode==4>
									            meeting time
									        <#else>
									            user time
									        </#if>
										</td>
									</tr>
									<tr>
										<td class="name">最大点数</td>
										<td class="value">${siteBase.license}</td>
									</tr>

									<tr>

										<td class="name">站点生效日期</td>

										<td class="value">${siteBase.effeDate?string("yyyy-MM-dd")}</td>

									</tr>

									<tr>

										<td class="name">站点到期日期</td>

										<td class="value">${siteBase.expireDate?string("yyyy-MM-dd")}</td>

									</tr>

								</tbody>

							</table>

						</div>

					</div>



					<div class="box">

						<div class="box-head">您的账号信息如下：</div>

						<div class="box-body">

							<table class="common-table">

								<tbody>

									<tr>

										<td class="name">登录名</td>

										<td class="value">${userBase.loginName}</td>

									</tr>

									<tr>

										<td class="name">密码</td>

										<td class="value">${userBase.loginPass}</td>

									</tr>

									<tr>

										<td class="name">用户名</td>

										<td class="value">${userBase.trueName}</td>

									</tr>

									<tr>

										<td class="name">邮箱</td>

										<td class="value">${userBase.userEmail}</td>

									</tr>

								</tbody>

							</table>

						</div>
					</div>
					<div class="box">
						<div class="box-head">技术支持：</div>
						<div class="box-body">
							<div class="support">
								<a href=""><b>会畅通信</b></a>提供全天候的客户服务，如果您在会议使用中有任何问题，可以参考<a href="http://www.confcloud.cn/help">用户手册</a>！
								如果无法接入会议，或者在会议过程中遇到任何问题，可通过以下方式联系我们的客服人员：
							</div>

							<div class="instruct">电话：<b>400 082 6161</b></div>

							<div class="instruct">邮箱：<a class="underline" href="mailto:cs@confcloud.cn">cs@confcloud.cn</a></div>

							<div class="welcome"><b>欢迎访问上海会畅通信股份有限公司官网 <a href="http://www.bizconf.cn/">www.bizconf.cn</a></b></div>

						</div>

					</div>

				</div>

			</div>

		</div>

		<div id="footer">上海会畅通讯股份有限公司</div>

	</body>

</html>
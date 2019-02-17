<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/StudentInfo.css" />
</head>
<body>
	<center>
		<div class="container flgure">
			<div class="content">
				<div class="basic">
					<div class="basicInfo select active">
						<div class="thead">
							<form action="listAllTraffic.action" method="post">
								<span><input type="file"><input type=submit
									id="a" value="判别"></span> <span><input type="textfield"
									name="filePath" style="height: 35px; width: 80%;"><input
									type=submit value="判别" style="height: 35px; width: 10%;"></span>
							</form>
						</div>

						<div class="table">
							<s:if test="#request.pageBean.list.size>0">
								<div class="thead">
									<span>流量总条数:<s:property value="#request.pageBean.allRow" /></span>
									<p>Tor流量初步判别结果</p>
								</div>
								<table border="1" class="tab_css_1" width="80%">
									<tr>
										<th>序号</th>
										<th>源IP</th>
										<th>源端口</th>
										<th>目的IP</th>
										<th>目的端口</th>
										<th>协议</th>
										<th>是否为Tor</th>
									</tr>
									<s:iterator value="#request.pageBean.list" id="traffic">
										<tr class="tr_css" align="center">
											<td><s:property value="#traffic.id" /></td>
											<td><s:property value="#traffic.sourceIP" /></td>
											<td><s:property value="#traffic.sourcePort" /></td>
											<td><s:property value="#traffic.destinationIP" /></td>
											<td><s:property value="#traffic.destinationPort" /></td>
											<td><s:property value="#traffic.protocol" /></td>
											<td><s:property value="#traffic.tor" /></td>
											<%-- <td>
									<s:a href="itemPreUpdate.action?itemid=%{#item.iid}">修改</s:a>
									</td> --%>

										</tr>
									</s:iterator>
								</table>

								<s:iterator value="#request.pageBean" id="pageBean">
									<tr>
										<td colspan="6" align="center" bgcolor="#5BA8DE">共<s:property
												value="#pageBean.allRow" />条记录 &nbsp; &nbsp;&nbsp;&nbsp; 共<s:property
												value="#pageBean.totalPage" />页 &nbsp;&nbsp;&nbsp; 当前第<s:property
												value="#pageBean.currentPage" />页<br>
											<form action="listAllTraffic.action" method="post">
												 <span>跳转到第<input type="text" name="page" style="height: 35px; width: 10%;">页
												 <input type=submit value="跳转" style="height: 35px; width: 10%;"></span>
											</form> 
											<s:if
												test="%{#pageBean.currentPage == 1}">
								           第一页  &nbsp;&nbsp;上一页&nbsp;&nbsp;
								         </s:if> <!-- currentPage为当前页 --> <s:else>
												<a href="/torweb/listAllTraffic.action?page=1">第一页</a>&nbsp;&nbsp;
								           <a
													href="/torweb/listAllTraffic.action?page=<s:property value="%{#pageBean.currentPage-1}"/>">上一页</a>&nbsp;&nbsp;
								         </s:else> <s:if
												test="%{#pageBean.currentPage != #pageBean.totalPage}">
												<a
													href="/torweb/listAllTraffic.action?page=<s:property value="%{#pageBean.currentPage+1}"/>">下一页</a>&nbsp;&nbsp;
								         <a
													href="/torweb/listAllTraffic.action?page=<s:property value="#pageBean.totalPage"/>">最后一页</a>
											</s:if> <s:else>
								         &nbsp;&nbsp;下一页  &nbsp;&nbsp;最后一页
								         </s:else>
										</td>
									</tr>
								</s:iterator>



							</s:if>
							<s:else>
								<font size="4" color="red">没有查询到任何记录</font>
							</s:else>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<script src="js/jquery-1.9.1.min.js"></script>
	</center>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://snake8859.top/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>林业信息工程课设</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">林业信息资源管理平台v1.0</a>
		</div>
		
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="查询内容...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					<li><a href="forestIndex.action" class="active"><i
							class="fa fa-edit fa-fw"></i>资源管理</a></li>
					<li><a href="mapIndex.action"><i
							class="fa fa-dashboard fa-fw"></i>地图管理</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">林业资源管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">资源信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>FID</th>
									<th>资源名称</th>
									<th>资源种类</th>
									<th>资源形态特征</th>
									<th>资源产地环境</th>
									<th>资源生长习性</th>
									<th>资源图片</th>
									<th>贡献者</th>
									<th>操作</th>
								</tr>
							</thead>
							<%-- <tbody>
									<tr>
										<td>1</td>
										<td>桂花</td>
										<td>木犀属</td>
										<td>质坚皮薄，叶长椭圆形面端尖，对生，经冬不凋。花生叶腑间，花冠合瓣四裂，形小。</td>
										<td>中国西南部、四川、陕南、云南、广西、广东、湖南、湖北、江西、安徽、河南等地，均有野生桂花生长，现广泛栽种于淮河流域及以南地区，其适生区北可抵黄河下游，南可至两广、海南等地。</td>
										<td>桂花适应于亚热带气候地区。性喜温暖，湿润。</td>
										<td>
											<img src="http://localhost:8080/forestPic/forest_guihua.jpg" style="width: 150px;height: 150px" alt="" />
											<img src="http://localhost:8080/forestPic/forest_guihua2.jpg" style="width: 150px;height: 150px" alt="" />
										</td>
										<td>snake8859</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#forestEditDialog" onclick="editCustomer(${row.id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteForest(${row.id})">删除</a>
										</td>
									</tr> 
							</tbody>--%>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.fid}</td>
										<td>${row.fName}</td>
										<td>${row.fType}</td>
										<td>${row.fForm}</td>
										<td>${row.fOrigin}</td>
										<td>${row.fGrowthHabit}</td>
										
										<td>
										<c:set value="${row.forestPicList }" var="forestPic"></c:set>
											<c:forEach items="${forestPic }" var="pic">
												<img src="http://www.snake8859.top:8080/forestPic/${pic.pictureName}" style="width: 150px;height: 150px" alt="" />
											</c:forEach>
										</td>
										<td>${row.creater}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#forestEditDialog" onclick="editForest('${row.fid}')">修改</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/forest/forestIndex.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 编辑对话框 -->
	<div class="modal fade" id="forestEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改资源信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_forest_form">
						<input type="hidden" id="fid" name="fid"/>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">资源名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="fName" placeholder="资源名称" name="fName">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">资源种类</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="fType" placeholder="资源种类" name="fType">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">资源形态特征</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="fForm" placeholder="资源形态特征" name="fForm">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">资源产地环境</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="fOrigin" placeholder="资源产地环境" name="fOrigin">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">资源生长习性</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="fGrowthHabit" placeholder="资源生长习性" name="fGrowthHabit">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">修改者</label>
							<div class="col-sm-10">
							<%
								String username=(String)session.getAttribute("username"); //获取保存在session范围内的用户名
							%>
								<input type="text" class="form-control" id="mender" placeholder="修改者" name="mender" value="<%=username%>">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateForest()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		function editForest(id) {
			//console.log("xxxxx");
			var params = '{"id": '+'"'+id+'"'+'}';
			$.ajax({
				type:"post",
				url:"<%=basePath%>forest/queryForestInformation.action",
				data:params,
				contentType : "application/json;charset=UTF-8",
				dataType : "json",//回调
				success:function(data) {
					$("#fid").val(data.fid);
					$("#fName").val(data.fName);
					$("#fType").val(data.fType)
					$("#fForm").val(data.fForm)
					$("#fOrigin").val(data.fOrigin)
					$("#fGrowthHabit").val(data.fGrowthHabit);
				}
			});
		}
		function updateForest() {
			$.post("<%=basePath%>forest/editForestInfo.action",$("#edit_forest_form").serialize(),function(data){
				alert("资源信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteForest(id) {
			if(confirm('确实要删除该资源吗?')) {
				$.post("<%=basePath%>",{"id":id},function(data){
					alert("资源删除更新成功！");
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>

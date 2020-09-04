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
<!DOCTYPE html>
<html>
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


  <style>
        html, body, #container {
            height: 100%;
            width: 100%;
        }

        .content-window-card {
            position: relative;
            box-shadow: none;
            bottom: 0;
            left: 0;
            width: auto;
            padding: 0;
        }

        .content-window-card p {
            height: 2rem;
        }

        .custom-info {
            border: solid 1px silver;
        }

        div.info-top {
            position: relative;
            background: none repeat scroll 0 0 #F9F9F9;
            border-bottom: 1px solid #CCC;
            border-radius: 5px 5px 0 0;
        }

        div.info-top div {
            display: inline-block;
            color: #333333;
            font-size: 14px;
            font-weight: bold;
            line-height: 31px;
            padding: 0 10px;
        }

        div.info-top img {
            position: absolute;
            top: 10px;
            right: 10px;
            transition-duration: 0.25s;
        }

        div.info-top img:hover {
            box-shadow: 0px 0px 5px #000;
        }

        div.info-middle {
            font-size: 12px;
            padding: 10px 6px;
            line-height: 20px;
        }

        div.info-bottom {
            height: 0px;
            width: 100%;
            clear: both;
            text-align: center;
        }

        div.info-bottom img {
            position: relative;
            z-index: 104;
        }

        span {
            margin-left: 5px;
            font-size: 11px;
        }

        .info-middle img {
            float: left;
            margin-right: 6px;
        }
 </style>

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

				<div id="container" style="width: 1300px; height: 950px"></div>

			</div>
			<!-- /.row -->

		</div>
		<!-- /#page-wrapper -->

	</div>

	<!-- 高德地图 -->
	<script type="text/javascript"
		src="https://webapi.amap.com/maps?v=1.4.12&key=a026a4588e1e77ecc0b7ee44b6e6c188"></script>
	<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
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

	<script type="text/javascript">    //地图初始化时，在地图上添加一个marker标记,鼠标点击marker可弹出自定义的信息窗体
			//初始化地图对象，加载地图
		    var map = new AMap.Map("container", {resizeEnable: true});
		    var positions = new Array();
		    var fNameList = new Array();
		    var fTypeList =  new Array();
		    var imageName = new Array();
		    var content = [];
			$.ajax({
				type:"post",
				url:"<%=basePath%>forest/queryMapInfo.action",
				async: false, 
				contentType : "application/json;charset=UTF-8",
				dataType : "json",//回调
				success:function(data) {
					console.log(data);
					for(var i =0;i<data.length;i++){
						//取出经纬度
						positions.push(data[i].longitude);
						positions.push(data[i].latitude);
						//取出资源名称
						fNameList.push(data[i].fName);
						//取出资源类别
						fTypeList.push(data[i].fType);
						//取出图片名称
						imageName.push(data[i].forestPicList[0].pictureName);
					}
				}
			});
		     var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});
		    
		  addMarker();
		  function addMarker() {
		    for(var i = 0, j =0;i<positions.length;i=i+2,j++){ 
		        var marker = new AMap.Marker({
		            position: [positions[i],positions[i+1]],
		            map: map
		        });
		        marker.content = '资源名称:<span style="font-size:11px;color:#F00;">'+fNameList[j]+'</span><br>';
		        marker.content +='资源所属种类:<span style="font-size:11px;color:#F00;">'+fTypeList[j]+'</span><br>';
		        marker.content +="<img style='width: 150px;height: 150px' src='http://www.snake8859.top:8080/forestPic/"+imageName[j]+"'><br>";
		        marker.on('click', markerClick);
		        marker.emit('click', {target: marker});
		    }
		  }
		  function markerClick(e) {
		        infoWindow.setContent(e.target.content);
		        infoWindow.open(map, e.target.getPosition());
		    } 
		    map.setFitView();
</script>

</body>

</html>

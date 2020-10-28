<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="fr">
<head>
<style type="text/css">

img.image{width:160px; height:160px;}



</style>
<meta charset="windows-1252">
<!-- for : UseCase SCC-->
<!-- Bootstrap 3.3.2 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link href="plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link href="dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css" />

<jsp:include page="title.jsp"></jsp:include>
</head>
<body class="skin-blue sidebar-mini">
	<jsp:include page="header.jsp"></jsp:include>

	<!--wrapper-->
	<div class="wrapper">

	
		<jsp:include page="main.jsp"></jsp:include>
		
		<jsp:include page="${sessionScope.toPage}"></jsp:include>

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
	<!-- /.wrapper -->
	<jsp:include page="script.jsp"></jsp:include>
</body>
</html>
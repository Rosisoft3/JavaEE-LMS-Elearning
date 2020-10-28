<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>
<sql:query dataSource="${snapshot}" var="result">
SELECT * from document where document.id_document=${sessionScope.id_document};
</sql:query>

<meta charset="windows-1252">
</head>
<body class="skin-blue sidebar-mini">
	<!--wrapper-->
	<div class="wrapper">
	

		<!-- Content Wrapper. Contains page content -->

<div class="content-wrapper">
	<!-- Content Wrapper. Contains page content -->
	<!-- Content Header (Page header) -->
	
	
	
	
	<section class="content-header">
	
	<h1>Bienvenue</h1>
	<ol class="breadcrumb">
		<li class="active"><a href="Accueil"><i class="fa fa-dashboard"></i>
				Home</a></li>

	</ol>
	</section>
	<!-- Main content -->
	

	
	<section class="content"> <!-- Info boxes"-->
	
	<div class="row">
		<div class="col-md-6">
			<div class="box box-solid">
				<div class="box-header with-border">
					<i class="fa fa-user"></i>
					<h3 class="box-title">A propos</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div>
					
					<c:forEach var="row" items="${result.rows}">
						<dl class="dl-horizontal">

							<!-- Le profil -->


							
							<dt>Nom:</dt>
							<dd>${row.nom_doc}</dd>
							<dt>type:</dt>
							<dd>${row.type}</dd>
							<dt>format:</dt>
							<dd>${row.format}</dd>
							</dl>
							</c:forEach>
							
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>



	</div>
	<!-- .row --> </section>
</div>
<!-- /. content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
</html>



<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM document where id_document = ${sessionScope.id_document}
</sql:query>


<meta charset="windows-1252">
</head>
<body class="skin-blue sidebar-mini">
	<!--wrapper-->
	<div class="wrapper">


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Consulter Document 
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Liste Documents</a></li>
				<li class="active">Consulter Document</li>
			</ol>
			</section>
			
			
			                   
          
                    

			<!-- Main content -->
			<section class="content"> <!-- Default box -->
			  <c:forEach var="row" items="${result.rows}" varStatus="r">
			<div class="box">
				<div class="box-header with-border">
				
					<h3 class="box-title"><c:out value="${row.nom}"/></h3>
					<div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse"
							data-toggle="tooltip" title="Collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button class="btn btn-box-tool" data-widget="remove"
							data-toggle="tooltip" title="Remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="box-body">
					<embed width="100%" height="700" name="plugin"
						src="<c:out value="${row.doc}"/>" type="application/pdf">
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<a type="button" href="<c:out value="${row.doc}"/>" class="btn btn-primary">Télécharger</a>
				</div>
				<!-- /.box-footer-->
			</div>
			</c:forEach>
			<!-- /.box --> </section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- /. content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
<c:remove var="id_document" scope="session" />

</html>
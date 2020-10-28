<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>
<sql:query dataSource="${snapshot}" var="result">
SELECT * from profil where id_profil='${sessionScope.id_profil2}';
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
                           
                            <dt>Photo:</dt>
							<dd>
								<div id="avatar_edit" class="element-select">
									<div class="avatar" data-toggle="modal" href="#avatarModal"
										role="alertdialog">
										<img class="memberAvatar" alt="Photo"
											src="${row.photo}">
									</div>
								</div>
							</dd>
                            

							
							<dt>type:</dt>
							<dd>${row.type}</dd>
							<dt>sexe:</dt>
							<dd>${row.sexe}</dd>
							<dt>login:</dt>
							<dd>${row.login}</dd>
							<dt>nom:</dt>
							<dd>${row.nom}</dd>
							<dt>prenom:</dt>
							<dd>${row.prenom}</dd>
							<dt>adresse:</dt>
							<dd>${row.adresse}</dd>
							<dt>e_mail:</dt>
							<dd>${row.e_mail}</dd>
							<dt>date de naissance:</dt>
							<dd>${row.date_de_naissance}</dd>
							<dt>lieu de naissance:</dt>
							<dd>${row.lieu_de_naissance}</dd>
							<dt>telephone:</dt>
							<dd>${row.telephone}</dd>
							
							
							
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



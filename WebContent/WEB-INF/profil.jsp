<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

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
	
	<h1>Profil</h1>
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
						<dl class="dl-horizontal">

							<!-- Le profil -->


							<dt>Photo:</dt>
							<dd>
								<div id="avatar_edit" class="element-select">
									<div class="avatar" data-toggle="modal" href="#avatarModal"
										role="alertdialog">
										<img class="image" alt="Photo"
											src="${sessionScope.profil.photo }">
									</div>
								</div>
							</dd>

							<dt>Nom:</dt>
							<dd>${sessionScope.profil.nom}</dd>
							<dt>Prénom:</dt>
							<dd>${sessionScope.profil.prenom}</dd>
							<dt>Email:</dt>
							<dd>${sessionScope.profil.e_mail}</dd>
							<dt>Téléphone:</dt>
							<dd>${sessionScope.profil.telephone}</dd>
							<dt>Type:</dt>
							<dd>${sessionScope.profil.type}</dd>
							<dt>Statut:</dt>
							<dd>${sessionScope.typeProfil}</dd>
						</dl>
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



<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT profil.nom, profil.prenom, enseignant.statut, enseignant.id_enseignant FROM profil INNER JOIN enseignant ON enseignant.id_profil=profil.id_profil where enseignant.id_enseignant=${sessionScope.ID_ENSEIGNANT };
</sql:query>

<sql:query dataSource="${snapshot}" var="result2">

SELECT * FROM module ;
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
	
	<h1>Modifier Statut</h1>
	<ol class="breadcrumb">
		<li ><a href="Accueil"><i class="fa fa-dashboard"></i>
				Home</a></li>
			<li>Liste Enseignants</li>
			<li class="active">Modifier Statut</li>
	</ol>
	</section>
	<!-- Main content -->
	

	
	<section class="content"> <!-- Info boxes"-->
	
	<div class="row">
	
	
	
		<div class="col-md-6">
			<div class="box box-solid">
				<div class="box-header with-border">
					<i class="fa fa-user"></i>
					<h3 class="box-title">Modifier statut</h3>
				</div>
				<!-- /.box-header -->
				
				<form action="ModifierStatutServlet">
				<div class="box-body">
					<div>
						<dl class="dl-horizontal">

							<!-- Le profil -->

							<input type="hidden" name="id_enseignant" value="" />
							
					<c:forEach var="row" items="${result.rows}">
							<dt>Nom:</dt>
							<dd>${row.nom}</dd>
							<dt>Prénom:</dt>
							<dd>${row.prenom}</dd>

							<dt>Statut:</dt>
							<dd><select name="statut">
								<option  value="Tuteur">Tuteur </option>
								<option value="Auteur">Auteur </option>
							</select></dd>
					</c:forEach>
							
							<dt>Module:</dt>
							
							<dd><select name="module">
							         
                                <c:forEach var="rows2" items="${result2.rows}">
								<option  value="${rows2.id_module}"> <c:out value="${rows2.nom_module}" /> </option>
							
							</c:forEach>
							</select></dd>
							
							
							
						</dl>
					</div>
				</div>
				<!-- /.box-body -->
				
				<div class="box-footer">
				<input type="submit" value="Envoyer" class="btn btn-primary" /> 
				</div>
				
				
				</form>
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



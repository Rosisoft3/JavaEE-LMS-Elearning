<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Créer Test <small>Auteur</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Créer test</li>

			</ol>
			</section>

			<!-- Main content -->
			<section class="content">

			<div class='row'>
				<div class='col-md-12'>
					<div class='box box-info'>
						<div class='box-header'>
							<h3 class='box-title'>
								Nouveau test 
							</h3>
							<!-- tools box -->
							<div class="pull-right box-tools">
								<button class="btn btn-info btn-sm" data-widget='collapse'
									data-toggle="tooltip" title="Collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button class="btn btn-info btn-sm" data-widget='remove'
									data-toggle="tooltip" title="Remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
							<!-- /. tools -->
						</div>
						<!-- /.box-header -->
						<form action="CreerTestServlet" method="post">
							<div class='box-body pad'>

								<div class="form-group">
									<label>Nom du test:</label> <input name="nom"
										kl_virtual_keyboard_secure_input="on" class="form-control"
										placeholder="Enter ..." type="text">
								</div>
								<label>Type du test:</label></br>
								<input type="radio" name="type" value="Examen" selected>Examen</br>
								<input type="radio" name="type" value="Interrogation">Interrogation</br>
								
								<c:forEach var="i" begin="1" end="4" >
								
								<div class="form-group">
									<div class="form-group has-success">
										<label class="control-label" for="inputSuccess"></br>
											Question <c:out value="${i}" /> </label> <input name="quest-${i}" kl_virtual_keyboard_secure_input="on"
											class="form-control" id="inputSuccess"
											placeholder="Enter ..." type="text">
									</div>
									
								<c:forEach var="j" begin="1" end="3" step="1"> 
									<div class="form-group">
										
										<div class="form-group">
											<label>Reponse <c:out value="${j}"/> :</label> <input name="${i}-rep-${j}"
												kl_virtual_keyboard_secure_input="on" class="form-control"
												placeholder="Enter ..." type="text">

														
							<input name="valeur_rep-<c:out value="${i}"/>" value="<c:out value="${j}"/>" type="radio">						 
													 
												
										</div>
									</div>
								</c:forEach>
							</c:forEach>
							
							
						

							</div>
							<div class="box-footer">
								<input type="submit" class="btn btn-primary" value="Envoyer">
							</div>
						</form>
					</div>
					<!-- /.box -->

				</div>
				<!-- /.col-->
			</div>
			<!-- ./row --> </section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
</html>
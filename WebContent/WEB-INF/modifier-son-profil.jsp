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
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Modifier Profil</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Modifier Profil</li>
			</ol>
			</section>
			<!-- Main content -->
			<section class="content"> <!-- Info boxes -->

			<c:choose>
			<c:when test="${sessionScope.typeAlert == 'Danger'}">
              <jsp:include page="alert-danger.jsp"></jsp:include> 
               <c:remove var="typeAlert" scope="session" />
    		</c:when>
			<c:when test="${sessionScope.typeAlert == 'Success'}">
        	<jsp:include page="alert-success.jsp"></jsp:include> 
        	<c:remove var="typeAlert" scope="session" />
    		</c:when>
    					<c:when test="${sessionScope.typeAlert == 'Info'}">
        	<jsp:include page="alert-info.jsp"></jsp:include> 
        	<c:remove var="typeAlert" scope="session" />
    		</c:when>
    		
    		<c:when test="${sessionScope.typeAlert == 'Warning'}">
        	<jsp:include page="alert-warning.jsp"></jsp:include> 
        	<c:remove var="typeAlert" scope="session" />
    		</c:when>
    		
			</c:choose> 


			<div class="row">
			

			
			
			
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">${sessionScope.profil.login}</h3>
						</div>
						<!-- /.box-header -->
						<!-- form start -->
						
						
						<form role="form" action="UploadDownloadFileServlet?dir=photo" method="post" enctype="multipart/form-data">
						<div class="box-body">
						<div class="form-group">
									<label>Photo</label>
								<div id="avatar_edit">
									<div class="avatar" data-toggle="modal" href="#avatarModal"
										role="alertdialog">
										<img class="image" alt="Photo"
											src="${sessionScope.profil.photo}"  /> </br>
											<input kl_virtual_keyboard_secure_input="on" id="exampleInputFile" type="file" name="fileName" required="required" >
									</div>
								</div>
									<input type="submit" value="Upload">
								</div>
						

						</div>
						</form>
						
						
   
						
						
						<form role="form" action="ModifierSonProfilServlet" method="post">
							<div class="box-body">
								<input type="hidden" name="ID_PROFIL" value="${sessionScope.profil.id}">
							
							



								<label>E-mail actuelle</label>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope"></i></span> <input name="email" value="${sessionScope.profil.e_mail}"
										kl_virtual_keyboard_secure_input="on" class="form-control"
										placeholder="Enter email" type="text" required="required">
								</div>

								<label>Login</label>
								<div class="input-group">
									<span class="input-group-addon">@</span> <input name="username"
												value="${sessionScope.profil.login}"
										kl_virtual_keyboard_secure_input="on" class="form-control"
										placeholder="Username" type="text" required="required">
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Nouveau mot de passe</label>
									<input kl_virtual_keyboard_secure_input="on" name="motdepasse" value="${sessionScope.profil.mp}"
										class="form-control" id="exampleInputPassword1"
										placeholder="Password" type="password" required="required">
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Confirmer</label> <input name="confirme" value="${sessionScope.profil.mp}"
										kl_virtual_keyboard_secure_input="on" class="form-control"
										id="exampleInputPassword2" type="password" required="required">
								</div>

								<div class="form-group">
									<label>Téléphone</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-phone"></i>
										</div>
										<input name="telephone" kl_virtual_keyboard_secure_input="on"
											class="form-control" value="${sessionScope.profil.telephone}"
											data-inputmask="&quot;mask&quot;: &quot;(999) 999-999999&quot;"
											data-mask="" type="text" required="required">
									</div>
									<!-- /.input group -->
								</div>

								<div class="form-group">
									<label>Adresse</label> <input name="adresse"
										kl_virtual_keyboard_secure_input="on" class="form-control"
										placeholder="Enter ..." type="text" value="${sessionScope.profil.adresse}" required="required">
								</div>

							</div>
							<!-- /.box-body -->

							<div class="box-footer">
								<input type="submit" class="btn btn-primary" value="Envoyer">
							</div>
						</form>
					</div>
					<!-- /.box -->



				</div>
			</div>


			</section>
		</div>
		<!-- /. content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
</html>

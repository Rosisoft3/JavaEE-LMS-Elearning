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
				<h1>
					Modifier Profil
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Liste profils</a></li>
					<li class="active">Modifier Profil</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->

			<div class="row">	
			<div class="col-md-12">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Username</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form action="ModifierUnProfilServlet" method="post" role="form">
                  <div class="box-body">
				  
                    <label>E-mail:</label>
					<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                    <input name="email" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter email" type="email">
                  </div>
					
					<label>Login:</label>
					<div class="input-group">
                    <span class="input-group-addon">@</span>
                    <input name="login" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Username" type="text">
                  </div>
				  
					<div class="form-group">
                      <label for="exampleInputPassword1">Mot de passe:</label>
                      <input name="mp" kl_virtual_keyboard_secure_input="on" class="form-control" id="exampleInputPassword1" placeholder="Password" type="text">
                    </div>
					
							<div class="form-group">
                      <label>Nom:</label>
                      <input name="nom" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter ..." type="text">
                    </div>
					
							<div class="form-group">
                      <label>Prénom:</label>
                      <input name="prenom" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter ..." type="text">
                    </div>
					
					<div class="form-group">
					<label>Sexe:</label>
                      <div class="radio">
                        <label>
                          <input name="optionsRadios" id="optionsRadios1" value="homme" checked="" type="radio">
                         Homme
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input name="optionsRadios" id="optionsRadios2" value="femme" type="radio">
                         Femme
                        </label>
                      </div>
                    </div>
					
					<label>Date de naissance:</label>
					<div class="input-group">
                      <div class="input-group-addon">
                        <i class="fa fa-calendar"></i>
                      </div>
                      <input name="date" kl_virtual_keyboard_secure_input="on" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" type="text">
                    </div>
										
					<div class="form-group">
                    <label>Téléphone:</label>
                    <div class="input-group">
                      <div class="input-group-addon">
                        <i class="fa fa-phone"></i>
                      </div>
                      <input name="telephone" kl_virtual_keyboard_secure_input="on" class="form-control" data-inputmask="&quot;mask&quot;: &quot;(999) 999-999999&quot;" data-mask="" type="text">
                    </div><!-- /.input group -->
                  </div>
					
					<div class="form-group">
                      <label>Adresse:</label>
                      <input name="adresse" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter ..." type="text">
                    </div>
					
					<div class="form-group">
                      <label>Lieu de naissance:</label>
                      <input name="lieu" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter ..." type="text">
                    </div>
					
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Envoyer</button>
                  </div>
                </form>
              </div><!-- /.box -->

              

            </div>
			</div>	
				

			</section>
		</div>
		<!-- /. content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
</html>

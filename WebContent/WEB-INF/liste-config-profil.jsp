<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from profil;
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
					Les profils
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Liste profils</li>
				</ol>
			</section>
			
			
			
				<!-- Ajouter frame-->
			<section id="gestion_Document">
			<div id="document_edit">
          
          
            <div class="modal" id="ajouter" aria-hidden="true" style="display: none;">
			
			<div class="modal-body">
			
			
			<div style="left:25%;" class="col-md-6">

              <div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">Nouveau Profil</h3>
								<div class="box-tools pull-right">
								</div>
							</div>
							<!-- /.box-header -->

			   <!-- form start -->
                <form role="form" action="AjouterProfilServlet">
                  <div class="box-body">
				  					
				  
				  
                    <label>E-mail:</label>
					<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                    <input name="email" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter email" type="text">
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
                      <label>Lieu de naissance:</label>
                      <input name="lieu" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter ..." type="text">
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
					<label>Type : </label>
					<select name="liste" onChange="afficherAutre()">
					<option value="Etudiant">Etudiant</option>
					<option value="Enseignant">Enseignant</option>
					<option value="Responsable">Responsable</option>
					</select>
					</div>
    					
								</div>
							<!-- ./box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Envoyer</button>
                  </div>
                </form>
              </div><!-- /.box -->

            </div>
			
			</div>
			</div>
            </div>
			</section>
			
			
			
			
			<!-- Main content -->
        <section class="content">
        <c:choose>
				<c:when test="${sessionScope.typeAlert == 'Danger'}">
					<jsp:include page="alert-danger.jsp"></jsp:include>
					<c:remove var="typeAlert" scope="session" />
				</c:when>
				<c:when test="${sessionScope.typeAlert == 'Success'}">
					<jsp:include page="alert-success.jsp"></jsp:include>
					<c:remove var="typeAlert" scope="session" />
				</c:when>
			</c:choose>
        
          <div class="row">
            <div class="col-md-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">La liste des profils</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                      	<th>N° </th>
                        <th>Login</th>
                        <th>Password</th>
						<th>Type</th>
						<th>Nom</th>
						<th>Prénom</th>
                        <th>Sexe</th>
						<th>Email</th>
						<th>Date N</th>
						<th>Lieu N</th>
						<th>Adresse</th>
						<th>Téléphone</th>
					<th>
									<button class="btn btn-default btn-sm"  title="Nouveau document" data-toggle="modal" href="#ajouter" role="alertdialog"  >
										<i class="fa fa-plus-square"></i>
									</button>
					  		
					   </th>

                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="row" items="${result.rows}" varStatus="r">
                     <tr>           	
                      <td><c:out value="${r.count }"></c:out></td>                        
                        
                      <td><c:out  value="${row.login } " /></td> 
                        <td><c:out value="${row.mp}"/></td>
                        <td><c:out value="${row.type}"/></td>
                        <td><c:out value="${row.nom}"/></td>
                        <td><c:out value="${row.prenom}"/></td>
                        <td><c:out value="${row.sexe}"/></td>
                        <td><c:out value="${row.e_mail}"/></td>
                        <td><c:out value="${row.date_de_naissance}"/></td>
                        <td><c:out value="${row.lieu_de_naissance}"/></td>
                        <td><c:out value="${row.adresse}"/></td>
                        <td><c:out value="${row.telephone}"/></td>
                        <td> 
							<a class="btn btn-default btn-sm" title="Modifier" href="ModifierUnProfilServlet?id=${row.id_profil }" ><i class="fa fa-pencil"></i></a>
							<a class="btn btn-default btn-sm" title="Supprimer" href="SupprimerProfilServlet?id=${row.id_profil }"><i class="fa fa-trash-o"></i></a>
					   </td>
					   
                      </tr>
                    </c:forEach>
                     
                    </tbody>
                  </table>
				  				  
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
		</div>
		<!-- /. content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
</html>

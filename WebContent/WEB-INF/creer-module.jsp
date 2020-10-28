<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<link rel="stylesheet" type="text/css" href="bouton_sup.css">

<sql:query dataSource="${snapshot}" var="result">
SELECT * from module;
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
					Créer Module
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Créer Module</li>
				</ol>
			</section>
			
			
			
				<!-- Ajouter frame-->
			<section id="gestion_Document">
			<div id="document_edit">
          
          
            <div class="modal" id="ajouter" aria-hidden="true" style="display: none;">
			
			<div class="modal-body">
			
			
			<div style="left:25%;" class="col-md-6">
 <div class="box box-danger">
                <div class="box-header">
                  <h3 class="box-title">Nouveau module</h3>
                </div>
                <form action="CreerModuleServlet">
                <div class="box-body">
				
				<!-- Module -->
				
				<div class="form-group">
                      <label>Module:</label>
                      <input name="nom" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Entrer ..." type="text">
                    </div>
				
           				  
				<label>Coefficient:</label>  
              <div class="calendar-time">
			  <select name="coefficient"class="hourselect">
			 	 <option value="1">1</option>
			 	 <option value="2">2</option>
			 	 <option value="3">3</option>
			 	 <option value="4">4</option>
			 	 <option value="5">5</option>
			 	 <option value="6" selected="selected">6</option>
			  </select> 
			  
			  </div>
			  <label>Niveau:</label><br>
			  <select name="niveau">
			  	<option value="2" selected="selected">L2</option>
			  	<option value="3">L3</option>
			  	<option value="4">M1</option>
			  	<option value="5">M2</option>
			  </select>
			  
			  <div class="form-group">
                      <label>Description:</label>
                      <textarea name="description" class="form-control" rows="3"  placeholder="Enter ..."></textarea>
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
			
			<!--  Supprimer module !  -->
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
                  <h3 class="box-title">La liste des modules</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                      	<th>N°</th>
                        <th>Nom</th>
                        <th>Coefficient</th>
                        <th>Niveau</th>
                        <th>Description</th>

					<th>
									<button class="btn btn-default btn-sm"  title="Nouveau module" data-toggle="modal" href="#ajouter" role="alertdialog"  >
										<i class="fa fa-plus-square"></i>
									</button>
					  		
					   </th>

                      </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="row" items="${result.rows}" varStatus="r">
                     <tr>           	
                        <td><c:out value="${r.count}"/></td>                       
                        <td><c:out  value="${row.nom_module}"/></td>
                        <td><c:out value="${row.coefficient}"/></td>
                        <td><c:out value="${row.niveau}"/></td>
                        <td><c:out value="${row.description}"/></td>
                       
                       
                        <td><a class="btn btn-default btn-sm" href="SupprimerModuleServlet?nom=${row.nom_module }" title="Supprimer"><i class="fa fa-trash-o"></i></a>

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

</body>
</html>

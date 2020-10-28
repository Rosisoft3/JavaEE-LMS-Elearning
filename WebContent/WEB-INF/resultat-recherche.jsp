<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from profil where profil.nom='${requestScope.mot_cle}' or profil.prenom='${requestScope.mot_cle}' or profil.login='${requestScope.mot_cle}';
</sql:query>
<sql:query dataSource="${snapshot}" var="result1">
SELECT * from document where document.nom_doc='${requestScope.mot_cle}';
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
					Resultats Recherche
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Resultats Recherche</li>
				</ol>
			</section>
			
			
			<!-- Main content -->
			<section class="content">
          <div class="row">
            <div class="col-xs-12">
             
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Document</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                     	
                        <th>nom </th>
                       
						<th>Type</th>
						<th>Format</th>
                        

                      </tr>
                    </thead>
                    <tbody>
                    
                     <c:forEach var="row" items="${result1.rows}">
                     <tr>           	
                        <td><a href="FicheDetaiDocumentServlet?id_document=${row.id_document}"><c:out value="${row.nom_doc}"/></a></td>                       
                        <td><c:out  value="${row.type}"/></td>
                        <td><c:out value="${row.format}"/></td>
                       
                      </tr>
                    </c:forEach>
                    
                    </tbody>
                  </table>
				  				  
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->

		<section class="content">
          <div class="row">
            <div class="col-xs-12">
             
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Profils</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                     	<th>login</th>
                        <th>nom</th>
						<th>prenom</th>
						<th>type</th>
                        

                      </tr>
                    </thead>
                    <tbody>
                    
                     <c:forEach var="row" items="${result.rows}">
                     <tr>           	
                        <td><a href="FicheDetailProfilServlet?id_profil=${row.id_profil}"><c:out value="${row.login}"/></a></td>                       
                        <td><c:out  value="${row.nom}"/></td>
                        <td><c:out value="${row.prenom}"/></td>
                        <td><c:out value="${row.type}"/></td>
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
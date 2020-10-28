<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM module INNER JOIN document ON module.id_module = document.id_module
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
					Liste Documents
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Liste Documents</li>
				</ol>
			</section>
			
			
			<!-- Main content -->
			<section class="content">
          <div class="row">
            <div class="col-xs-12">
             
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">La liste des documents</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                     	<th>N°</th>
                        <th>Titre</th>
                        <th>Module</th>
						<th>Type</th>
						<th>Format</th>
                        <th>Description</th>
						<th>Niveau</th>
						
                      </tr>
                    </thead>
                    <tbody>
                    
                     <c:forEach var="row" items="${result.rows}" varStatus="r">
                     <tr>     
                    	 <td><c:out value="${r.count }"></c:out></td>         	
                        <td><a href="ConsulterDoc?id=${row.id_document}"><c:out value="${row.nom_doc}"/></a></td>                       
                        <td><c:out  value="${row.nom_module}"/></td>
                        <td><c:out value="${row.type}"/></td>
                        <td><c:out value="${row.format}"/></td>
						<td><c:out value="${row.description}"/></td>
						<td><c:out value="${row.niveau}"/></td>
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
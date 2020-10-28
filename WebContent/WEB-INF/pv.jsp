<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT * From note INNER JOIN module ON note.id_module=module.id_module where note.id_etudiant=${sessionScope.id_etudiant}
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
					Mes Notes 
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Mes notes</li>
				</ol>
			</section>
			
			
			<!-- Main content -->
			<section class="content">
          <div class="row">
            <div class="col-xs-12">
             
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Mes notes</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                   
                        <th>Module</th>
						<th>examen</th>
						<th>interrogation</th>
                        <th>moyenne</th>
						
						
                      </tr>
                    </thead>
                    <tbody>
                    
                     <c:forEach var="row" items="${result.rows}" varStatus="r">
                     <tr>     
                    	      	
                                         
                        <td><c:out  value="${row.nom_module}"/></td>
                        <td><c:out value="${row.examen}"/></td>
                        <td><c:out value="${row.interrogation}"/></td>
						<td><c:out value="${row.moyenne}"/></td>
					
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
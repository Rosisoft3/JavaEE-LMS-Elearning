<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM document where id_enseignant=${sessionScope.enseignant.id_enseignant} ;
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
					Mes documents
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Mes documents</li>
				</ol>
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
                        <th>Type</th>
						<th>Format</th>
						<th>Document</th>
                      

					<th>
									<a class="btn btn-default btn-sm"  title="Nouveau document"  href="AjouterDoc"   >
										<i class="fa fa-plus-square"></i>
									</a>
					  		
					   </th>

                      </tr>
                    </thead>
                    <tbody>
                     			 <c:forEach var="row" items="${result.rows}" varStatus="r">
									<tr>
										<td><c:out value="${r.count }"></c:out></td>
										<td><c:out value="${row.nom_doc } " /></td>
										<td><span class="label label-success"><c:out
													value="${row.type } " /></span></td>
										<td><span class="label label-danger"><c:out
													value="${row.format}" /></span></td>
										<td><a href="<c:out value="${row.doc}"/>" >télécharger</a></td>
										<td>
											<div class="btn-group">
												<a class="btn btn-default btn-sm" title="Supprimer"
													href="SupprimerDocServlet?id=${row.id_document}"><i
													class="fa fa-trash-o"></i></a>
											</div>
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
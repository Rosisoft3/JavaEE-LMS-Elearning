<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>
<sql:query dataSource="${snapshot}" var="result">
SELECT profil.nom, profil.prenom, enseignant.statut, enseignant.id_enseignant FROM profil INNER JOIN enseignant ON enseignant.id_profil=profil.id_profil;
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
					Liste des enseignants
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Liste Enseignants</li>
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
			</c:choose> 
          
        
          <div class="row">
          
          
         
            <div class="col-md-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">La liste des enseignants</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                      <th>N°</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Statut</th>
						<th></th>

                      </tr>
                    </thead>
                    <tbody>
  					
  					 <c:forEach var="row" items="${result.rows}" varStatus="r">
                     <tr>           	
                      <td><c:out value="${r.count }"></c:out></td>                        
                        <td><c:out  value="${row.nom } " /></td>
                      <td><c:out  value="${row.prenom } " /></td> 
                        <td><c:out value="${row.statut}"/></td>
                        <td>
							<a class="btn btn-default btn-sm" title="Modifier" href="Statut?id=${row.id_enseignant}"> <i class="fa fa-pencil"></i></a>
							
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

<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT test.id_test, test.nom_test, test.type, test.id_module, module.nom_module from test INNER JOIN module ON test.id_module=module.id_module;
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
					Liste Tests
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Liste Tests</li>
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
            <div class="col-xs-12">
             
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">La liste des tests</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                      	<th>N°</th>
                        <th>Nom</th>
                        <th>Type</th>
                        
                        <th>Module</th>
                      </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="row" items="${result.rows}" varStatus="r">
                     <tr>           	
                     	<td><c:out value="${r.count }"></c:out></td>                         
                      	<td><a href="EffectuerTestServlet?id_test=${row.id_test}&type=${row.type}&id_module=${row.id_module}"><c:out value="${row.nom_test }"/></a></td> 
                        <td><c:out value="${row.type}"/></td>
                        <td><c:out value="${row.nom_module}"/></td>
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
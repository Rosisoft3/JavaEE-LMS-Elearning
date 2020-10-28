<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html dir="ltr" lang="fr">
<head>
<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM question WHERE id_test=${sessionScope.id_test };
</sql:query>

<sql:query dataSource="${snapshot}" var="result2">
SELECT * FROM reponse WHERE id_test=${sessionScope.id_test };
</sql:query>
<sql:query dataSource="${snapshot}" var="result3">
SELECT test.nom_test, test.type, module.nom_module, module.niveau FROM test INNER JOIN module ON test.id_module=module.id_module where id_test='${sessionScope.id_test}' ;
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
            Effectuer Test
			
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Liste Test</a></li>
            <li class="active">Effectuer Test</li>
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
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Sujet</h3>
                  </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="mailbox-read-info">
                  <c:forEach var="row" items="${result3.rows }">
                    <h3>Titre: <c:out value="${row.nom_test }"></c:out> </h3>
                    
                    <h5>Module: <c:out value="${row.nom_module }"></c:out> </h5>
                    <h5>Année: <c:out value="${ row.niveau}"></c:out></h5>
                 </c:forEach>
				 </div><!-- /.mailbox-read-info -->
     			   <!-- form start -->
                <form action="EffectuerTestServlet" method="post" role="form">
                  <div class="mailbox-read-message">
				  <!-- Test  -->
				  	<div class="form-group">
				  	
				  	 
					  
					<c:forEach var="question" items="${result.rows}" varStatus="r"> 
					    	                 
                 
						 <label class="title">Question<c:out value="${r.count }"></c:out> : </label>
						 <c:out value="${question.contenu_question }"></c:out><br>
						 
						 
						 <c:forEach var="reponse" items="${result2.rows }">
						 
						 <c:if test="${reponse.id_question == question.id_question }">
                      <div class="radio">
                        <label>
                          <input name="optionsRadios-${r.count }" id="optionsRadios1" value="<c:out value="${reponse.id_reponse}"></c:out>" type="radio">
                          <c:out value="${reponse.contenu_rep }"></c:out>
                          
                        </label>
                    </div>
                    </c:if>
                    </c:forEach>
                   		 </c:forEach>

				  
                    <!-- /.Test  -->
                  </div><!-- /.mailbox-read-message -->
                </div><!-- /.box-body -->

                <div class="box-footer">
                  
                    
                   <button type="submit" class="btn btn-primary">Envoyer</button>
                 
                 
                </div><!-- /.box-footer -->
				</form>
              </div><!-- /. box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
</html>
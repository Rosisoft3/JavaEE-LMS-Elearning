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
					Ajouter Document
					
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Mes Documents</a></li>
					<li class="active">Ajouter Document</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->

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
							<div class="box-header with-border">
								<h3 class="box-title">Nouveau document</h3>
								<div class="box-tools pull-right">
								</div>
							</div>
							<!-- /.box-header -->

			   <!-- form start -->
			   <form role="form" action="UploadDownloadFileServlet?dir=doc" method="post" enctype="multipart/form-data">
			   					
			   					<div class="box-body">
			   					<div class="form-group">
					<label>Joindre un document:</label>
                    <div class="input-group-btn">
                      <input name="fichier" type="file" class="btn btn-default" name="file" required="required">
                    </div><!-- /btn-group -->
                   
                  </div>
			   		 <input type="submit"  value="Upload">
			   </div>
			   </form>
			   
			   
                <form role="form" action="AjouterDocServlet" method="post">
                  <div class="box-body">
				  					
					<div class="form-group">
                      <label>Titre:</label>
                      <input name="nom" kl_virtual_keyboard_secure_input="on" class="form-control" required="required" placeholder="Enter ..." type="text" >
                    </div>

					
					<div class="form-group">
                      <label>Type:</label>
                      <select name="type" class="form-control">
<option value="Cours">Cours</option>
		<option value="TD">TD</option>
		<option value="TP">TP</option>
					  
                      </select>
                    </div>
					
				<div class="form-group">
                      <label>Format:</label>
                      <select name="format" class="form-control">
		<option value=".doc(.docx)">.doc(.docx)</option>
		<option value=".pdf">.pdf</option>
		<option value=".xls(.xlsx)">.xls(.xlsx)</option>
		<option value=".ppt(.pptx)">.ppt(.pptx)</option>
		<option value=".jpg">.jpg</option>
	                      </select>
                    </div>
					
					

				  
				  
				  				
														
								</div>
							<!-- ./box-body -->

                  <div class="box-footer">
                    <input type="submit" class="btn btn-primary" value="Envoyer">
                  </div>
                </form>
              </div><!-- /.box -->

					
					</div>
					<!-- /.col -->


					</div>
				<!-- /.row -->

			</section>
		</div>
		<!-- /. content-wrapper -->



	</div>
	<!-- /.wrapper -->

</body>
</html>

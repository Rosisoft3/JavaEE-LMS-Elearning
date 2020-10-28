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
					Modifier Document
					<small>Les Threads</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Mes Documents</a></li>
					<li class="active">Modifier Document</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->

				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header with-border">
								 <h3 class="box-title">Les Threads</h3>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->

			   <!-- form start -->
                <form role="form">
                  <div class="box-body">
				  					
					<div class="form-group">
                      <label>Titre:</label>
                      <input name="titre" kl_virtual_keyboard_secure_input="on" class="form-control" placeholder="Enter ..." type="text">
                    </div>				
					<div class="form-group">
                      <label>Type:</label>
                      <select class="form-control">
<option value="Cours">Cours</option>
		<option value="TD">TD</option>
		<option value="TP">TP</option>
					  
                      </select>
                    </div>
					
				<div class="form-group">
                      <label>Format:</label>
                      <select class="form-control">
		<option value=".doc(.docx)">.doc(.docx)</option>
		<option value=".pdf">.pdf</option>
		<option value=".xls(.xlsx)">.xls(.xlsx)</option>
		<option value=".ppt(.pptx)">.ppt(.pptx)</option>
		<option value=".jpg">.jpg</option>
		<option value=".mp4">.mp4</option>
		<option value=".avi">.avi</option>
		<option value=".mp3">.mp3</option>
                      </select>
                    </div>
					
					
					<div class="form-group">
					<label>Joindre un document:</label>
                    <div class="input-group-btn">
                      <input name="fichier" type="file" class="btn btn-default">
                    </div><!-- /btn-group -->
                   
                  </div>
				  
				  
				  <div class="form-group">
                      <label>Description:</label>
                      <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
                    </div>
					
														
								</div>
							<!-- ./box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Envoyer</button>
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

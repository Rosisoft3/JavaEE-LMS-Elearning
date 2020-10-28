<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>
<sql:query dataSource="${snapshot}" var="result">
SELECT planning.date, planning.heure_debut, planning.description, module.nom_module FROM planning INNER JOIN module ON planning.id_module=module.id_module;
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
			<h1>Consulter planning</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Consulter Planning</li>
			</ol>
			</section>

			<section class="content"> <!-- Info boxes -->
			<div class="row">
				<!-- Code Action début-->


				<div class="col-md-12">

					<ul class="timeline">

						<c:forEach var="row" items="${result.rows}" varStatus="r">

							<!-- timeline time label -->
							<li class="time-label"><span class="bg-green"> <c:out
										value="${row.date } " />
							</span></li>
							<!-- /.timeline-label -->

							<!-- timeline item -->
							<li>
								<!-- timeline icon --> <i class="fa fa-calendar bg-blue"></i>
								<div class="timeline-item">
									<span class="time"><i class="fa fa-clock-o"></i> <c:out
											value="${row.heure_debut } " /></span>

									<h3 class="timeline-header">
										<c:out value="${row.nom_module} " />
									</h3>

									<div class="timeline-body">
										<c:out value="${row.description } " />
									</div>

									<div class='timeline-footer'></div>
								</div>
							</li>
							<!-- END timeline item -->




						</c:forEach>



						...
					</ul>


				</div>
				<!-- .box -->

			</div>
			<!-- /.row --> </section>
		</div>
		<!-- /. content-wrapper -->





	</div>
	<!-- /.wrapper -->

</body>
</html>

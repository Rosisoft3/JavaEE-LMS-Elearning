<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="fr">
<head>

<sql:query dataSource="${snapshot}" var="result">
SELECT * FROM planning where id_enseignant=${sessionScope.enseignant.id_enseignant} ;
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
			<h1>Gérer planning</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Gérer planning</li>
			</ol>
			</section>
			<!-- Planning frame-->
			<section id="gestion_planning">
			<div id="planning_edit">


				<div class="modal" id="planningModal" aria-hidden="true"
					style="display: none;">

					<div class="modal-body">


						<div style="left: 25%;" class="col-md-6">

							<div class="box box-danger">
								<div class="box-header">
									<h3 class="box-title">Nouveau planning</h3>
								</div>


								<form action="AjouterPlanningServlet">
									<div class="box-body">



										<!-- Date dd/mm/yyyy -->
										<div class="form-group">
											<label>Date </label>
											<div class="input-group">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input name="date" type="text" class="form-control"
													data-inputmask="'alias': 'yyyy-mm-dd'" data-mask />
											</div>
											<!-- /.input group -->
										</div>
										<!-- /.form group -->


										<label>Heure a partir de:</label>
										<div class="calendar-time">
											<select class="hourselect" name="heure_debut">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12" selected="selected">12</option>

												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>

											</select> : <select class="minuteselect" name="min_debut">
												<option value="0" selected="selected">00</option>
												<option value="30">30</option>
											</select>
										</div>
										<label>Jusqu'a de:</label>
										<div class="calendar-time">
											<select class="hourselect" name="heure_fin">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12" selected="selected">12</option>

												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>

											</select> : <select class="minuteselect" name="min_fin">
												<option value="0" selected="selected">00</option>
												<option value="30">30</option>
											</select>
										</div>


										<div class="form-group">
											<label>Description</label>
											<textarea name="description" class="form-control" rows="3"
												placeholder="Enter ..."></textarea>
										</div>


									</div>
									<!-- /.box-body -->

									<div class="box-footer">
										<input type="submit" class="btn btn-primary" value="Ajouter">
									</div>
								</form>
							</div>
							<!-- /.box -->


							<!-- /.box -->

						</div>

					</div>
				</div>
			</div>
			</section>

			<section class="content"> <c:choose>
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
				<!-- Info boxes -->
				<!-- Code Action début-->
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Table de planning</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tr>
									<th>N°</th>
									<th>Date</th>
									<th>Heure Début</th>
									<th>Heure Fin</th>
									<th>Description</th>
									<th>
										<button class="btn btn-default btn-sm"
											title="Nouveau planning" data-toggle="modal"
											href="#planningModal" role="alertdialog">
											<i class="fa fa-plus-square"></i>
										</button>
									</th>
								</tr>

								<c:forEach var="row" items="${result.rows}" varStatus="r">
									<tr>
										<td><c:out value="${r.count }"></c:out></td>
										<td><c:out value="${row.date } " /></td>
										<td><span class="label label-success"><c:out
													value="${row.heure_debut } " /></span></td>
										<td><span class="label label-danger"><c:out
													value="${row.heure_fin}" /></span></td>
										<td><c:out value="${row.description}" /></td>
										<td>
											<div class="btn-group">
												<a class="btn btn-default btn-sm" title="Supprimer"
													href="SupprimerPlanningServlet?id=${row.id_planning}"><i
													class="fa fa-trash-o"></i></a>
											</div>
										</td>
									</tr>
								</c:forEach>


							</table>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- Code Action fin--> </section>
		</div>
		<!-- /. content-wrapper -->

	</div>
	<!-- /.wrapper -->

</body>
</html>

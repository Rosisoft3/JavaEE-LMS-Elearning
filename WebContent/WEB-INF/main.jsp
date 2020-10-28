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
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${sessionScope.profil.photo}" class="img-circle"
					alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>${sessionScope.profil.login}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<form action="RechercherServlet" method="post" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="mot_cle" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='search' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form --> 
		<!-- MAIN NAVIGATION --> 
		
		
		
	<c:choose>
			<c:when test="${sessionScope.typeProfil == 'Etudiant'}">
              <jsp:include page="fonctions-edt.jsp"></jsp:include> 
    		</c:when>
			<c:when test="${sessionScope.typeProfil == 'Tuteur'}">
        	<jsp:include page="fonctions-tuteur.jsp"></jsp:include> 
    		</c:when>
    		<c:when test="${sessionScope.typeProfil == 'Admin'}">
        	<jsp:include page="fonctions-admin.jsp"></jsp:include> 
    		</c:when>
    		<c:when test="${sessionScope.typeProfil == 'Auteur'}">
        	<jsp:include page="fonctions-auteur.jsp"></jsp:include> 
    		</c:when>
    		<c:when test="${sessionScope.typeProfil == 'Responsable'}">
        	<jsp:include page="fonctions-responsable.jsp"></jsp:include> 
    		</c:when>
	</c:choose> 
	
	<!-- / MAIN NAVIGATION --> </section> <!-- /.sidebar --> </aside>

	</div>
	<!-- /.wrapper -->


</body>
</html>
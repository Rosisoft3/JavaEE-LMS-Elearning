<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html dir="ltr" lang="fr">
<head>

<meta charset="windows-1252">
</head>
<body class="skin-blue sidebar-mini">
		<header class="main-header">
			<!-- Logo -->
			<a href="Home" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>L</b>MS</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>${sessionScope.typeProfil}</b>LMS</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<li></li>
						<!-- Notifications: style can be found in dropdown.less -->
						<li></li>
						<!-- Tasks: style can be found in dropdown.less -->
						<li></li>
						<!-- User Account: style can be found in dropdown.less -->

						
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${sessionScope.profil.photo}" class="user-image"
								alt="User Image" /> <span class="hidden-xs">${sessionScope.profil.login}</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="${sessionScope.profil.photo}" class="img-circle"
									alt="User Image" />
									<p>
										${sessionScope.profil.login}<small>${sessionScope.typeProfil}</small>
									</p></li>
								<!-- Menu Body -->

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="Profil" class="btn btn-default btn-flat">Profil</a>
									</div>
									<div class="pull-right">
										<a href="SeDeconnecter" class="btn btn-default btn-flat">Se
											déconnecter</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
					</ul>
				</div>
				<!-- /.navbar-custom-menu -->
			</nav>
			<!-- /.navbar navbar-static-top -->
		</header>
		<!-- /.main-header -->
		<!-- /header -->
		
		</body>
</html>

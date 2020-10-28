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
				Chat 
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Chat</li>
			</ol>
			</section>
			<!-- Main content -->
			<section class="content"> <!-- Info boxes --> <!-- Code Action début-->
			
			



                   
                 
                    
                    
           
              


			
			<div class="row">		
				<div class="col-md-12">
					<!-- DIRECT CHAT -->
					<div class="box box-warning direct-chat direct-chat-warning">
						<div class="box-header with-border">
							<h3 class="box-title">ChatGroupe</h3>
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
						
						<div class="box-body">
							<!-- Conversations are loaded here -->
						
				
						<div class="form-group" >
						<textarea rows="21" id="messagesTextArea" readonly="true" class="groupChat groupChatHistory" cols="92"></textarea><br/>
						</div>
					
											
						</div>
						<div class="box-footer">
							<form action="#" method="post">
								<div class="input-group">
								<input  id="login" type="hidden" value="${sessionScope.profil.login}" />
									<input name="message" id="messageText"  placeholder="Type Message ..."
										class="form-control" type="text"  /> <span
										class="input-group-btn" >
										<input type="button" value="Send" onclick="sendMessage();"   class="btn btn-warning btn-flat"/>
									</span>
								</div>
							</form>
						</div>
						<!-- /.box-footer-->
						
						
				
				

					</div>
					<!--/.direct-chat -->
				</div>
				<!-- /.col -->

			</div>

			<!-- Code Action fin--> </section>
		</div>
		<!-- /.content-wrapper -->


	</div>
	<!-- /.wrapper -->
	
<script type="text/javascript">
	
		var websocket=new WebSocket("ws://localhost:8080/LMSprojet/chatroomServerEndpoint");
		websocket.onmessage=function processMessage(message){
			var jsonData =JSON.parse(message.data);
			if(jsonData.message != null) messagesTextArea.value +=jsonData.message +"\n";
				
		}
		
		function sendMessage(){
			websocket.send(login.value+" : "+messageText.value);
			messageText.value="";
			
		}
		
	</script>

	

</body>
</html>
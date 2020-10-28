import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/serveurendpoint")
public class ServeurEndPoint {

	@OnOpen
	public void handleOpen(){
		System.out.println("The clinet is now connected...");
		
	}
	@OnMessage
	public String handleMessage(String message){
		System.out.println("Receive from client"+message);
		String replay="echo : "+message;
		return replay;
	}
	
	@OnClose
	public void handleClose(){
		System.out.println("Clinet is now disconnected....");
	}
	
	@OnError
	public void handleError(Throwable t){
		t.printStackTrace();
	}
}



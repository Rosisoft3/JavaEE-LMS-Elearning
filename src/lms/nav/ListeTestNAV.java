package lms.nav;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ListeTest")
public class ListeTestNAV extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ListeTestNAV() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();	
		 String id_test = request.getParameter("id_test");
		 System.out.println("L'id du test = "+id_test);
		 session.setAttribute("id_test", id_test);
		 
			String login =(String)session.getAttribute("login");
			
			if (login!=null) {
				session.putValue("toPage", "liste-test.jsp");
	 			RequestDispatcher rd= request.getRequestDispatcher("WEB-INF/utilisateur.jsp");
	 			rd.forward(request, response);
			} else {
				response.sendRedirect("login.jsp");
			}
	}

}

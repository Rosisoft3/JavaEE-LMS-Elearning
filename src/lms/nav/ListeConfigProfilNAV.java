package lms.nav;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ListeConfigProfil")
public class ListeConfigProfilNAV extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListeConfigProfilNAV() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}
	
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();	
			String login =(String)session.getAttribute("login");
			
			if (login!=null) {
				session.putValue("toPage", "liste-config-profil.jsp");
	 			RequestDispatcher rd= request.getRequestDispatcher("WEB-INF/utilisateur.jsp");
	 			rd.forward(request, response);
			} else {
				response.sendRedirect("login.jsp");
			}
		}

}

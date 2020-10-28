package lms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RechercherServlet
 */
@WebServlet("/RechercherServlet")
public class RechercherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RechercherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mot_cle=request.getParameter("mot_cle");
		
		request.setAttribute("mot_cle", mot_cle);
		System.out.println(mot_cle);
		
		 HttpSession session = request.getSession();	
		String login =(String)session.getAttribute("login");
			
			if (login!=null) {
				session.putValue("toPage", "resultat-recherche.jsp");
	 			RequestDispatcher rd= request.getRequestDispatcher("WEB-INF/utilisateur.jsp");
	 			rd.forward(request, response);
			} else {
				response.sendRedirect("login.jsp");
			}
		}}

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
 * Servlet implementation class FicheDetaiDocument
 */
@WebServlet("/FicheDetaiDocumentServlet")
public class FicheDetaiDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FicheDetaiDocumentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_document=request.getParameter("id_document");
		
		System.out.println(id_document);
		 HttpSession session = request.getSession();
		 session.setAttribute("id_document", id_document);
			String login =(String)session.getAttribute("login");
				
				if (login!=null) {
					session.putValue("toPage", "fiche-detail-document.jsp");
		 			RequestDispatcher rd= request.getRequestDispatcher("WEB-INF/utilisateur.jsp");
		 			rd.forward(request, response);
				} else {
					response.sendRedirect("login.jsp");
				}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doGet(request, response);	
	}

}
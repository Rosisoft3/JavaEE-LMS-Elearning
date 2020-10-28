package lms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lms.dao.DAOFactory;
import lms.dao.ProfilDAOImpl;


@WebServlet("/SupprimerProfilServlet")
public class SupprimerProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SupprimerProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id_profil = request.getParameter("id");
		ProfilDAOImpl pdi = new ProfilDAOImpl(DAOFactory.getInstance());
		pdi.supprimerProfil(id_profil);
		
		RequestDispatcher rd = request.getRequestDispatcher("/SupprimerProfil");
		rd.forward(request, response);
		
	}

}

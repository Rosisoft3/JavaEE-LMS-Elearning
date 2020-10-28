package lms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lms.dao.DAOFactory;
import lms.dao.ModuleDAOImpl;


@WebServlet("/SupprimerModuleServlet")
public class SupprimerModuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SupprimerModuleServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nom = request.getParameter("nom");
		ModuleDAOImpl mdi = new ModuleDAOImpl(DAOFactory.getInstance());
		mdi.supprimerModule(nom);
		
		RequestDispatcher rd = request.getRequestDispatcher("/SupprimerModule");
		rd.forward(request, response);
	}

}

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
import lms.modele.Module;


@WebServlet("/CreerModuleServlet")
public class CreerModuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreerModuleServlet() {
        super();
  
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nom= request.getParameter("nom");
		int coefficient = Integer.parseInt(request.getParameter("coefficient"));
		String description = request.getParameter("description");
		int niveau = Integer.parseInt(request.getParameter("niveau"));
		
		Module module = new Module();
		module.setNom(nom);
		module.setCoefficient(coefficient);
		module.setDescription(description);
		module.setNiveau(niveau);
		
		ModuleDAOImpl mdi = new ModuleDAOImpl(DAOFactory.getInstance());
		mdi.creerModule(module);
		
		RequestDispatcher rd = request.getRequestDispatcher("/CreerModule");
		rd.forward(request, response);
		
	}

}

package lms.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lms.dao.DAOFactory;
import lms.dao.EnseignantDAOImpl;
import lms.modele.Enseignant;


@WebServlet("/ModifierStatutServlet")
public class ModifierStatutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ModifierStatutServlet() {
        super();
     
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		String statut = (String) request.getParameter("statut");
		int id_module = Integer.parseInt(request.getParameter("module"));
		int id_enseignant = (Integer) session.getAttribute("ID_ENSEIGNANT");
		Enseignant enseignant = new Enseignant();
		enseignant.setStatut(statut);
		enseignant.setId_module(id_module);
		enseignant.setId_enseignant(id_enseignant);
		
		EnseignantDAOImpl edi = new EnseignantDAOImpl(DAOFactory.getInstance());
		edi.modifierStatut(enseignant);
		
		session.setAttribute("typeAlert", "Success");	
		session.removeAttribute("ID_ENSEIGNANT");
		
		RequestDispatcher rd = request.getRequestDispatcher("ModifierStatut");
		rd.forward(request, response);
		
		
	}

}

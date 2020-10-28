package lms.servlets;

import java.io.IOException;
import java.sql.Time;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lms.dao.DAOFactory;
import lms.dao.EnseignantDAOImpl;
import lms.dao.PlanningDAOImpl;
import lms.modele.Enseignant;
import lms.modele.Planning;
import lms.modele.Profil;

@WebServlet("/AjouterPlanningServlet")
public class AjouterPlanningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjouterPlanningServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		Date date = Date.valueOf(request.getParameter("date"));
		int min_debut = Integer.parseInt(request.getParameter("min_debut"));
		int min_fin = Integer.parseInt(request.getParameter("min_fin"));
		int heure_debut = Integer.parseInt(request.getParameter("heure_debut"));
		int heure_fin = Integer.parseInt(request.getParameter("heure_fin"));
		
		String description = request.getParameter("description");
		
		HttpSession session =request.getSession();
		
		Profil profil =(Profil)session.getAttribute("profil");		
		
		
		
		EnseignantDAOImpl edi = new EnseignantDAOImpl(DAOFactory.getInstance());
		Enseignant enseignant = edi.getEnseignant(profil.getId());
		
		Planning planning =new Planning();
		planning.setHeure_debut(new Time(heure_debut,min_debut,00));
		planning.setHeure_fin(new Time(heure_fin,min_fin,00));
		planning.setDescription(description);
		planning.setId_enseignant(enseignant.getId_enseignant());
		planning.setId_module(enseignant.getId_module());
		planning.setDate(date);
		
		PlanningDAOImpl pdi = new PlanningDAOImpl(DAOFactory.getInstance());
		pdi.ajouterPlanning(planning);
		
		session.setAttribute("typeAlert", "Success");
		RequestDispatcher rd = request.getRequestDispatcher("Planning");
		rd.forward(request, response);
		
		
	}

}
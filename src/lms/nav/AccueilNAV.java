package lms.nav;

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
import lms.dao.EtudiantDAOImpl;
import lms.modele.Enseignant;
import lms.modele.Etudiant;
import lms.modele.Profil;

@WebServlet("/Accueil")
public class AccueilNAV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AccueilNAV() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();	
		 String login =(String)session.getAttribute("login");
		 Profil profil = (Profil)session.getAttribute("profil");
		 String type = profil.getType();
		 
		if (login!=null) {
			
			if (type.equals("Enseignant")){
				
				EnseignantDAOImpl edi=new EnseignantDAOImpl(DAOFactory.getInstance());
				Enseignant enseignant =edi.getEnseignant(profil.getId());
				type = enseignant.getStatut();
				session.setAttribute("enseignant",enseignant);
			}
			if(type.equals("Etudiant")){
				EtudiantDAOImpl edi = new EtudiantDAOImpl(DAOFactory.getInstance());
				Etudiant etudiant = edi.getEtudiant(profil.getId());
				int id_etudiant = etudiant.getId_etudiant();
				session.setAttribute("id_etudiant", id_etudiant);
			}
			
			session.setAttribute("toPage", "accueil.jsp");
			session.setAttribute("typeProfil", type);
						
		
 			RequestDispatcher rd= request.getRequestDispatcher("WEB-INF/utilisateur.jsp");
 			rd.forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}

}
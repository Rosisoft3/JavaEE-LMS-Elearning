package lms.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
import lms.dao.ProfilDAOImpl;
import lms.modele.Enseignant;
import lms.modele.Etudiant;
import lms.modele.Profil;
@WebServlet("/AjouterProfilServlet")
public class AjouterProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    public AjouterProfilServlet() {
        super();
   }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String mp = request.getParameter("mp");
		String nom = request.getParameter("nom");
		String prenom  = request.getParameter("prenom");
		String sexe = request.getParameter("optionsRadios");
		String date =  request.getParameter("date");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date_str=null;
		try {
			date_str = formatter.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date date_db= new java.sql.Date(date_str.getTime());
		String lieu = request.getParameter("lieu");
		String telephone = request.getParameter("telephone");
		String adresse = request.getParameter("adresse");
		String type = request.getParameter("liste");
		
		Profil profil = new Profil();
		profil.setE_mail(email);
		profil.setLogin(login);
		profil.setMp(mp);
		profil.setNom(nom);
		profil.setPrenom(prenom);
		profil.setSexe(sexe);
		profil.setDate_naissance(date_db);
		profil.setLieu_maissance(lieu);
		profil.setAdresse(adresse);
		profil.setTelephone(telephone);
		profil.setType(type);
		profil.setPhoto("espace_client/img/default.png");
		
		ProfilDAOImpl pdi = new ProfilDAOImpl(DAOFactory.getInstance());
		pdi.ajouterProfil(profil);
		
		System.out.println(profil.getType());
		if(profil.getType().equals("Enseignant")){
			EnseignantDAOImpl edi = new EnseignantDAOImpl(DAOFactory.getInstance());
			Enseignant enseignant = new Enseignant();
			enseignant.setId_profil(profil.getId());
			enseignant.setId_module(0);
			enseignant.setStatut("");
			
			edi.ajouterEnseignant(enseignant);
		}else if(profil.getType().equals("Etudiant")){
			EtudiantDAOImpl edi = new EtudiantDAOImpl(DAOFactory.getInstance());
			Etudiant etudiant = new Etudiant();
			etudiant.setId_profil(profil.getId());
			System.out.println(etudiant.getId_profil());
			etudiant.setAnnee_entree(2012);
			edi.ajouterEtudiant(etudiant);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("typeAlert", "Success");
		
		RequestDispatcher rd = request.getRequestDispatcher("/AjouterProfil");
		rd.forward(request, response);
	}

}

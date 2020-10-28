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
import lms.dao.ProfilDAOImpl;
import lms.modele.Profil;


@WebServlet("/ModifierUnProfilServlet")
public class ModifierUnProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ModifierUnProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();	
		
//		int id_profil = (int) session.getAttribute("id_profil_var");
//		System.out.println(id_profil);
//		session.setAttribute("id_profil2", id_profil);
		
		String id_str = request.getParameter("id");
		System.out.println("id string : "+id_str);
		
		session.setAttribute("id_profil2", id_str);
		
		String login =(String)session.getAttribute("login");
		
		if (login!=null) {
			session.putValue("toPage", "modifier-profil.jsp");
 			RequestDispatcher rd= request.getRequestDispatcher("WEB-INF/utilisateur.jsp");
 			rd.forward(request, response);
		} else {
			response.sendRedirect("login.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id_str = (String) session.getAttribute("id_profil2");
		System.out.println("id str : "+id_str);
		int id_profil = Integer.parseInt(id_str);
		System.out.println("id profil : "+id_profil);
		
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String mp = request.getParameter("mp");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adresse = request.getParameter("adresse");
		String lieu = request.getParameter("lieu");
		String sexe = request.getParameter("optionsRadios");
		String telephone = request.getParameter("telephone");
	
	//	java.sql.Date date =  java.sql.Date.valueOf(request.getParameter("date"));
		
		String date =  request.getParameter("date");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
		java.util.Date date_str=null;
		try {
			date_str = formatter.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date date_db= new java.sql.Date(date_str.getTime());
		
		Profil profil = new Profil();
		profil.setId(id_profil);
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
		
		
		ProfilDAOImpl pdi = new ProfilDAOImpl(DAOFactory.getInstance());
		pdi.modifierUnProfil(profil);
		
		RequestDispatcher rd = request.getRequestDispatcher("/ModifierUnProfil");
		rd.forward(request, response);
		
	}

}

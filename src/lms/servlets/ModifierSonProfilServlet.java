package lms.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import lms.dao.DAOFactory;
import lms.dao.ProfilDAOImpl;
import lms.modele.Profil;


@WebServlet("/ModifierSonProfilServlet")
public class ModifierSonProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	public ModifierSonProfilServlet() {
        super();
 
    }

		
		private boolean verifierMp(String pass,String conf){
			boolean bool =false;
			if (pass.equals(conf))  bool=true ; else bool=false;
			return bool;
		}
		
		
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();

		String email =request.getParameter("email");
		String password =request.getParameter("motdepasse");
		String confirme = request.getParameter("confirme");
		String telephone  =request.getParameter("telephone");
		String adresse = request.getParameter("adresse");
		String login = request.getParameter("username");
		
		String photo = (String) session.getAttribute("link_file");
	
	
		Profil profil  =(Profil) session.getAttribute("profil");

		if (email!=profil.getE_mail()) {
			profil.setE_mail(email);
		}
		if (login !=profil.getLogin()) {
			profil.setLogin(login);
		}
		if (adresse!=profil.getAdresse()) {
			profil.setAdresse(adresse);
		}
		if (verifierMp(password, confirme)) {
			if (password!=profil.getMp()) {
				profil.setMp(password);
			}
		}else {
			
			
		}	

		
		if (telephone!=profil.getTelephone()) {
			profil.setTelephone(telephone);
		}
		

		if (photo != profil.getPhoto()) {
			profil.setPhoto(photo);
			session.removeAttribute("link_file");
		}
        
           
            
          ProfilDAOImpl pdi = new ProfilDAOImpl(DAOFactory.getInstance());
		  pdi.modifierSonProfil(profil);
		  session.putValue("profil", profil);
		  session.setAttribute("typeAlert", "Success");	 
		  request.getRequestDispatcher("ModifierSonProfil").forward(request, response);
			
			
               
               
                 
         
	}
		

		
		
				
		
	
	}


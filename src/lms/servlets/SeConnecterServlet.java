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
import lms.dao.ProfilDAOImpl;
import lms.modele.Profil;


@WebServlet("/LoginServlet")
public class SeConnecterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SeConnecterServlet() {
        super();
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doPost(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String login = request.getParameter("login");
		String password = request.getParameter("password");

	     ProfilDAOImpl pdi=new ProfilDAOImpl(DAOFactory.getInstance());           

		        Profil profil =pdi.seConnecter(login,password);
		        		
   
		        if (profil.getLogin()!=null) {
		        	
		        	 if (profil.getLogin().equals(login) && profil.getMp().equals(password)) {
		        		 HttpSession session = request.getSession();
		        		 
		        		 session.setAttribute("login", profil.getLogin());
		        		 session.setAttribute("profil", profil);
		        		 
		     			RequestDispatcher rd= request.getRequestDispatcher("Accueil");
		     			rd.forward(request, response);
		     			
		     			
		     			
		        	 }else{
		        		 request.getRequestDispatcher("login.jsp").forward(request, response);
		        	 }
				}else{
						request.getRequestDispatcher("WEB-INF/404.html").forward(request, response);
					
					
				}

		 

	     
	
	}

}

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
import lms.dao.DocumentDAOImpl;

import lms.modele.Document;
import lms.modele.Enseignant;



@WebServlet("/AjouterDocServlet")
public class AjouterDocServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjouterDocServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom=request.getParameter("nom");
		String type=request.getParameter("type");
		String format=request.getParameter("format");
		
		HttpSession session=request.getSession();
		Enseignant enseignant=(Enseignant)session.getAttribute("enseignant");
		String doc = (String) session.getAttribute("link_file");
		
				System.out.println("LE Lien du document est :"+doc);
		Document document=new Document();
		document.setNom(nom);
		document.setType(type);
		document.setFormat(format);
		document.setId_enseignant(enseignant.getId_enseignant());
		document.setDoc(doc);
		document.setId_module(enseignant.getId_module());
		
		
		DocumentDAOImpl ddi=new DocumentDAOImpl(DAOFactory.getInstance());
		ddi.ajouterDoc(document);
		
		session.removeAttribute("link_file");
		
		RequestDispatcher rd = request.getRequestDispatcher("/ListeConfigDoc");
		rd.forward(request, response);
		
	}

}
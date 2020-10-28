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
import lms.dao.NoteDAOImpl;
import lms.dao.ReponseDAOImpl;
import lms.modele.Note;
import lms.modele.Reponse;


@WebServlet("/EffectuerTestServlet")
public class EffectuerTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public EffectuerTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();	
		 String id_test = request.getParameter("id_test");
		 System.out.println("L'id du test = "+id_test);
		 session.setAttribute("id_test", id_test);
		 String type_test = request.getParameter("type");
		 session.setAttribute("type_test", type_test);
		 String id_module = request.getParameter("id_module");
		 session.setAttribute("id_module", id_module);
		 
			String login =(String)session.getAttribute("login");
			
			if (login!=null) {
				session.putValue("toPage", "effectuer-test.jsp");
	 			RequestDispatcher rd= request.getRequestDispatcher("WEB-INF/utilisateur.jsp");
	 			rd.forward(request, response);
			} else {
				response.sendRedirect("login.jsp");
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String id_test = (String)session.getAttribute("id_test");
		System.out.println("l'id test doPost"+id_test);
		String type_test=(String)session.getAttribute("type_test");
		String id_module_str = (String)session.getAttribute("id_module");
		int id_module = Integer.parseInt(id_module_str.trim());
		int id_etudiant = (int) session.getAttribute("id_etudiant");
		System.out.println("\nL'id du module = "+id_module);
		System.out.println("\n id etudiant = "+id_etudiant);
		
		int n=0;
		double moy=0;
		
		for(int i=1; i<5; i++){
			
			String id_reponse = (String) request.getParameter("optionsRadios-"+i);
			System.out.println("id rep selectionné : "+id_reponse);
			
			ReponseDAOImpl rdi = new ReponseDAOImpl(DAOFactory.getInstance());
			Reponse reponse = rdi.getReponse(id_reponse);
			
			if(reponse.isValeur()==true){
				n+=2;
				System.out.println("La note obtenu = "+n);
			}
		}
		System.out.println("\n La note totale = "+n);
		
		NoteDAOImpl ndi = new NoteDAOImpl(DAOFactory.getInstance());
		Note note = ndi.getNote(id_etudiant, id_module);
		System.out.println("id note = "+note.getId_note());
		
		if(note.getId_note()==0){
			Note note_jdida = new Note();
			System.out.println("note jdida");
			if(type_test.equals("Interrogation")){
				System.out.println("note jdida type intero" );
				note_jdida.setInterrogation(n);
				note_jdida.setId_etudiant(id_etudiant);
				note_jdida.setId_module(id_module);
				note_jdida.setExamen(0);
				note_jdida.setMoyenne(0);
				ndi.ajouterNote(note_jdida);
				System.out.println("note jdida ajouté = "+note_jdida.getInterrogation());
			}else if(type_test.equals("Examen")){
				System.out.println("note jdida type examen" );
				note_jdida.setExamen(n);
				note_jdida.setId_etudiant(id_etudiant);
				note_jdida.setId_module(id_module);
				note_jdida.setInterrogation(0);
				note_jdida.setMoyenne(0);
				ndi.ajouterNote(note_jdida);
		}}else if(note.getId_note()!=0 && note.getInterrogation()==0 ){
			if(type_test.equals("Interrogation")){
				int id_note = note.getId_note();
				System.out.println("id note=="+id_note);
				note.setInterrogation(n);
				
				note.setId_etudiant(id_etudiant);
				note.setId_module(id_module);
				moy = (n+(note.getExamen()*2))/3;
				note.setMoyenne(moy);
				ndi.modifierNoteInterro(note);
				
			}else{
				session.setAttribute("typeAlert", "Danger");	 
				session.setAttribute("alertMessage", "VOUS AVEZ DEJA PASSE L'EXAMEN");
				RequestDispatcher rd = request.getRequestDispatcher("/EffectuerTest");
				rd.forward(request, response);
				System.out.println("VOUS AVES DEJA PASSE L'EXAMEN !");
			}
		}else if(note.getExamen()==0){
			if(type_test.equals("Examen")){
				int id_note=note.getId_note();
				System.out.println("id note=="+id_note);
				note.setExamen(n);
				
				note.setId_etudiant(id_etudiant);
				note.setId_module(id_module);
				moy = (note.getInterrogation()+ (n*2))/3;
				note.setMoyenne(moy);
				ndi.modifierNoteInterro(note);
				
			}else{
				session.setAttribute("typeAlert", "Danger");	 
				session.setAttribute("alertMessage", "VOUS AVEZ DEJA PASSE L'INTERROGATION");
				RequestDispatcher rd = request.getRequestDispatcher("/EffectuerTest");
				rd.forward(request, response);
				System.out.println("VOUS AVEZ DEJA PASSE L'INTERRO !");
			}
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/PV");
		rd.forward(request, response);
	}
}

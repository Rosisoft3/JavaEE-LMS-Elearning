package lms.modele;

public class Reponse {
	private int id_reponse;
	private int id_question;
	private String contenu;
	private boolean valeur ;
	private int id_test;
	
	
	public int getId_reponse() {
		return id_reponse;
	}
	public void setId_reponse(int id_reponse) {
		this.id_reponse = id_reponse;
	}
	public int getId_question() {
		return id_question;
	}
	public void setId_question(int id_question) {
		this.id_question = id_question;
	}
	public String getContenu() {
		return contenu;
	}
	public void setContenu(String contenu) {
		this.contenu = contenu;
	}
	public boolean isValeur() {
		return valeur;
	}
	public void setValeur(boolean valeur) {
		this.valeur = valeur;
	}
	
	
	
	public int getId_test() {
		return id_test;
	}
	public void setId_test(int id_test) {
		this.id_test = id_test;
	}
	
	
	
	
}

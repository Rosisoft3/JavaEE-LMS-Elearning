package lms.modele;

public class Question {
	private int id_question;
	private String contenu ;
	private double notation;
	private int id_test;
	
	
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
	public double getNotation() {
		return notation;
	}
	public void setNotation(double notation2) {
		this.notation = notation2;
	}
	public int getId_test() {
		return id_test;
	}
	public void setId_test(int id_test) {
		this.id_test = id_test;
	}
	
	
	
	
}

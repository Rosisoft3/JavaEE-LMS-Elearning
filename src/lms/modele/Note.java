package lms.modele;


public class Note {
	private int id_module ;
	private int id_etudiant;
	private int interogation;
	private double moyenne;
	private int examen;
	private int id_note;
	public int getId_module() {
		return id_module;
	}
	public void setId_module(int id_module) {
		this.id_module = id_module;
	}
	public int getId_etudiant() {
		return id_etudiant;
	}
	public void setId_etudiant(int id_etudiant) {
		this.id_etudiant = id_etudiant;
	}
	public int getInterrogation() {
		return interogation;
	}
	public void setInterrogation(int interogation) {
		this.interogation = interogation;
	}
	public double getMoyenne() {
		return moyenne;
	}
	public void setMoyenne(double moyenne) {
		this.moyenne = moyenne;
	}
	public int getExamen() {
		return examen;
	}
	public void setExamen(int examen) {
		this.examen = examen;
	}
	public int getId_note() {
		return id_note;
	}
	public void setId_note(int id_note){
		this.id_note=id_note;
	}

}

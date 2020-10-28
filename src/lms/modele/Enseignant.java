package lms.modele;

public class Enseignant {
	
	private int id_enseignant;
	private int id_profil;
	private int id_module;
	private String statut;
	
	
	public int getId_enseignant() {
		return id_enseignant;
	}

	public void setId_enseignant(int id_enseignant) {
		this.id_enseignant = id_enseignant;
	}

	public int getId_profil() {
		return id_profil;
	}

	public void setId_profil(int id_profil) {
		this.id_profil = id_profil;
	}
	
	
	public int getId_module() {
		return id_module;
	}

	public void setId_module(int id_module) {
		this.id_module = id_module;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}
	
	
	
}

package lms.modele;

import java.sql.Date;
import java.sql.Time;

public class Planning {
	private int id_enseignant;
	private int id_planning;
	private int id_module;
	private Time heure_debut;
	private Time heure_fin;
	private Date date;
	private String description;
	public int getId_enseignant() {
		return id_enseignant;
	}
	public void setId_enseignant(int id_enseignant) {
		this.id_enseignant = id_enseignant;
	}
	public int getId_module() {
		return id_module;
	}
	public void setId_module(int id_module) {
		this.id_module = id_module;
	}
	public Time getHeure_debut() {
		return heure_debut;
	}
	public void setHeure_debut(Time heure_debut) {
		this.heure_debut = heure_debut;
	}
	public Time getHeure_fin() {
		return heure_fin;
	}
	public void setHeure_fin(Time heure_fin) {
		this.heure_fin = heure_fin;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getId_planning() {
		return id_planning;
	}
	public void setId_planning(int id_planning) {
		this.id_planning = id_planning;
	}
	
	
}
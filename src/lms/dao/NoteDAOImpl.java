package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Note;

public class NoteDAOImpl implements ObjectDAOImpl{

private DAOFactory daoFactory;
	
	public NoteDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	@Override
	public void insert(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Note note= (Note)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true, note.getId_etudiant(), note.getId_module(), note.getInterrogation(), note.getExamen(),note.getMoyenne());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "la note, aucune ligne ajout�e dans la table." );
			}
valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            note.setId_note(valeursAutoGenerees.getInt(1));
	        
	        } else {
	            throw new DAOException( "Echec de la cr�ation du profil en base, aucun ID auto-genere retourne." );
	        }

			
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}

	}
	public void update(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Note note= (Note)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false,note.getInterrogation(), note.getExamen(), note.getMoyenne());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "le profil, aucune ligne ajout�e dans la table." );
			}
		
			
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}

		
	}
	
	public void update2(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Note note= (Note)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false,note.getExamen());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la modification de"
						+ " la note, aucune ligne ajout�e dans la table." );
			}
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}
		}

	public void update3(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Note note= (Note)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, false,note.getMoyenne());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la cr�ation de"
						+ "la moyenne, aucune ligne ajout�e dans la table." );
			}
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}
		}
	
	@Override
	public void delete(String sql, Object obj) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object select(String sql, Object... objs) throws DAOException {
			Connection connexion = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			Note note= new Note();
			try {
				connexion = daoFactory.getConnection();
				preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
				resultSet = preparedStatement.executeQuery();
				if (resultSet.next()) {
					note=(Note) map(resultSet);
				}    
			} catch ( SQLException e ) {
				throw new DAOException( e );
			} finally {
				fermeturesSilencieuses(resultSet, preparedStatement, connexion );
			}
			return note;
		}

	private Note map(ResultSet resultSet) throws SQLException{

		Note note = new Note();
		note.setId_note(resultSet.getInt("id_note"));
		note.setId_etudiant(resultSet.getInt("id_etudiant"));
		note.setId_module(resultSet.getInt("id_module"));
		note.setInterrogation(resultSet.getInt("interrogation"));
		note.setExamen(resultSet.getInt("examen"));
		note.setMoyenne(resultSet.getDouble("moyenne"));
		return note;
	}

	public void ajouterNote(Note note){
		String SQL_INSERT = "INSERT INTO note(id_etudiant, id_module, interrogation, examen, moyenne) VALUES(?, ?, ?, ?,?)";
		insert(SQL_INSERT, note);
	}

	public void modifierNoteInterro(Note note){
		String SQL_UPDATE ="UPDATE note SET interrogation=?, examen=?, moyenne=? WHERE id_note="+note.getId_note();
		update(SQL_UPDATE, note);
	}
	
	public void modifierNoteExamen(int note_examen){
		String SQL_UPDATE ="UPDATE note SET examen=? WHERE ";
		update2(SQL_UPDATE, note_examen);
	}
	public void modifierMoyenne(double moyenne){
		String SQL_UPDATE ="UPDATE note SET moyenne=? WHERE ";
		update3(SQL_UPDATE, moyenne);
	}
	
	public Note getNote(int id_etudiant, int id_module){
		String SQL_SELECT = "SELECT * FROM note WHERE id_etudiant=? AND id_module=?";
		return (Note)select(SQL_SELECT, id_etudiant, id_module);
	}
}

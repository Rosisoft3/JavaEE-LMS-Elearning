package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Annee_Scolaire;
import lms.modele.Profil;

public class Annee_ScolaireDAOImpl implements ObjectDAOImpl {
	private DAOFactory daoFactory;
	
	public Annee_ScolaireDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}

	@Override
	public void insert(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Profil profil = (Profil)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,profil.getLogin(),profil.getMp(),profil.getNom(),profil.getPrenom(),profil.getAdresse(),profil.getE_mail(),profil.getDate_naissance(),profil.getLieu_maissance(),profil.getSexe(),profil.getPhoto());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la création de"
						+ "le profil, aucune ligne ajoutée dans la table." );
			}
			valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            profil.setId(valeursAutoGenerees.getInt(1));
	        
	        } else {
	            throw new DAOException( "Echec de la création du profil en base, aucun ID auto-genere retourne." );
	        }

			
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}

		
	}

	@Override
	public void update(String sql, Object obj) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String sql, Object obj) throws DAOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Annee_Scolaire select(String sql, Object... objs) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Annee_Scolaire annee = new Annee_Scolaire();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				annee = map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		return annee;
	}

	private Annee_Scolaire map(ResultSet resultSet) throws
	SQLException { 
		Annee_Scolaire annee =new Annee_Scolaire();
		annee.setId_annee_scolaire(resultSet.getInt("id_annee_scolaire"));
		annee.setAnnee_debut(resultSet.getInt("annee_debut"));
		annee.setAnnee_debut(resultSet.getInt("annee_fin"));
		return annee;
	}
	
	public void ajouterAnneeScolaire(Annee_Scolaire annee){
		String SQL_INSERT ="INSERT INTO annee_scolaire (annee_debut, annee_fin) VALUES (?, ?)";
		insert(SQL_INSERT, annee);
	}
	
	public Annee_Scolaire getAnneeScolaire(Object...objects){
		String SQL_SELECT=
				"SELECT * FROM annee_scolaire WHERE annee_debut =? AND annee_fin =?";
		return select(SQL_SELECT,objects);

	}
}
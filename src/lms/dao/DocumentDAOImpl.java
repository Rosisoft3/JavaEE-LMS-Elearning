package lms.dao;

import static lms.dao.DAOUtilitaire.fermeturesSilencieuses;
import static lms.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import lms.modele.Document;




public class DocumentDAOImpl implements ObjectDAOImpl {


	private DAOFactory daoFactory;
	
	public DocumentDAOImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}
	
	@Override
	public void insert(String sql, Object obj) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		Document doc = (Document)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,doc.getId_enseignant(),doc.getId_module(),doc.getNom(),doc.getType(),doc.getFormat(),doc.getDoc());
			int statut = preparedStatement.executeUpdate();
			if ( statut == 0 ) {
				throw new DAOException( "Echec de la création de"
						+ "le doc, aucune ligne ajoutée dans la table." );
			}
				valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
	        if ( valeursAutoGenerees.next() ) {

	            doc.setId_document(valeursAutoGenerees.getInt(1));
	        
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

		
	}

	@Override
	public void delete(String sql, Object obj) throws DAOException {
	
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		int id = (Integer)obj;
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee( connexion,
					sql, true,id);
			 preparedStatement.executeUpdate();
	
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement,connexion );
		}
	}

	@Override
	public Document select(String sql, Object... objs) throws DAOException {
		
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Document doc = new Document();
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion,sql, false, objs );
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				doc =(Document) map(resultSet);
			}    
		} catch ( SQLException e ) {
			throw new DAOException( e );
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion );
		}
		return doc;
	}
	
	private  Document map( ResultSet resultSet ) throws
	SQLException {
		Document document =new Document();
		document.setId_document(resultSet.getInt("id_document"));
		document.setId_enseignant(resultSet.getInt("id_enseignant"));
		document.setFormat(resultSet.getString("format"));
		document.setNom(resultSet.getString("nom_doc"));
		document.setType(resultSet.getString("type"));
		document.setDoc(resultSet.getString("doc"));
		
		return document;
	}

	public void ajouterDoc(Document document) {
		String SQL_INSERT ="INSERT INTO document (id_enseignant,id_module,nom_doc ,type,format,doc) VALUES ( ?, ?,?,?,?,?)";
		insert(SQL_INSERT, document);
	}

	public void supprimerDoc(int id) {
String SQL_DELETE ="DELETE FROM document WHERE id_document=?";
		
		delete(SQL_DELETE, id);
		
	}

}
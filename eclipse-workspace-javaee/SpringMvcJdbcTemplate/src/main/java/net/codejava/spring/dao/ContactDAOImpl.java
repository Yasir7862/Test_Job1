package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.net.ssl.SSLEngineResult.Status;
import javax.sql.DataSource;

import net.codejava.spring.model.Contact;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

/**
 * An implementation of the ContactDAO interface.
 * @author www.codejava.net
 *
 */
public class ContactDAOImpl implements ContactDAO {

	private JdbcTemplate jdbcTemplate;
	
	public ContactDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	/*@Override
	public void saveOrUpdate(Contact contact) {
		if (contact.getId() > 0) {
			// update
			String sql = "UPDATE FileStatus SET DirectoryName=?, FileName=?, Status=?, "
						+ "date=? WHERE contact_id=?";
			jdbcTemplate.update(sql, contact.getDirectoryName(), contact.getFileName(),
					contact.getStatus(), contact.getdate(), contact.getId());
		} else {
			// insert
			String sql = "INSERT INTO FileStatus (DirectoryName, FileName, Status, date)"
						+ " VALUES (?, ?, ?, ?)";
			jdbcTemplate.update(sql, contact.getDirectoryName(), contact.getFileName(),
					contact.getStatus(), contact.getdate());
		}
		
	}*/

	/*@Override
	public void delete(int contactId) {
		String sql = "DELETE FROM FileStatus WHERE contact_id=?";
		jdbcTemplate.update(sql, contactId);
	}*/

	@Override
	public List<Contact> list() {
		//String sql = "SELECT * FROM FileStatus";
		//String sql = "select count(*) from FileStatus where status = 1";
		String sql = "select status, count(*) AS TotalRecords from FileStatus group by status";
		List<Contact> listContact = jdbcTemplate.query(sql, new RowMapper<Contact>() {

			@Override
			public Contact mapRow(ResultSet rs, int rowNum) throws SQLException {
				Contact aContact = new Contact();
	
				//aContact.setId(rs.getInt("contact_id"));
				//aContact.setDirectoryName(rs.getString("DirectoryName"));
				//aContact.setFileName(rs.getString("FileName"));
				// aContact.setStatus(rs.getInt("status"));
				//aContact.setStat(rs.getString("Count"));
				//aContact.setStatus("TotalRecords");
				aContact.setStatusVal(rs.getString("status"));
				aContact.setStatus(rs.getString("TotalRecords"));
				
				//aContact.setdate(rs.getString("date"));
				
				return aContact;
			}
			
		});
		
		return listContact;
	}

	/*@Override
	public Contact get(int contactId) {
		String sql = "SELECT * FROM FileStatus WHERE contact_id=" + contactId;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Contact>() {

			@Override
			public Contact extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				if (rs.next()) {
					Contact contact = new Contact();
					contact.setId(rs.getInt("contact_id"));
					contact.setDirectoryName(rs.getString("DirectoryName"));
					contact.setFileName(rs.getString("FileName"));
					contact.setStatus(rs.getString("Status"));
					contact.setdate(rs.getString("date"));
					return contact;
				}
				
				return null;
			}
			
		});
	}*/

}

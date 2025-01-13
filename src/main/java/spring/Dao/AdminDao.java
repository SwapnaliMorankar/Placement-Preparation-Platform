package spring.Dao;

import org.springframework.stereotype.Repository;

import spring.Model.Admin;

@Repository
public interface AdminDao {
	
	public Admin adminLogin(String email, String pass);

}

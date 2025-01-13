package spring.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.Dao.AdminDao;
import spring.Model.Admin;

@Service
public class AdminServiceImple implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public Admin login(String email, String pass) {
		return this.adminDao.adminLogin(email, pass);
	}

}

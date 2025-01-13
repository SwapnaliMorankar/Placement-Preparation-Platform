package spring.Service;

import org.springframework.stereotype.Service;
import spring.Model.Admin;

@Service
public interface AdminService {
	
	public Admin login(String email, String pass);

}

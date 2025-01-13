package spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//Redirect to Login(index) page
	@RequestMapping("")
	public String Home() {
		return "index";
	}

}

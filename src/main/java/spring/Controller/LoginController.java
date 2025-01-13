package spring.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.Model.Admin;
import spring.Model.Student;
import spring.Service.AdminService;
import spring.Service.AdminServiceImple;
import spring.Service.StudentService;

@Controller
public class LoginController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;
	
	//Mapping for login page 
	@RequestMapping("/login")
	public String Login() {
		return "login";
	}
	
	//Login Form Submission Handler (Role Based Redirection)
	@RequestMapping(path="/login_form", method=RequestMethod.POST)
	public String LoginForm(@RequestParam("email") String email, @RequestParam("password") String pass, 
			Model model, RedirectAttributes redirectAttributes) {
		
		Student st = this.studentService.authenticate(email, pass);
		Admin ad = this.adminService.login(email, pass);
		
		if(st!=null) {
			redirectAttributes.addFlashAttribute("s", st);
			return "redirect:/studentdashboard";
		}
		else if(ad!=null){
			redirectAttributes.addFlashAttribute("a", ad);
			return "redirect:/admindashboard";
		}
		else {
			return "redirect:/login";
		}
	}

}

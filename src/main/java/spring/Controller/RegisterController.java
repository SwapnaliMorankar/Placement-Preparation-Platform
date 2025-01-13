package spring.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.Model.Student;
import spring.Service.StudentService;
import spring.Service.StudentServiceImple;

@Controller
public class RegisterController {
	
	@Autowired
	private StudentService studentService;
	
	//Register Form Mapping
	@RequestMapping("/register")
	public String Register() {
		return "register";
	}
	
	//Registration Form Submission Handler
	@RequestMapping(path="/register_student", method=RequestMethod.POST)
	public String RegisterStudent(@ModelAttribute Student student) {
		this.studentService.createStudent(student);
		return "redirect:/login";
	}

}

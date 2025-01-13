package spring.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.Model.Course;
import spring.Model.Student;
import spring.Model.Module;
import spring.Service.CourseService;
import spring.Service.ModuleService;
import spring.Service.StudentService;

@Controller
public class DashboardController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private StudentService studentService;
	
	 //Redirection to studentdashboard after login
	@RequestMapping("/studentdashboard")
	public String StudentDash(Model model) {
		List<Course> c2 = this.courseService.selectAllCourses();
		model.addAttribute("courses" , c2);
		return "studentdashboard";
	}
	
	//Redirection to admindashboard after login
	@RequestMapping("/admindashboard")
	public String AdminDash(Model model) {
		
		List<Course> c2 = this.courseService.selectAllCourses();
		model.addAttribute("courses" , c2);
		
		long count1 = this.courseService.countCourses();
		model.addAttribute("coursecount" , count1);
		
		List<Student> s1 = this.studentService.getAllStudents();
		model.addAttribute("students" , s1);
		
		long count2 = this.studentService.countStudents();
		model.addAttribute("studentcount" , count2);
		
		return "admindashboard";
	}
	
}

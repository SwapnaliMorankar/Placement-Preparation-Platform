package spring.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import spring.Model.Course;
import spring.Model.Module;
import spring.Service.CourseService;
import spring.Service.ModuleService;

@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	 @Autowired
	 private ModuleService moduleService;
	
	//Add New course button Mapping (New JSP page)
	@RequestMapping("/addcourse")
	public String AddCourse() {
		return "NewCourse";
	}
	
	//Onsubmit New course added handler
	@PostMapping("/courseadded")
	public String CreateCourse(@ModelAttribute Course course) {
		this.courseService.savecourse(course);
		return "redirect:/admindashboard";
	}
	
	//Opening specific course page on basis of course ID
	@RequestMapping(path="/course/{courseID}", method=RequestMethod.GET)
	public String Course(@PathVariable("courseID") int id, Model model) {
		spring.Model.Course c1 = this.courseService.selectOneCourse(id);
		model.addAttribute("course" , c1);
		List<Module> m = this.moduleService.selectAllModules(id);
		model.addAttribute("modules", m);
		return "course";
	}
	
	//Handler to delete course
	@RequestMapping(path="/delete_course/{courseID}", method=RequestMethod.GET)
	public RedirectView DeleteCourse(@PathVariable("courseID") int id, HttpServletRequest request) {
	RedirectView rv = new RedirectView();
	this.courseService.removeCourse(id);
	rv.setUrl(request.getContextPath()+"/admindashboard");
	return rv;
	}
	
	//Handler to fetch update form on clicking update button
	@RequestMapping(path="/update_course/{courseID}", method=RequestMethod.GET)
	public String UpdateCourse(@PathVariable("courseID") int id, Model model) {
		Course c = this.courseService.selectOneCourse(id);
		model.addAttribute("course", c);
		return "updatecourse";
	}
	
	//Handler to save updated form changes
	@RequestMapping(path = "/courseupdated", method = RequestMethod.POST)
	public RedirectView UpdateUserForm(@ModelAttribute Course course, HttpServletRequest request) {
		RedirectView rd = new RedirectView();
		this.courseService.savecourse(course);
		rd.setUrl(request.getContextPath() + "/admindashboard");
		return rd;
	}
	
}

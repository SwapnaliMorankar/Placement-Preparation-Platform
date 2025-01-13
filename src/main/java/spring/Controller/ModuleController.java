package spring.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import spring.Model.Module;
import spring.Model.Course;
import spring.Service.CourseService;
import spring.Service.ModuleService;

@Controller
public class ModuleController {
    
    @Autowired
    private ModuleService moduleService;
    
    @Autowired
    private CourseService courseService;
    
    	//Open specific modules page on basis of course ID (Only modules of that course will be visible)
	    @RequestMapping("/module/{courseID}")
	    public String Module(@PathVariable("courseID") int id, Model model) {
	    	List<Module> m = this.moduleService.selectAllModules(id);
	        model.addAttribute("modules", m);
	        
	        Course c = this.courseService.selectOneCourse(id);
	        model.addAttribute("course", c);
	        return "Module"; 
	    }
	    
	    //To Redirect on individual modules page
	    @RequestMapping(path="/course_module/{courseID}", method=RequestMethod.GET)
	    public String GetModules(@PathVariable("courseID") int id) {
	        return "redirect:/module/" + id;
	    }
	    
	    //Handler to Add New Module in particular course
	    //Add Module form page will open
	    @GetMapping("/addmodule/{courseID}")
		public String AddModule(@PathVariable("courseID") int id, Model model) {
	    	Course c = this.courseService.selectOneCourse(id);
	    	System.out.print(c);
	    	model.addAttribute("course", c);
			return "NewModule";
		}
		
	    //Handler to save the data of new module
		@PostMapping("/moduleadded")
		public String ModuleCourse(@ModelAttribute Module module , 
				@RequestParam("courseID") int id) {
			
		    Course course = this.courseService.selectOneCourse(id);
		    module.setCourse(course);
			this.moduleService.saveModule(module);
			return "redirect:/module/" + id;
		}
		
		//Handler to delete module on basis of module ID
		@RequestMapping(path="/delete_module/{moduleID}", method=RequestMethod.GET)
		public RedirectView DeleteCourse(@PathVariable("moduleID") int id, HttpServletRequest request) {
		RedirectView rv = new RedirectView();
		Module m = this.moduleService.selectOneModule(id);
		this.moduleService.removeModule(id);
		rv.setUrl(request.getContextPath()+"/module/" + m.getCourse().getCourseID());
		return rv;
		}
		
		//Handler to open update module form
		@RequestMapping(path="/update_module/{moduleID}", method=RequestMethod.GET)
		public String UpdateCourse(@PathVariable("moduleID") int id, Model model) {
			Module m = this.moduleService.selectOneModule(id);
			model.addAttribute("module", m);
			System.out.print(m.getCourse().getCourseID());
			return "updatemodule";
		}
		
		//Handler to save data of updated modules form
		@RequestMapping(path = "/moduleupdated", method = RequestMethod.POST)
		public RedirectView UpdateUserForm(@ModelAttribute Module module,
				@RequestParam("courseID") int id, HttpServletRequest request) {
			RedirectView rd = new RedirectView();
			Course course = new Course();
		    course.setCourseID(id);
		    module.setCourse(course);
		    this.moduleService.saveModule(module);
			rd.setUrl(request.getContextPath() + "/module/" + id);
			return rd;
		}
}

package spring.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import spring.Model.Course;
import spring.Model.Module;
import spring.Service.CourseService;
import spring.Service.ModuleService;

@Controller
public class PdfController {

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private CourseService courseService;

    
    // Handler to view the PDF
    @RequestMapping(path = "/viewPDF/{moduleID}", method = RequestMethod.GET)
    public ResponseEntity<byte[]> viewPDF(@PathVariable("moduleID") int moduleID) {

        // Fetch the module by ID
        Module module = moduleService.selectOneModule(moduleID);

        // Check if the module exists and the PDF is not null
        if (module == null || module.getPdfDocument() == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build(); // Return 404 if no PDF is found
        }

        // Set response headers for serving the PDF
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(org.springframework.http.MediaType.APPLICATION_PDF);

        // Return the PDF as a byte array
        return ResponseEntity.ok().headers(headers).body(module.getPdfDocument());
    }

    
    
    // Handler to serve course images
    @RequestMapping(value = "/course/image/{courseID}", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getCourseImage(@PathVariable("courseID") int courseID) {

        // Fetch the course by ID
        Course course = this.courseService.selectOneCourse(courseID);

        // Check if the course exists and the image is not null
        if (course == null || course.getImage() == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build(); // Return 404 if no image is found
        }

        // Set response headers for serving the image
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(org.springframework.http.MediaType.IMAGE_JPEG); // Adjust MIME type if needed

        // Return the image as a byte array
        return ResponseEntity.ok().headers(headers).body(course.getImage());
    }
}

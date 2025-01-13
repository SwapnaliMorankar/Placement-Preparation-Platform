package spring.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.Dao.CourseDao;
import spring.Model.Course;

@Service
public class CourseServiceImple implements CourseService {
	
	@Autowired
	private CourseDao courseDao;

	@Override
	public Course selectOneCourse(int id) {
		Course c1 = this.courseDao.getOneCourse(id);
		return c1;
	}

	@Override
	public List<Course> selectAllCourses() {
		List<Course> c2 =  this.courseDao.getAllCourses();
		return c2;
	}

	@Override
	public long countCourses() {
		return this.courseDao.getCourseCount();
	}

	@Override
	public void savecourse(Course course) {
		this.courseDao.AddCourse(course);
	}

	@Override
	public void removeCourse(int id) {
		this.courseDao.DeleteCourse(id);
	}

}

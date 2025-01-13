package spring.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import spring.Model.Course;

@Service
public interface CourseService {
	
	public Course selectOneCourse(int id);
	public List<Course> selectAllCourses();
	public long countCourses();
	public void savecourse(Course course);
	public void removeCourse(int id);
}

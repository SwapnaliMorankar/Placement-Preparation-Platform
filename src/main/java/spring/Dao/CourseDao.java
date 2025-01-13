package spring.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.Model.Course;

@Repository
public interface CourseDao {
	
	public Course getOneCourse(int id);
	public List<Course> getAllCourses();
	public long getCourseCount();
	public void AddCourse(Course course);
	public int DeleteCourse(int id);
}

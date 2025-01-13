package spring.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import spring.Model.Student;

@Repository
public interface StudentDao {
	
	public void addStudent(Student student);
	public Student findByEmail(String email, String pass);
	public List<Student> getAllStudents();
	public long getStudentCount();

}

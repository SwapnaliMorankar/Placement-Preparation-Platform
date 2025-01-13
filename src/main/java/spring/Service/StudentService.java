package spring.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import spring.Model.Student;

@Service
public interface StudentService {
	
	public void createStudent(Student student);
	public Student authenticate(String email, String pass);
	public List<Student> getAllStudents();
	public long countStudents();

}

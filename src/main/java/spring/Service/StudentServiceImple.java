package spring.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.Dao.StudentDao;
import spring.Dao.StudentDaoImple;
import spring.Model.Student;

@Service
public class StudentServiceImple implements StudentService{
	
	@Autowired
	private StudentDao studentDao;

	//Add Student
	@Override
	public void createStudent(Student student) {
		this.studentDao.addStudent(student);
	}
	
	//Login Authentication
	@Override
	public Student authenticate(String email, String pass) {
		return this.studentDao.findByEmail(email, pass);
		
	}

	@Override
	public List<Student> getAllStudents() {
		List<Student> s = this.studentDao.getAllStudents();
		return s;
	}

	@Override
	public long countStudents() {
		return this.studentDao.getStudentCount();
	}

	
}

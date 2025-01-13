package spring.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import spring.Model.Student;

@Repository
public class StudentDaoImple implements StudentDao {

    @Autowired
    private HibernateTemplate hibernate;

    // Adding Student
    @Override
    @Transactional
    public void addStudent(Student student) {
        this.hibernate.saveOrUpdate(student);
    }

    // Login Authentication
    @Override
    public Student findByEmail(String email, String pass) {
        String query = "FROM Student s WHERE s.email = :email AND s.password = :password";
        List<Student> students = (List<Student>) this.hibernate.execute(session -> {
            Query<Student> q = session.createQuery(query, Student.class);
            q.setParameter("email", email);
            q.setParameter("password", pass);
            return q.list();
        });

        if (!students.isEmpty()) {
            return students.get(0);
        }
        return null;
    }

	@Override
	public List<Student> getAllStudents() {
		List<Student> s1 = this.hibernate.loadAll(Student.class);
		return s1;
	}

	@Override
	public long getStudentCount() {
		String query = "SELECT COUNT(*) FROM Student";
	    return (Long) this.hibernate.execute(session -> {
	        Query<Long> q = session.createQuery(query, Long.class);
	        return q.uniqueResult();
	    });
	}
    
    
}

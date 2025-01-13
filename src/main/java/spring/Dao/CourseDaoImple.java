package spring.Dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import spring.Model.Course;

@Repository
public class CourseDaoImple implements CourseDao {
	
	@Autowired
	private HibernateTemplate hibernate;

	@Override
	public Course getOneCourse(int id) {
		Course c1 = this.hibernate.get(Course.class, id);
		return c1;
	}

	@Override
	public List<Course> getAllCourses() {
		List<Course> c2 = this.hibernate.loadAll(Course.class);
		return c2;
	}

	@Override
	public long getCourseCount() {
		String query = "SELECT COUNT(*) FROM Course";
	    return (Long) this.hibernate.execute(session -> {
	        Query<Long> q = session.createQuery(query, Long.class);
	        return q.uniqueResult();
	    });
	}

	@Override
	@Transactional
	public void AddCourse(Course course) {
		this.hibernate.saveOrUpdate(course);
	}

	@Override
	@Transactional
	public int DeleteCourse(int id) {
		Course c1 = this.hibernate.get(Course.class, id);
		this.hibernate.delete(c1);
		return 0;
	}
	

}

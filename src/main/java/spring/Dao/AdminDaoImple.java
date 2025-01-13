package spring.Dao;

import java.util.List;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import spring.Model.Admin;

@Repository
public class AdminDaoImple implements AdminDao {
    
    @Autowired
    private HibernateTemplate hibernate;

    // Login Authentication for admin
    @Override
    public Admin adminLogin(String email, String pass) {
        String query = "FROM Admin s WHERE s.email = :email AND s.password = :password";
        List<Admin> admins = (List<Admin>) this.hibernate.execute(session -> {
            Query<Admin> q = session.createQuery(query, Admin.class);
            q.setParameter("email", email);
            q.setParameter("password", pass);
            return q.list();
        });

        if (!admins.isEmpty()) {
            return admins.get(0);
        }
        return null;
    }
}

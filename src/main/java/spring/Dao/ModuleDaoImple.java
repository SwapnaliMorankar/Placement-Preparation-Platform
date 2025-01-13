package spring.Dao;

import java.util.List;
import spring.Model.Module;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ModuleDaoImple implements ModuleDao {

    @Autowired
    private HibernateTemplate hibernate;

    @Override
    public List<Module> getAllModules(int id) {
        // Use JPA-style query parameters (e.g., ?1)
        String hql = "FROM Module WHERE courseID = ?1";
        List<Module> modules = (List<Module>) hibernate.execute(session -> {
            return session.createQuery(hql)
                          .setParameter(1, id) 
                          .list();
        });
        return modules;
    }

	@Override
	@Transactional
	public void addModule(Module module) {
		this.hibernate.saveOrUpdate(module);
	}

	@Override
	public Module getOneModule(int id) {
		return this.hibernate.get(Module.class, id);
	}

	@Override
	@Transactional
	public void deleteModule(int id) {
		Module m = this.hibernate.get(Module.class, id);
		this.hibernate.delete(m);
	}

}

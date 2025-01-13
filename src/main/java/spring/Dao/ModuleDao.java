package spring.Dao;

import java.util.List;
import spring.Model.Module;
import org.springframework.stereotype.Repository;

@Repository
public interface ModuleDao {
	
	public List<Module> getAllModules(int id);
	public void addModule(Module module);
	public Module getOneModule(int id);
	public void deleteModule(int id);
}

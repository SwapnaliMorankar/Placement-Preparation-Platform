package spring.Service;

import java.util.List;
import spring.Model.Module;
import org.springframework.stereotype.Service;

@Service
public interface ModuleService {
	
	public List<Module> selectAllModules(int id);
	public void saveModule(Module module);
	public Module selectOneModule(int id);
	public void removeModule(int id);

}

package spring.Service;

import java.util.List;
import spring.Model.Module;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.Dao.ModuleDao;

@Service
public class ModuleServiceImple implements ModuleService {
	
	@Autowired
	private ModuleDao moduleDao;

	@Override
	public List<Module> selectAllModules(int id) {
		List<Module> m1 = this.moduleDao.getAllModules(id);
		return m1;
	}

	@Override
	@Transactional
	public void saveModule(Module module) {
		this.moduleDao.addModule(module);
	}

	@Override
	public Module selectOneModule(int id) {
		return this.moduleDao.getOneModule(id);
	}

	@Override
	@Transactional
	public void removeModule(int id) {
		this.moduleDao.deleteModule(id);
	}

}

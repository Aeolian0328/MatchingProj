package apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import apply.model.SubjectDto;

@Service
public class SubjectService {

	@Autowired
	SubjectDao dao;

	public void setDao(SubjectDao dao) {
		this.dao = dao;
	}

	public List<SubjectDto> allselect() {
		return dao.allselect();
	}

	
	public SubjectDto oneselect(String a) { 
	   return dao.oneselect(a); 
	}
	
	public int s_countup(SubjectDto a) {
		return dao.s_countup(a);
	}
	
	public int countfail(String subjectName) {
		return dao.countfail(subjectName);
	}
	
	public void create(SubjectDto a) {
		dao.create(a);
	}
	
	
	public int s_enroll(SubjectDto a) {
		return dao.s_enroll(a);
	}
	





	 

}

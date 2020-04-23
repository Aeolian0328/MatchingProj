package apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import apply.model.RankDto;
import apply.model.SubjectDto;

@Service
public class RankService {

	
	@Autowired
	RankDao dao;

	public void setDao(RankDao dao) {
		this.dao = dao;
	}
	
	public List<RankDto> allselect(){
		return dao.allselect();
	}
	
	public List<RankDto> oneselect(String month){
		return dao.oneselect(month);
	}
	
	public List<SubjectDto> month3(String month3){
		return dao.month3(month3);
	}
	
	public List<SubjectDto> use(String year){
		return dao.use(year);
	}
	public List<SubjectDto> radar(){
		return dao.radar();
	}
	
	public List<SubjectDto> user_hap(String user_hap_total, String age){
		return dao.user_hap(user_hap_total,age);
	}
	 




	
	
	
}

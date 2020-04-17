package apply.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import apply.model.RankDto;
import apply.model.SubjectDto;

public class RankDao extends SqlSessionDaoSupport{
	
	
	@Autowired
	SqlSession sqlSession;
	
	public List<RankDto> allselect(){
		return getSqlSession().selectList("rank.all");
	}

	public List<RankDto> oneselect(String month){
		return getSqlSession().selectList("rank.one",month);
	}
	
	public List<RankDto> month3(String month3){
		return getSqlSession().selectList("rank.month",month3);
	}
	
	public List<RankDto> use(String year){
		return getSqlSession().selectList("rank.use",year);
	}
	
	public List<SubjectDto> radar(){
		return getSqlSession().selectList("rank.radar");
	}
	
	public List<RankDto> user_hap(String user_hap_total){
		return getSqlSession().selectList("rank.user_hap", user_hap_total);
	}
	
	
	
	
}

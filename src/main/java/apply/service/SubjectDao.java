package apply.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import apply.model.SubjectDto;

public class SubjectDao extends SqlSessionDaoSupport{
	
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	int n=0;
	int m=0;
	
	
	public List<SubjectDto> finish_sub(String finish_date){
		return getSqlSession().selectList("subject.finish_all",finish_date);
	}
	
	public SubjectDto oneselect(String a) {
		return getSqlSession().selectOne("subject.one",a);
	}
	
	public int s_countup(SubjectDto a) {
		int i = getSqlSession().update("subject.countup", a);
		System.out.println("서브젝트카우트::"+i);
		return  i;
	}
	
	public int countfail(String subjectName) {
		return getSqlSession().update("subject.fail", subjectName);
	}
	
	public void create(SubjectDto a) {
		
		String sql= "create table "+a.getSubjectName();
		sql = sql + "(subname varchar(20) ,"
				   + "s_email varchar(20) primary key)";
		try {
			HashMap map = new HashMap();
			map.put("sql", sql);
			m = getSqlSession().update("subject.create",map);
			
			if (n != 0) {
				System.out.println("테이블 생성 완료");
			} else {
				System.out.println("이미 테이블 존재");
			}
			
		} catch (Exception e) {
			System.out.println("이미 테이블 존재");
		}
		
	} 
	
	public int s_enroll(SubjectDto a) {
		try {
			n = getSqlSession().insert("subject.apply",a);
			if (n != 0) {
				System.out.println("수강 신청 완료");
				n=0;
			} else {
				System.out.println("수강 신청 실패");
				n=1;
			}
		} catch (Exception e) {
			n=2;
			System.out.println("이미 등록된 수강생");
		}
		return n;
	}
	
	/*
	 * public void s_enroll(SubjectDto a) {
	 * 
	 * String sql= "insert into "+a.getSubjectName(); sql = sql +
	 * " values("+a.getSubjectName()+"," + a.getS_email()+")";
	 * System.out.println(sql); try { HashMap map = new HashMap(); map.put("sql1",
	 * sql); t= getSqlSession().insert("subject.apply",map);
	 * 
	 * if (t != 0) { System.out.println("수강 신청 완료"); } else {
	 * System.out.println("수강 신청 실패"); }
	 * 
	 * } catch (Exception e) { System.out.println("수강 신청 실패"); }
	 * 
	 * }
	 */
	

}

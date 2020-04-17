package upload.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import apply.model.SubjectDto;;

public class UploadDao extends SqlSessionDaoSupport {
	
	
	/*
	 * public List<UploladDto> allselect(){ return
	 * getSqlSession().selectList("upload.all"); }
	 */
	
	/*
	 * public SubjectDto oneselect(String a) { return
	 * getSqlSession().selectOne("subject.one", a); }
	 */
	
	public int insert(UploadDto dto) {

		return getSqlSession().insert("upload.insert", dto);
	}
}

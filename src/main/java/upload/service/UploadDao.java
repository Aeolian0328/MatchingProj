package upload.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;


public class UploadDao extends SqlSessionDaoSupport {
	
	public int select(String subjectName) {
		return getSqlSession().selectOne("upload.check", subjectName);
	}

	public int insert(UploadDto dto) {
		return getSqlSession().insert("upload.insert", dto);
	}
}

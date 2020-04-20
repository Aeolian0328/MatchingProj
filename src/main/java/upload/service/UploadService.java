package upload.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import upload.service.UploadDao;


@Component
public class UploadService {

	@Autowired
	UploadDao dao;

	public void setDao(UploadDao dao) {
		this.dao = dao;
	}

	public int insertUpload(UploadDto dto) {
		return dao.insert(dto);
	}
	
	public int subjectCheck(String subjectName) {
		return dao.select(subjectName);
	}
}

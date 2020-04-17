package upload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
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
}

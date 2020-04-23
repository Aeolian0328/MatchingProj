package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.Dao.StudentDto;
import admin.Dao.TeacherDto;
import admin.service.StudentService;
import admin.service.TeacherService;
import apply.model.SubjectDto;
import apply.service.SubjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adminController {
	
	public adminController() {
	}
	
	@Autowired
	StudentService studentService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	SubjectService subjectService;

	//첫 관리자 페이지
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public String administartor()
	{
		return "admin/adminIndex";
	}
	
	//회원 관리
	@RequestMapping(value = "userManager.do", method = RequestMethod.GET)
	public String UserManager()
	{
		return "admin/UserManagerform";
	}
	
	//학생 리스트
	@RequestMapping(value = "adminStudentTables.do", method = RequestMethod.GET)
	public String StudentList(Model sModel)
	{
		List<StudentDto> list = studentService.StudentList();
		sModel.addAttribute("list", list);
		return "admin/StudentManager";
	}
	//선생 리스트
	@RequestMapping(value = "adminTeacherTables.do", method = RequestMethod.GET)
	public String TeacherList(Model tModel)
	{
		List<TeacherDto> list = teacherService.TeacherList();
		tModel.addAttribute("list", list);
		return "admin/TeacherManager";
	}
	//강좌 리스트
	@RequestMapping(value = "adminSubjectTables.do", method = RequestMethod.GET)
	public  String unConfirmedList(Model tModel)
	{
	
		
		List<SubjectDto> list = subjectService.unConfirmed();
		
		tModel.addAttribute("list",list);
		return "admin/SubjectManager";
	}
	
	
	//학생 엑셀뽑기
	@RequestMapping(value = "StudentExport.do", method = RequestMethod.GET)
	 public ModelAndView StudentExcelDownloader(){
		  
		  List<StudentDto> list = studentService.StudentList();
		  
		  return new ModelAndView("StudentExcel","pageRanks",list);
	  }
	//선생 엑셀 뽑기
	@RequestMapping(value = "TeacherExport.do", method = RequestMethod.GET)
	 public ModelAndView TeacherExcelDownloader(){
		 
		  List<TeacherDto> list = teacherService.TeacherList();
		  
		  return new ModelAndView("TeacherExcel","pageRanks",list);
	  }
	
	//강좌 엑셀 뽑기
	@RequestMapping(value = "SubjectExport.do", method = RequestMethod.GET)
	 public ModelAndView SubjectExcelDownloader()
	{
			List<SubjectDto> list = subjectService.allselect();
			 return new ModelAndView("SubjectExcel","pageRanks",list);
	}
	//학생 삭제
	@RequestMapping(value = "StudentDelete.do", method = RequestMethod.GET)
	public String StudentDelete(int s_num)
	{
		studentService.Delete(s_num);
		return "redirect:adminStudentTables.do";
	}
	//선생 삭제
	@RequestMapping(value = "TeacherDelete.do", method = RequestMethod.GET)
	public String TeacherDelete(int t_num)
	{
		teacherService.Delete(t_num);
		return "redirect:teacherList.do";
	}
	
	//강좌 삭제
	@RequestMapping(value = "SubjectDelete.do", method = RequestMethod.GET)
	public String SubjectDelete(int subjectNum)
	{
		subjectService.delete(subjectNum);
		return "redirect:adminSubjectTables.do";
	}
	
	@RequestMapping(value = "SubjectConfirm.do", method = RequestMethod.GET)
	public String SubjectConfirm(int subjectNum)
	{
		subjectService.confirm(subjectNum); 
		return "redirect:adminSubjectTables.do";
	}
	
	
	
	/*
	 * public String SubjectList() { List<SubjectDto> list = subjectService. }
	 */
		
}

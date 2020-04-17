package apply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import apply.model.SubjectDto;
import apply.service.RankService;
import apply.service.SubjectService;

@Controller
public class SubjectController {


	@Autowired
	SubjectService sub;
	
	@Autowired
	RankService rank;
	

	@ModelAttribute("subject")
	public List<SubjectDto> Data() {
		List<SubjectDto> list = sub.allselect();
		return list;
	}
	
	@RequestMapping(value = "/index1.do")
	public String form() {
		return "apply/list";
	}
	
	
//	
//	@RequestMapping(value = "/graph1.do")
//	public String graph1() {
//		return "graph";
//	}
//	
	
	
	@RequestMapping(value = "/list.do")
	public String sel_one(@RequestParam("subjectName") String subjectName, Model model) {
		SubjectDto dto = sub.oneselect(subjectName);
		model.addAttribute("sel_sub",dto);
		return "apply/sel_subject";
	}
	

	@RequestMapping(value="/count.do")
	@ResponseBody
	public Map<String, Object> countup(SubjectDto s) throws Exception {
		Map<String, Object> map =  new HashMap<String, Object>();	
		String message = null ;
		
		sub.create(s);
		int ck = sub.s_enroll(s);
		if(ck==1) {
			message ="수강 신청오류입니다.";
		}
		else if(ck==2) {
			message ="이미 등록된 강좌 입니다.";
		} 
		else if(ck==0) {
			//수강 완료
			int ck1 = sub.s_countup(s);
			if(ck1==0) {
				message ="수강신청오류입니다.";
			} else if(ck1==1) {
				message ="과목 카운트 성공 및 수강신청 완료";
			}
		}
		
		/*
		 * map.put("countup", sub.s_countup(s)); //과목 카운트 0,1 map.put("s_enroll",
		 * sub.s_enroll(s)); // 수강완료 0 수강실패1 이미있는사람2
		 */		
		
		map.put("message", message);
		
		return map;
		
	}
	

	
	
	
//	@RequestMapping(value="/count.do")
//	@ResponseBody
//	public int countup(SubjectDto s) throws Exception {
//		sub.create(s);
//	    System.out.println(sub.s_enroll(s));
//		return sub.countup(s);
//		
//	}
	
	
	
	
//	@RequestMapping(value = "/index123.do")
//	public String create(String subjectName) {
//		 sub.create(subjectName);
//		 return "list";
//	}
	
	
	
//	@RequestMapping(value="/countfail.do")
//	@ResponseBody
//	public int countfail(String subjectName) throws Exception {
//		int a = sub.countfail(subjectName);
//		return a;
//	}
	
}

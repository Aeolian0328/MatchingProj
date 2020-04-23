package apply.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import apply.model.RankDto;
import apply.model.SubjectDto;
import apply.service.RankService;
import apply.service.SubjectService;

@Controller

public class RankController {
	
	@Autowired
	RankService rank;
	
	@Autowired
	SubjectService subject;
	
	
//	@ModelAttribute("list")
//	public LoginCommand formBacking() {
//		return new LoginCommand();
//	}
	

//	@ModelAttribute("listlist")
//	public RankDto set() {
//		return new RankDto();
//	}
	
	@ModelAttribute("list")
	public List<SubjectDto> Data() {
		List<SubjectDto> list = subject.allselect();
//		System.out.println(list);
		return list;
	}
	

	@RequestMapping(value = "/graph1.do")
	public String form() {
		return "apply/graph";
	}
	
//	@RequestMapping(value = "/graph2.do")
//	@ResponseBody
//	public void form1() {
//		System.out.println("aa");
//	}
//	

	
	//dist에서 오니까
	@RequestMapping(value="/dist/graph2.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String one() throws Exception {
		recent_date();
		List<SubjectDto> list = subject.allselect();
		Gson json = new Gson(); 		
		return json.toJson(list);
	}
	
	
	@RequestMapping(value="/dist/graph3.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String two(Model model) throws Exception {
		
		
		List<String> month3_sub = new ArrayList<>(); //1월
		List<String> month2_sub = new ArrayList<>(); //2월
		List<String> month1_sub = new ArrayList<>(); //3월

		recent_date();

		List<SubjectDto> list1 = rank.month3(recent_date().get(0));
		List<SubjectDto> list2 = rank.month3(recent_date().get(1));
		List<SubjectDto> list3 = rank.month3(recent_date().get(2));
		
		for(int i=0;i<list1.size();i++) {
			month3_sub.add(list1.get(i).getSubjectName());
		}
		
		for(int i=0;i<list2.size();i++) {
			month2_sub.add(list2.get(i).getSubjectName());
		}
		
		for(int i=0;i<list3.size();i++) {
			month1_sub.add(list3.get(i).getSubjectName());
		}
		
		
		List<Integer> month3_count = new ArrayList<>(); //1월
		List<Integer> month2_count = new ArrayList<>(); //2월
		List<Integer> month1_count = new ArrayList<>(); //3월
		
		
		for(int i=0;i<list1.size();i++) {
			month3_count.add(list1.get(i).getStudentCount());
		}
		
		for(int i=0;i<list2.size();i++) {
			month2_count.add(list2.get(i).getStudentCount());
		}
		
		for(int i=0;i<list3.size();i++) {
			month1_count.add(list3.get(i).getStudentCount());
		}
		
		
		List<String> year = new ArrayList<>(); 
		List<String> ck = new ArrayList<>(); 
		
		Date today = new Date();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdformat1 = new SimpleDateFormat("MM");
		
		String a = sdformat.format(today);
		String b = sdformat1.format(today);
		
		
		System.out.println(a);
		for(int i=1;i<=12;i++) {
			year.add(a+"년"+i+"월");
		}
		
		
		for(int i=1;i<=12;i++) {
			if(Integer.parseInt(b)>i) {
				if(i<10) {
					ck.add(a+"-0"+i);
				}else {
					ck.add(a+"-"+i);
				}
				
			}
		}
		
		System.out.println("asdsad"+ck);
		
		
		
		List<Integer> use_count = new ArrayList<>();
		List<SubjectDto> list4 = new ArrayList<SubjectDto>();
		
		for(int i=0;i<ck.size();i++) {
			list4.addAll(rank.use(ck.get(i)));
		}
		
		for(int i=0;i<list4.size();i++) {
		use_count.add(list4.get(i).getSum());
		}
		
		
		List<String> tagname = new ArrayList<>(); 
		List<SubjectDto> list5 = rank.radar();
		
		for(int i=0;i<list5.size();i++) {
			tagname.add(list5.get(i).getSubjecttag());
			}
		
		
		List<Integer> user_hap_total_20 = new ArrayList<>(); 
		List<Integer> user_hap_total_30 = new ArrayList<>(); 
		List<Integer> user_hap_total_40 = new ArrayList<>(); 
		
		String age_20 = "2";
		String age_30 = "3";
		String age_40 = "4";
		
		System.out.println("태그네임"+tagname);
		
		List<SubjectDto> list6 = new ArrayList<>();
		List<SubjectDto> list7 = new ArrayList<>();
		List<SubjectDto> list8 = new ArrayList<>();
 
		for(int i=0;i<tagname.size();i++) {
//			System.out.println(tagname.get(i));
			
			list6.addAll(rank.user_hap(tagname.get(i),age_20));
			list7.addAll(rank.user_hap(tagname.get(i),age_30));
			list8.addAll(rank.user_hap(tagname.get(i),age_40));
		}
		
		for(int i=0;i<list6.size();i++) {
			user_hap_total_20.add(list6.get(i).getSum());
			}
		for(int i=0;i<list7.size();i++) {
			user_hap_total_30.add(list7.get(i).getSum());
			}
		for(int i=0;i<list8.size();i++) {
			user_hap_total_40.add(list8.get(i).getSum());
			}
		
		

		
		
		System.out.println("m"+month3_sub);
		System.out.println(month2_sub);
		System.out.println(month1_sub);
		
		model.addAttribute("month3_sub", month3_sub);
		model.addAttribute("month2_sub", month2_sub);
		model.addAttribute("month1_sub", month1_sub);
		model.addAttribute("month3_count", month3_count);
		model.addAttribute("month2_count", month2_count);
		model.addAttribute("month1_count", month1_count);
		model.addAttribute("recent_date", recent_date());
		model.addAttribute("year", year);
		model.addAttribute("use_count", use_count);
		model.addAttribute("tagname", tagname);
		model.addAttribute("user_hap_total_20", user_hap_total_20);
		model.addAttribute("user_hap_total_30", user_hap_total_30);
		model.addAttribute("user_hap_total_40", user_hap_total_40);
		
	
		Gson json = new Gson(); 		
		return json.toJson(model);
	}
	
	public List<String> recent_date() {
		
		Date today = new Date();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM");
		List<String> mon3_list = new ArrayList<>();
			
		
		for(int i=-3;i<=-1;i++) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.MONTH, i);
			mon3_list.add(sdformat.format(cal.getTime()));
		}
		System.out.println(mon3_list);
		return mon3_list;
	}
	



	
	
	
//	
//
//
//	public void setRank(RankService rank) {
//		this.rank = rank;
//	}
//  
	
	
	

//	@RequestMapping(method = RequestMethod.POST)
//	public String submit(@ModelAttribute("listlist") RankDto rankdto ) {
//		
//	}
	

//	@RequestMapping("/graph/*") //공통적인 맵핑 url
	
	//일반적인 controller어노테이션을 jsp <=> controller을 연동할때 사용하지만
	//RestController은 그 데이터 자체를 받아서 제이슨 형식으로 바꿔서 출력하고 싶을때 사용
	//(지금은 json 형식으로 차트를 그릴것이기 때문에 Rest를 붙여서 컨트롤러를 선언한 것이다)
	






	
	
	
	
//	@RequestMapping(method = RequestMethod.GET)
//	public ModelAndView form() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("show");
////		return "show";
//		return mav;
//	}
	
	
	
//	@RequestMapping("/rank")
//	public ModelAndView handleRequest() {
//		List<RankDto> list = rank.allselect();
//		return new ModelAndView("dept", "dept", list);
//	}

	
	

}

package regist;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main.do")
public class MainCont {
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {return "index";}

}

package regist;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/testTiles.do")
public class TestCont {
	
	@RequestMapping(method=RequestMethod.GET)
	public String form() {return "indexTest";}

}

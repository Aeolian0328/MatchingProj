package login;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logOut.do")
public class LogOut {
	
	@RequestMapping
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/index.jsp";
	}
}

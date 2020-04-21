package login;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loginSelect.do")
public class LoginSelectCont {

	@ModelAttribute("loginCommand")
	public LoginCommand formBacking() {return new LoginCommand();}

	@RequestMapping
	public String loginSelect() {
		return "loginSelect";
	}
}

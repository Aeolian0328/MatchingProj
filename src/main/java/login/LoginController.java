package login;

import java.io.IOException;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.RequestMapping;


import regist.MemberInfo;

@Controller
@RequestMapping("LoginStudent.do")
public class LoginController {
	
	@Autowired
	private LoginService serv;

	public void setServ(LoginService serv) {
		this.serv = serv;
	}

	@Autowired
	private LoginCommandValidator vali;
	public void setVali(LoginCommandValidator vali) { this.vali = vali; }

	/*
	 * @ModelAttribute("login") public LoginCommand formBacking() {return new
	 * LoginCommand();}
	 */
	/*
	 * @RequestMapping(method=RequestMethod.GET) public String form() {return
	 * "login/loginForm";}
	 */
	@RequestMapping
	public String submit(LoginCommand loginCommand,BindingResult result,HttpSession session) 
		throws IOException {
		System.out.println("컨트롤러::"+loginCommand.getEmail());
		vali.validate(loginCommand,result);
		if(result.hasErrors()) {
			return "loginSelect";
		}
		String s_email=loginCommand.getEmail();
		MemberInfo loginData=serv.getMemberInfo(s_email);
		session.setAttribute("loginData",loginData);
		if(s_email.equals("admin@admin"))
		{
			return "admin/adminform";
		}
		
		
		return "index";
		/*
		 * Cookie c = createCookie("nowLogin",e,req.getContextPath()); res.addCookie(c);
		 */
	}
	/*
	 * private Cookie createCookie(String name, String value, String path) throws
	 * IOException { Cookie cookie = new Cookie(name, URLEncoder.encode(value,
	 * "utf-8")); cookie.setPath(path); return cookie; }
	 */
}

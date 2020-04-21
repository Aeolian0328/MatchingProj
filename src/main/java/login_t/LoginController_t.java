package login_t;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import login.LoginCommand;
import regist_t.MemberInfo_t;

@Controller
@RequestMapping("LoginTeacher.do")
public class LoginController_t {
	
	@Autowired
	private LoginService_t serv;
	public void setServ(LoginService_t serv) {
		this.serv = serv;
	}

	@Autowired
	private LoginCommandValidator_t vali;
	public void setVali(LoginCommandValidator_t vali) { this.vali = vali; }

	@RequestMapping
	public String submit(LoginCommand loginCommand,BindingResult result, HttpSession session){
		vali.validate(loginCommand,result);
		if(result.hasErrors()) {
			return "loginSelect";
		}
		String t_email=loginCommand.getEmail();
		MemberInfo_t loginData=serv.getMemberInfo(t_email);
		session.setAttribute("loginData",loginData);
		
		session.setAttribute("loginData",loginData);
		return "index";
	}
}

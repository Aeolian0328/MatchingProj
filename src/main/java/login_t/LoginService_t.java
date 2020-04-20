package login_t;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import login.LoginCommand;
import regist_t.MemberInfo_t;

@Service
public class LoginService_t {
	
	@Autowired
	private LoginDao_t lDao;
	public void setlDao(LoginDao_t lDao) { this.lDao = lDao; }

	private List<String> e;
	    
	    public List<String> getEmail() { return lDao.getEmail(); }
	    public String getPassword(String email) { return lDao.getPassword(email);}
	    public MemberInfo_t getMemberInfo(String email) { return lDao.getMemberInfo(email); }
	    
	    public Errors checkEmail(Object target, Errors errors) {
	    	
	    	LoginCommand memberInfo= (LoginCommand)target;
	        
	        e = getEmail();
	        String t_email = memberInfo.getEmail();
	        String password = memberInfo.getPassword();
	        
	        if (t_email.equals("")) { 
	        	errors.rejectValue("email", "required");
	        	if(password.equals("")) { errors.rejectValue("password", "required"); }
	        }else { 
	        	int x = 0;
	            for (int i = 0; i < e.size(); ++i) {
	                if (e.get(i).equals(t_email)) { 
	                	x = 1; 
				        String t_compare = getPassword(t_email);
				        if(!password.equals(t_compare)) { errors.rejectValue("password", "notSame"); }
				    }
	            }
	            if (x == 0) { errors.rejectValue("email", "unique"); }
	        }
	        return errors;
	    }
	}
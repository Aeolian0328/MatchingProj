package regist;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( "/RegistSelect.do" )
public class RegistSelect
{

    private String formViewName;
    
    public RegistSelect() {
        formViewName = "student/s_regist/registSelect";
    }
    
    @ModelAttribute
    protected Object formBackingObject() throws Exception {
        return new MemberInfo();
    }
    
    @RequestMapping(method = { RequestMethod.GET })
    public String form(Model model) {
        return formViewName;
    }
 
}
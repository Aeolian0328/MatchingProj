package login_t;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import regist_t.MemberInfo_t;

public class LoginDao_t extends SqlSessionDaoSupport {
	public List<String> getEmail(){ return getSqlSession().selectList("regist.t_email"); }
	public String getPassword(String email) { return getSqlSession().selectOne("regist.t_login",email); }
	public MemberInfo_t getMemberInfo(String email) { return getSqlSession().selectOne("regist.t_loginData",email);}
}

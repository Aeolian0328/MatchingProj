package board.DtoDaoService;

import java.sql.Timestamp;

public class ReplyDto {
	
	private int rno;
	private int code; //게시글 번호
	private String replytext;
	private String replyer;
	private String name;
	private String reg_datetime;
	private String reg_updatetime;
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getReg_datetime() {
		return reg_datetime;
	}
	public void setReg_datetime(String reg_datetime) {
		this.reg_datetime = reg_datetime;
	}
	public String getReg_updatetime() {
		return reg_updatetime;
	}
	public void setReg_updatetime(String reg_updatetime) {
		this.reg_updatetime = reg_updatetime;
	}
	
	
	
	public ReplyDto(int rno, int code, String replytext, String replyer, String name, String reg_datetime,
			String reg_updatetime) {
		super();
		this.rno = rno;
		this.code = code;
		this.replytext = replytext;
		this.replyer = replyer;
		this.name = name;
		this.reg_datetime = reg_datetime;
		this.reg_updatetime = reg_updatetime;
	}
	public ReplyDto() {}
	@Override
	public String toString() {
		return "ReplyDto [rno=" + rno + ", code=" + code + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", name=" + name + ", reg_datetime=" + reg_datetime + ", reg_updatetime=" + reg_updatetime + "]";
	}
	
	
	
	

}

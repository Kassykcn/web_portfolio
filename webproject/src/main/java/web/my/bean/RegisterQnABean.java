package web.my.bean;

public class RegisterQnABean {
	int Q_idx, A_idx; //문의번호, 답변번호
	int idx; // 글번호
	String id; //회원 id
	String Q_date, Q_secret, Q_text, Q_state ; //등록일, 비공개여부, 내용, 상태
	String A_date, A_secret, A_text ; //답변일, 비공개여부, 내용, 상태
	
	public int getQ_idx() {
		return Q_idx;
	}
	public void setQ_idx(int q_idx) {
		Q_idx = q_idx;
	}
	public int getA_idx() {
		return A_idx;
	}
	public void setA_idx(int a_idx) {
		A_idx = a_idx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_date() {
		return Q_date;
	}
	public void setQ_date(String q_date) {
		Q_date = q_date;
	}
	public String getQ_secret() {
		return Q_secret;
	}
	public void setQ_secret(String q_secret) {
		Q_secret = q_secret;
	}
	public String getQ_text() {
		return Q_text;
	}
	public void setQ_text(String q_text) {
		Q_text = q_text;
	}
	public String getQ_state() {
		return Q_state;
	}
	public void setQ_state(String q_state) {
		Q_state = q_state;
	}
	public String getA_date() {
		return A_date;
	}
	public void setA_date(String a_date) {
		A_date = a_date;
	}
	public String getA_secret() {
		return A_secret;
	}
	public void setA_secret(String a_secret) {
		A_secret = a_secret;
	}
	public String getA_text() {
		return A_text;
	}
	public void setA_text(String a_text) {
		A_text = a_text;
	}
	
	
	
}

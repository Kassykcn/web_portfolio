package web.my.bean;

public class RegisterQnABean {
	int Q_idx, A_idx, idx; //문의번호, 글번호
	String QnA_date, id, QnA_secret, QnA_type, QnA_text, QnA_state ; //문의일, 회원id, 비공개여부, 질문/응답 구분, 내용, 상태
	
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
	public String getQnA_date() {
		return QnA_date;
	}
	public void setQnA_date(String qnA_date) {
		QnA_date = qnA_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQnA_secret() {
		return QnA_secret;
	}
	public void setQnA_secret(String qnA_secret) {
		QnA_secret = qnA_secret;
	}
	public String getQnA_type() {
		return QnA_type;
	}
	public void setQnA_type(String qnA_type) {
		QnA_type = qnA_type;
	}
	public String getQnA_text() {
		return QnA_text;
	}
	public void setQnA_text(String qnA_text) {
		QnA_text = qnA_text;
	}
	public String getQnA_state() {
		return QnA_state;
	}
	public void setQnA_state(String qnA_state) {
		QnA_state = qnA_state;
	}
	
}

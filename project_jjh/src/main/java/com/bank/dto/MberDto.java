package com.bank.dto;

public class MberDto {
    private String mberCode;	//�ڵ�
    private String mberId;		//���̵�
    private String mberPw;		//��й�ȣ
    private String mberRlnm;	//�Ǹ�
    private String bankCode;	//�����ڵ�
    private String mberAcountNo;//���¹�ȣ
    private String mberEmail;	//�̸���
    private String mberNcnm;	//�г���
    private String mberTel;		//��ȭ��ȣ
    private String mberBrthdy;	//�������
    private String mberAuthorLevel;//ȸ����ȯ ����
    private String srbde;		//������
    private String mberSecsnAt;	//ȸ��Ż�� ����
    

	@Override
	public String toString() {
		return "MberDto [mberCode=" + mberCode + ", mberId=" + mberId + ", mberPw=" + mberPw + ", mberRlnm=" + mberRlnm
				+ ", bankCode=" + bankCode + ", mberAcountNo=" + mberAcountNo + ", mberEmail=" + mberEmail
				+ ", mberNcnm=" + mberNcnm + ", mberTel=" + mberTel + ", mberBrthdy=" + mberBrthdy
				+ ", mberAuthorLevel=" + mberAuthorLevel + ", srbde=" + srbde + ", mberSecsnAt=" + mberSecsnAt + "]";
	}
	public String getMberSecsnAt() {
		return mberSecsnAt;
	}
	public void setMberSecsnAt(String mberSecsnAt) {
		this.mberSecsnAt = mberSecsnAt;
	}
	
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public String getMberId() {
		return mberId;
	}
	public void setMberId(String mberId) {
		this.mberId = mberId;
	}
	public String getMberPw() {
		return mberPw;
	}
	public void setMberPw(String mberPw) {
		this.mberPw = mberPw;
	}
	public String getMberRlnm() {
		return mberRlnm;
	}
	public void setMberRlnm(String mberRlnm) {
		this.mberRlnm = mberRlnm;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getMberAcountNo() {
		return mberAcountNo;
	}
	public void setMberAcountNo(String mberAcountNo) {
		this.mberAcountNo = mberAcountNo;
	}
	public String getMberEmail() {
		return mberEmail;
	}
	public void setMberEmail(String mberEmail) {
		this.mberEmail = mberEmail;
	}
	public String getMberNcnm() {
		return mberNcnm;
	}
	public void setMberNcnm(String mberNcnm) {
		this.mberNcnm = mberNcnm;
	}
	public String getMberTel() {
		return mberTel;
	}
	public void setMberTel(String mberTel) {
		this.mberTel = mberTel;
	}
	public String getMberBrthdy() {
		return mberBrthdy;
	}
	public void setMberBrthdy(String mberBrthdy) {
		this.mberBrthdy = mberBrthdy;
	}
	public String getMberAuthorLevel() {
		return mberAuthorLevel;
	}
	public void setMberAuthorLevel(String mberAuthorLevel) {
		this.mberAuthorLevel = mberAuthorLevel;
	}
	public String getSrbde() {
		return srbde;
	}
	public void setSrbde(String srbde) {
		this.srbde = srbde;
	}



}
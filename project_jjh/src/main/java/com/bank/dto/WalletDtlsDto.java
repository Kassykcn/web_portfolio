package com.bank.dto;

import java.sql.Timestamp;

public class WalletDtlsDto {
	
	private String mberCode;	//ȸ���ڵ�
	private Timestamp rcppayDt;	//����� �Ͻ�
	private String rcppayCl;	//����� �з�
	private int rcppayAmount;	//����� �ݾ�
	private int excngCoinCo;	//ȯ�� ���� ��
	
	@Override
	public String toString() {
		return "WalletDtlsDto [mberCode=" + mberCode + ", rcppayDt=" + rcppayDt + ", rcppayCl=" + rcppayCl
				+ ", rcppayAmount=" + rcppayAmount + ", excngCoinCo=" + excngCoinCo + "]";
	}
	public String getMberCode() {
		return mberCode;
	}
	public void setMberCode(String mberCode) {
		this.mberCode = mberCode;
	}
	public Timestamp getRcppayDt() {
		return rcppayDt;
	}
	public void setRcppayDt(Timestamp rcppayDt) {
		this.rcppayDt = rcppayDt;
	}
	public String getRcppayCl() {
		return rcppayCl;
	}
	public void setRcppayCl(String rcppayCl) {
		this.rcppayCl = rcppayCl;
	}
	public int getRcppayAmount() {
		return rcppayAmount;
	}
	public void setRcppayAmount(int rcppayAmount) {
		this.rcppayAmount = rcppayAmount;
	}
	public int getExcngCoinCo() {
		return excngCoinCo;
	}
	public void setExcngCoinCo(int excngCoinCo) {
		this.excngCoinCo = excngCoinCo;
	}
	


}

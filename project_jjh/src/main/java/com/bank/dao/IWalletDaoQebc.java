package com.bank.dao;

import java.util.List;

public interface IWalletDaoQebc {	//�������� dao QEBC

	List<Object> selectMultiWalletDtls(String mberCode);
}
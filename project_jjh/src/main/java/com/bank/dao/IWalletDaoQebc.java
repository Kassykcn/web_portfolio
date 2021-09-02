package com.bank.dao;

import java.util.List;

public interface IWalletDaoQebc {	//지갑서비스 dao QEBC

	List<Object> selectMultiWalletDtls(String mberCode);
}
package web.my.utils;

import org.springframework.stereotype.Repository;

@Repository
public class SortFilterSearch {
	
	String word = "where "; //필터와 검색에 사용된다. 조건에 따라 where 또는 and로 저장
	
	/*** 정렬  ***/
	public String getSort(int sort_num) {
		String sort = ""; 
		
		switch (sort_num) {
			case 0: sort = "reg_date desc"; break;
			case 1: sort = "start_date asc"; break;
			case 2: sort = "start_date desc"; break;
			case 3: sort = "hits desc"; break;
			default: sort = "reg_date desc"; break;
		}
		
		return sort;
	}
	
	/*** 필터  ***/
	public String getFilter(String filter_codeC, String filter_codeD) {
		String filterC = ""; // 거래종류 필터 (where 값)
		String filterD = "";
		if(filter_codeC != null) {
			switch (filter_codeC) {
				case "0": filterC = ""; break;
				case "c0": filterC = ""; break;
				case "c1": filterC = word+"classify='경매'"; break;
				case "c2": filterC = word+"classify='구매'"; break;
			}
			
			if(filterC == "" || filterC == "c0") {
				word = "where ";
			}else {
				word = " and ";
			}
		}
		if(filter_codeD != null) {
			switch (filter_codeD) {
				case "0": filterD = ""; break;
				case "d0": filterD = ""; break;
				case "d1": filterD = word+"deal_state='진행중'"; break;
				case "d2": filterD = word+"deal_state='기간만료'"; break;
				case "d3": filterD = word+"deal_state='거래완료'"; break;
				default: filterD = ""; break;
			}
		}
		String filter = filterC + filterD;
		
		return filter;
	}
	
	
	/*** 검색 ***/
	public String getSearch(String search_key, String search_txt) {
		if(word != "and") {
			word = "where ";
		}else {
			word = " and ";
		}
		
		String search = "";
		if(search_key != null && search_txt != null) {
			search = word + search_key+ " like '%"+ search_txt+ "%'";
		}
		/*
		System.out.println("-----------------search_key: "+search_key);
		System.out.println("-----------------search_txt: "+search_txt);
		System.out.println("-----------------search: "+search);
		*/
		return search;
	}
	
}

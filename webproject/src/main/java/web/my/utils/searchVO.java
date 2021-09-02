package web.my.utils;

import org.springframework.stereotype.Repository;

@Repository
public class searchVO {
	private String search_key, search_txt;

	public String getSearch_key() {
		return search_key;
	}

	public void setSearch_key(String search_key) {
		this.search_key = search_key;
	}

	public String getSearch_txt() {
		return search_txt;
	}

	public void setSearch_txt(String search_txt) {
		this.search_txt = search_txt;
	}
	
	
}

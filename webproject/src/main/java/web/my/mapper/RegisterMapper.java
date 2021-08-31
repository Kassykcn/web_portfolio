package web.my.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import web.my.bean.RegisterBean;

@Repository
//Mapper Interface : @방식의 sql, 호출 메서드 기술
public interface RegisterMapper {
	
	//카테고리 로드
	final String CATEGORY_FIRST = 
			"select distinct first from category";
	@Select(CATEGORY_FIRST)
	ArrayList<String> getCategoryFirst();
	final String CATEGORY_SECOND = 
			"select distinct second from category";
	@Select(CATEGORY_SECOND)
	ArrayList<String> getCategorySecond();
	final String CATEGORY_THIRD = 
			"select distinct third from category";
	@Select(CATEGORY_THIRD)
	ArrayList<String> getCategoryThird();
	
	//등록
	final String INSERT = "insert into register("
								+"idx, reg_date, id, classify, title, "
								+ "first, second, third, image, "
								+"grade, details, start_date, end_date, "
								+"price, min_bid, win_bid, deal_state ) "
							+ "values("
								+"null, now(), #{id}, #{classify}, #{title}, "
								+ "#{first}, #{second}, #{third}, #{image}, "
								+"#{grade}, #{details}, #{start_date}, #{end_date}, "
								+"#{price}, #{min_bid}, #{win_bid}, '진행중')";

	@Insert(INSERT)
	void insertRegister(RegisterBean rb);
	
	
	//전체 글 개수 조회
	final String SELECT_CNT_ALL = "select count(1) from register";
	@Select(SELECT_CNT_ALL)
	int getTotalCnt();
	
	//목록
	final String SELECT_LIST = "select a.* from ("
									+"select * from register "
									+"order by reg_date desc, idx desc) a "
								+"limit ${lenPage} offset ${page}";
	//DB컬럼과 동일하게 #{ } 지정
	@Select(SELECT_LIST) 
	@Results( id= "selectList", value= {
		@Result(property = "idx", column = "idx"),
		@Result(property = "classify", column = "classify"),
		@Result(property = "title", column = "title"),
		@Result(property = "start_date", column = "start_date"),
		@Result(property = "end_date", column = "end_date"),
		@Result(property = "deal_state", column = "deal_state"),
		@Result(property = "hits", column = "hits")
	})
	ArrayList<RegisterBean> getList(@Param("page") int page, @Param("lenPage") int lenPage); 
	
	//검색 - 검색된 게시글 개수
	final String SEARCH_CNT = "select count(1) from register "
			+"where ${search_key} like '%${search_txt}%' ";
	@Select(SEARCH_CNT)
	int getSearchCnt(@Param("search_key") String search_key, @Param("search_txt") String search_txt);
	
	//검색 - 검색된 게시글 내용
	final String SEARCH_ROW = "select a.* from ("
			  						+"select * from register "
			  						+"where ${search_key} like '%${search_txt}%' "
			  						+"order by reg_date desc, idx desc) a "
			  					+"limit ${lenPage} offset ${page}";
	  
	@Select(SEARCH_ROW)
	@ResultMap("selectList") 
	ArrayList<RegisterBean> getSearchList(
		@Param("page") int page, 
		@Param("lenPage") int lenPage, 
		@Param("search_key") String search_key, 
		@Param("search_txt") String search_txt);
	 
	
	//상세 페이지
	final String SELECT_PAGE = "select * from register where idx=#{idx}";
	@Select(SELECT_PAGE) 
	@ResultMap("selectList")
	RegisterBean getView(@Param("idx") int idx); 
	RegisterBean getViewHits(@Param("idx") int idx); 
	
	//조회수 증가
	final String HIT_UP = "update register set hits=hits+1 where idx=#{idx}";
	@Update(HIT_UP)
	void hitUp(@Param("idx") int idx);
	
	//수정
	final String UPDATE = "update register set "
							+"title=#{title}, first=#{first}, second=#{second}, "
							+"third=#{third}, image=#{image}, grade=#{grade}, "
							+"details=#{details}, start_date=#{start_date}, end_date=#{end_date}, "
							+"price=#{price}, min_bid=#{min_bid}, win_bid=#{win_bid} "
							+"where idx=#{idx}";
	@Update(UPDATE)
	void updateRegister(@Param("idx") int idx, @Param("title") String title, 
					 @Param("first") String first, @Param("second") String second,
					 @Param("third") String third, @Param("image") String image,
					 @Param("grade") String grade, @Param("details") String details,
					 @Param("start_date") String start_date, @Param("end_date") String end_date,
					 @Param("price") int price, @Param("min_bid") int min_bid, 
					 @Param("win_bid") int win_bid );
	void updateRegister(RegisterBean rb);
	
	//글 삭제
	final String DELETE = "delete from register where idx=#{idx}";
	@Delete(DELETE)
	void deleteRegister(@Param("idx") int idx);
	
	
}

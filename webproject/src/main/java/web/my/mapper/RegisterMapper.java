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
import web.my.bean.RegisterQnABean;

@Repository
//Mapper Interface : @방식의 sql, 호출 메서드 기술
public interface RegisterMapper {

	// 카테고리 로드
	final String CATEGORY_FIRST = "select distinct first from category";

	@Select(CATEGORY_FIRST)
	ArrayList<String> getCategoryFirst();

	final String CATEGORY_SECOND = "select distinct second from category where first=#{first}";

	@Select(CATEGORY_SECOND)
	ArrayList<String> getCategorySecond(@Param("first") String first);

	final String CATEGORY_THIRD = "select distinct third from category where second=#{second}";

	@Select(CATEGORY_THIRD)
	ArrayList<String> getCategoryThird(@Param("second") String second);

	// 등록
	final String INSERT = "insert into register(" 
				+ "idx, reg_date, id, classify, title, "
				+ "first, second, third, image1, image2, " 
				+ "grade, details, start_date, end_date, "
				+ "price, min_bid, win_bid, deal_state ) " 
			+ "values(" 
				+ "null, now(), #{id}, #{classify}, #{title}, "
				+ "#{first}, #{second}, #{third}, #{image1}, #{image2}, " 
				+ "#{grade}, #{details}, #{start_date}, #{end_date}, "
				+ "#{price}, #{min_bid}, #{win_bid}, '진행중')";

	@Insert(INSERT)
	void insertRegister(RegisterBean rb);

	// 목록 - 정렬, 필터, 검색 통합
	final String LIST_SEARCH_SORT_CNT = "select count(1) from register ${filter} ${search}";
	@Select(LIST_SEARCH_SORT_CNT)
	int getSearchSortCnt(@Param("filter") String filter, @Param("search") String search);

	// 정렬 - a태그 (시작일 낮은순, 시작일 높은순, 조회수 높은순)
	// 필터 - select box(거래종류, 거래상태)
	final String LIST_SEARCH_SORT = "select a.* from (" + "select * from register " + "${filter} " + "${search} "
			+ "order by ${sort}, idx desc) a " + "limit ${lenPage} offset ${page}";

	@Select(LIST_SEARCH_SORT)
	@Results(id = "selectList", value = { @Result(property = "idx", column = "idx"), 
			@Result(property = "id", column = "id"),
			@Result(property = "classify", column = "classify"), 
			@Result(property = "title", column = "title"),
			@Result(property = "start_date", column = "start_date"),
			@Result(property = "end_date", column = "end_date"),
			@Result(property = "deal_state", column = "deal_state"), 
			@Result(property = "hits", column = "hits") })

	ArrayList<RegisterBean> getListSearchSort(@Param("page") int page, 
			@Param("lenPage") int lenPage, // 페이징
			@Param("search") String search, // 검색
			@Param("filter") String filter, @Param("sort") String sort); // 필터, 정렬

	// 상세 페이지
	final String SELECT_PAGE = "select * from register where idx=#{idx}";

	@Select(SELECT_PAGE)
	@ResultMap("selectList")
	RegisterBean getView(@Param("idx") int idx);

	RegisterBean getViewHits(@Param("idx") int idx);

	// 조회수 증가
	final String HIT_UP = "update register set hits=hits+1 where idx=#{idx}";

	@Update(HIT_UP)
	void hitUp(@Param("idx") int idx);

	// 수정
	final String UPDATE = "update register set " 
			+ "title=#{title}, first=#{first}, second=#{second}, "
			+ "third=#{third}, image1=#{image1}, image2=#{image2}, grade=#{grade}, "
			+ "details=#{details}, start_date=#{start_date}, end_date=#{end_date}, "
			+ "price=#{price}, min_bid=#{min_bid}, win_bid=#{win_bid} " 
			+ "where idx=#{idx}";

	@Update(UPDATE)
	void updateRegister(RegisterBean rb);

	// 글 삭제
	final String DELETE = "delete from register where idx=#{idx}";

	@Delete(DELETE)
	void deleteRegister(@Param("idx") int idx);

	//상세페이지 Q&A 등록
	final String INSERT_Q = "insert into registerQ values(null, now(), "
			+ "#{idx}, #{id}, #{Q_secret}, #{Q_state}, #{Q_text})";
	final String INSERT_A = "insert into registerA values(null, now(), "
			+ "#{Q_idx}, #{id}, #{A_secret}, #{A_text})";

	@Insert(INSERT_Q)
	void insertQ(RegisterQnABean qnaBean);
	@Insert(INSERT_A)
	void insertA(RegisterQnABean qnaBean);

	//Q&A 답변완료 처리
	final String UPDATE_QNA_STATE = "update registerQ set Q_state='답변완료' where Q_idx=#{Q_idx} ";
	@Update(UPDATE_QNA_STATE)
	void update_QnA_state(@Param("Q_idx") int Q_idx);

	//Q&A 문의 수
	final String SELECT_QnA_CNT = "select count(1) from registerQ where idx=#{idx} ";
	@Select(SELECT_QnA_CNT)
	int getQnACnt(@Param("idx") int idx);
	

	//Q&A 내용
	//final String SELECT_QnA = "select * from registerQ where idx=#{idx} order by Q_idx desc";
	final String SELECT_QnA = 
			"select * from registerQ q left join registerA a "
			+ "on q.Q_idx = a.Q_idx where idx=#{idx} "
			+ "order by q.Q_idx desc";

	@Select(SELECT_QnA)
	@Results(id = "selectQList", value = { 
			@Result(property = "Q_idx", column = "Q_idx"),
			@Result(property = "Q_date", column = "Q_date"), 
			@Result(property = "idx", column = "idx"),
			@Result(property = "id", column = "id"), 
			@Result(property = "Q_secret", column = "Q_secret"),
			@Result(property = "Q_state", column = "Q_state"),
			@Result(property = "Q_text", column = "Q_text"),
			@Result(property = "A_date", column = "A_date"),
			@Result(property = "A_secret", column = "A_secret"),
			@Result(property = "A_text", column = "A_text")})
	ArrayList<RegisterQnABean> getQnAList(@Param("idx") int idx);

	//상세페이지 입찰 처리
	final String UPDATE_NOW_BID = "update register set "
			+ "deal_classify='입찰', deal_id=#{id}, deal_idx=#{idx}, now_bid=#{now_bid}, deal_date=now() where idx=#{idx}";
	@Update(UPDATE_NOW_BID)
	void update_now_bid(RegisterBean rb);
	//상세페이지 즉시낙찰 처리
	final String UPDATE_WIN_BID = "update register set "
			+ "deal_classify='즉시낙찰', deal_id=#{id}, deal_idx=#{idx}, deal_state = '거래완료', deal_date=now(), final_bid=#{win_bid} where idx=#{idx}";
	@Update(UPDATE_WIN_BID)
	void update_win_bid(RegisterBean rb);
	//상세페이지 구매 처리
	final String UPDATE_BUY = "update register set "
			+ "deal_classify='구매', deal_id=#{id}, deal_idx=#{idx}, deal_state = '거래완료', deal_date=now(), final_bid=#{price} where idx=#{idx}";
	@Update(UPDATE_BUY)
	void update_buy(RegisterBean rb);
	
}

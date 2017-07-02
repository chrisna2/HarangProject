package dto;

public class PagingDto {
	private int totalRecord; // 총 글의 개수
	private int numPerPage; // 한페이지당 보여질 글의 개수
	private int totalPage; // 전체 페이지 개수
	private int nowPage; // 현재 페이지 위치
	private int beginPerPage; // 각 페이지의 시작번호
	private int pagePerBlock; // [다음]을 눌렀을 때 한 블럭당 이동할 페이지 수
	private int totalBlock; // 전체 블럭의 개수
	private int nowBlock; // 현재 블럭 위치
	
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getBeginPerPage() {
		return beginPerPage;
	}
	public void setBeginPerPage(int beginPerPage) {
		this.beginPerPage = beginPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
}

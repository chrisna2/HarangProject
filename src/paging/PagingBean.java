package paging;

import paging.dto.PagingDto;

public class PagingBean {
	public PagingDto Paging(int size,int _numPerPage, int _nowPage, int _pagePerBlock , int _nowBlock){
		PagingDto paging = new PagingDto();
		paging.setTotalRecord(size);
		paging.setNumPerPage(_numPerPage);
		paging.setTotalPage((int)Math.ceil((double)paging.getTotalRecord()/paging.getNumPerPage()));
		paging.setNowPage(_nowPage);
		paging.setBeginPerPage(paging.getNowPage() * paging.getNumPerPage());
		paging.setPagePerBlock(_pagePerBlock);
		paging.setTotalBlock((int)Math.ceil((double)paging.getTotalPage()/paging.getPagePerBlock()));
		paging.setNowBlock(_nowBlock);
		return paging;
	}
}

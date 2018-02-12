package net.zypro.zq.util;

public class PageUtil {
    private int everyPage;  //每页显示条数
    private int totalCount; //记录
    private int beginIndex;  //查询起始点
    private int currentPage;
    private int prePage;
    private int nextPage;
    
	public int getEveryPage() {
		return everyPage;
	}
	public void setEveryPage(int everyPage) {
		this.everyPage = everyPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getBeginIndex() {
		return beginIndex;
	}
	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}
		
	public int getCurrentPage() {
		currentPage=beginIndex/everyPage+1;
		return currentPage;
	}
	public int getPrePage() {
		if(beginIndex-everyPage<0)
			prePage=beginIndex;
		else {
			prePage=beginIndex-everyPage;
		}
		return prePage;
	}
	public int getNextPage() {
		if(beginIndex+everyPage>=totalCount)
			nextPage=beginIndex;
		else {
			nextPage=beginIndex+everyPage;
		}
		return nextPage;
	}
}

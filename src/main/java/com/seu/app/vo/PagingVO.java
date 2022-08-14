package com.seu.app.vo;

public class PagingVO {
	
	// Paging
		private int nowPage = 1;
		private int onePageRecord = 6;
		private int totalRecord;
		private int totalPage;
		private	int offsetPoint;
		
		// page number
		private int onPageCount = 5;
		private int startPage = 1;
		
		// 검색
		private String searchKey;
		private String searchWord;
		@Override
		public String toString() {
			return "PagingVO [nowPage=" + nowPage + ", onePageRecord=" + onePageRecord + ", totalRecord=" + totalRecord
					+ ", totalPage=" + totalPage + ", offsetPoint=" + offsetPoint + ", onPageCount=" + onPageCount
					+ ", startPage=" + startPage + ", searchKey=" + searchKey + ", searchWord=" + searchWord + "]";
		}
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getOnePageRecord() {
			return onePageRecord;
		}
		public void setOnePageRecord(int onePageRecord) {
			this.onePageRecord = onePageRecord;
		}
		public int getTotalRecord() {
			return totalRecord;
		}
		public void setTotalRecord(int totalRecord) {
			this.totalRecord = totalRecord;
		}
		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getOffsetPoint() {
			return offsetPoint;
		}
		public void setOffsetPoint(int offsetPoint) {
			this.offsetPoint = offsetPoint;
		}
		public int getOnPageCount() {
			return onPageCount;
		}
		public void setOnPageCount(int onPageCount) {
			this.onPageCount = onPageCount;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public String getSearchKey() {
			return searchKey;
		}
		public void setSearchKey(String searchKey) {
			this.searchKey = searchKey;
		}
		public String getSearchWord() {
			return searchWord;
		}
		public void setSearchWord(String searchWord) {
			this.searchWord = searchWord;
		}
		
		

}

package test.cafe.dto;

public class CafeDto {
	public int num;
	public String writer;
	public String title;
	public String content;
	public int viewCount;
	public String regdate;
	public int StartRowNum;
	public int EndRowNum;
	
	public CafeDto() {}

	public CafeDto(int num, String writer, String title, String content, int viewCount, String regdate, int startRowNum,
			int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.regdate = regdate;
		StartRowNum = startRowNum;
		EndRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return StartRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		StartRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return EndRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		EndRowNum = endRowNum;
	}
	
}

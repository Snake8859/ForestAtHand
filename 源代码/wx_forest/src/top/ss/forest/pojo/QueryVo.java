package top.ss.forest.pojo;

public class QueryVo {

	//当前页
	private int page =1;
	//数据库从哪一条数据开始
	private int start;
	//每页显示的条数
	private int size = 5;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	
	
}

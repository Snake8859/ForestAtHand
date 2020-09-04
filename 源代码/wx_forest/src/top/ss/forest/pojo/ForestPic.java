package top.ss.forest.pojo;
/**
 * 林业资源图片
 * @author Administrator
 *
 */
public class ForestPic {
	 /* `pid` varchar(64) NOT NULL COMMENT '图片id',
	  `pictureName` varchar(256) NOT NULL COMMENT '图片名称',
	  `fid` varchar(64) NOT NULL COMMENT '资源id',*/
	
	private String pid;
	private String pictureName;
	private String fid_pic;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	public String getFid_pic() {
		return fid_pic;
	}
	public void setFid_pic(String fid_pic) {
		this.fid_pic = fid_pic;
	}

	
	
	
}

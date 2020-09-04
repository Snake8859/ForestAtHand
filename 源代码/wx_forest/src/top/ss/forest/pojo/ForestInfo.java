package top.ss.forest.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 林业资源
 * @author Snake
 *
 */
public class ForestInfo {
	 /* `fid` varchar(64) NOT NULL COMMENT '资源id',
	  `fName` varchar(32) NOT NULL COMMENT '资源名称',
	  `fType` varchar(64) DEFAULT NULL COMMENT '资源所属种类',
	  `fForm` varchar(256) DEFAULT NULL COMMENT '资源形态特征',
	  `fOrigin` varchar(256) DEFAULT NULL COMMENT '资源产地环境',
	  `fGrowthHabit` varchar(256) DEFAULT NULL COMMENT '资源生长习性',
	  `Latitude` double DEFAULT NULL COMMENT '纬度',
	  `Longitude` double DEFAULT NULL COMMENT '经度',
	   `uid` varchar(64) DEFAULT NULL,
	`creater` varchar(64) NOT NULL COMMENT '创建人',
  `createTime` varchar(128) NOT NULL COMMENT '创建时间',
  `mender` varchar(64) DEFAULT NULL COMMENT '修改者',
  `modifyTime` varchar(128) DEFAULT NULL COMMENT '修改时间',*/
	private String fid;
	private String fName;
	private String fType;
	private String fForm;
	private String fOrigin;
	private String fGrowthHabit;
	private double latitude;
	private double longitude;
	private String creater;
	private String createTime;
	private String mender;
	private String modifyTime;
	private String uid;
	
	//附加属性
	private List<ForestPic> forestPicList;
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfType() {
		return fType;
	}
	public void setfType(String fType) {
		this.fType = fType;
	}
	public String getfForm() {
		return fForm;
	}
	public void setfForm(String fForm) {
		this.fForm = fForm;
	}
	public String getfOrigin() {
		return fOrigin;
	}
	public void setfOrigin(String fOrigin) {
		this.fOrigin = fOrigin;
	}
	public String getfGrowthHabit() {
		return fGrowthHabit;
	}
	public void setfGrowthHabit(String fGrowthHabit) {
		this.fGrowthHabit = fGrowthHabit;
	}
	
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getMender() {
		return mender;
	}
	public void setMender(String mender) {
		this.mender = mender;
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public List<ForestPic> getForestPicList() {
		return forestPicList;
	}
	public void setForestPicList(List<ForestPic> forestPicList) {
		this.forestPicList = forestPicList;
	}
	
	
	
	
}

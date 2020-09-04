package top.ss.forest.service;

import java.util.List;

import top.ss.forest.pojo.ForestInfo;
import top.ss.forest.pojo.ForestPic;
import top.ss.forest.pojo.Page;
import top.ss.forest.pojo.QueryVo;

public interface ForestService {

	/**
	 * 保存资源信息
	 * @param forestInfo
	 * @return
	 */
	public String saveForestInfo(ForestInfo forestInfo);
	
	/**
	 * 根据资源id查询资源信息
	 * @param fid
	 * @return
	 */
	public ForestInfo queryForestInfoById(String fid);
	
	/**
	 * 根据用户id查询资源信息
	 * @param uid
	 * @return
	 */
	public List<ForestInfo> queryForestInfoByUid(String uid);
	
	/**
	 * 查询所有资源信息
	 * @return
	 */
	public Page<ForestInfo>  queryForestInfoByQueryVo(QueryVo vo);
	
	/**
	 * 编辑资源信息
	 * @param forestInfo
	 * @return
	 */
	public String editForestInfo(ForestInfo forestInfo);
	
	/**
	 * 地图信息加载
	 * @return
	 */
	public List<ForestInfo> queryMapInfo();

	/**
	 * 保存资源图片
	 * @param forestPic
	 */
	public void saveForestPic(ForestPic forestPic);

	
}

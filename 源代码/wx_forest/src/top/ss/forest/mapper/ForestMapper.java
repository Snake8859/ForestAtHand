package top.ss.forest.mapper;

import java.util.List;

import org.springframework.stereotype.Controller;

import top.ss.forest.pojo.ForestInfo;
import top.ss.forest.pojo.ForestPic;
import top.ss.forest.pojo.QueryVo;
/**
 * 资源Mapper
 * @author Snake
 *
 */
@Controller
public interface ForestMapper {

	/**
	 * 根据资源id查询资源
	 * @param fid
	 * @return
	 */
	public ForestInfo findForestInfoByFid(String fid);
	
	
	/**
	 * 根据用户id查询资源
	 * @param uid
	 * @return
	 */
	public List<ForestInfo> queryForestInfoByUid(String uid);
	
	
	/**
	 * 查询所有资源信息
	 * @return
	 */
	public List<ForestInfo> queryForestInfoByQueryVo(QueryVo vo);
	
	/**
	 * 保存资源信息
	 * @param forestInfo
	 * @return
	 */
	public void saveForestInfo(ForestInfo forestInfo);
	
	/**
	 * 更新资源信息
	 * @param forestInfo
	 */
	public void updateForestInfo(ForestInfo forestInfo);
	

	/**
	 * 保存资源图片
	 * @param forestPic
	 */
	public void saveForestPic(ForestPic forestPic);

	/**
	 * 根据QueryVo查询资源统计数
	 * @param vo
	 * @return
	 */
	public int countForestInfo();

	/**
	 * 地图信息加载
	 * @return
	 */
	public List<ForestInfo> queryMapInfo();

	
	
}

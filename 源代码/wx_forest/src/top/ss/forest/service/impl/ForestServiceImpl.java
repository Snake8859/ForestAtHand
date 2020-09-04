package top.ss.forest.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.ss.common.utils.DateUtil;
import top.ss.forest.mapper.ForestMapper;
import top.ss.forest.pojo.ForestInfo;
import top.ss.forest.pojo.ForestPic;
import top.ss.forest.pojo.Page;
import top.ss.forest.pojo.QueryVo;
import top.ss.forest.service.ForestService;
/**
 * 资源service
 * @author Snake
 *
 */
@Service
public class ForestServiceImpl implements ForestService {

	
	@Autowired
	private ForestMapper forestMapper;
	
	public String saveForestInfo(ForestInfo forestInfo) {
		//返回uuid主键
		forestMapper.saveForestInfo(forestInfo);
		String fid = forestInfo.getFid();
		return fid;
	}

	public ForestInfo queryForestInfoById(String fid) {
		ForestInfo forestInfo = forestMapper.findForestInfoByFid(fid);
		if(forestInfo!=null){
			return forestInfo;
		}
		return null;
	}
	

	public List<ForestInfo> queryForestInfoByUid(String uid) {
		List<ForestInfo> forestInfoList = forestMapper.queryForestInfoByUid(uid);
		if(forestInfoList!=null){
			return forestInfoList;
		}
		return null;
	}


	public void saveForestPic(ForestPic forestPic) {
		forestMapper.saveForestPic(forestPic);
	}
	

	public Page<ForestInfo> queryForestInfoByQueryVo(QueryVo vo) {
		//设置查询条件,从哪一条数据开始查
		vo.setStart((vo.getPage() - 1) * vo.getSize());
		Page<ForestInfo> forestPage = new Page<ForestInfo>();
		//设置page的当前页
		forestPage.setPage(vo.getPage());
		//设置page的每页个数
		forestPage.setSize(vo.getSize());
		//设置page的总条数
		int total = forestMapper.countForestInfo();
		forestPage.setTotal(total);
		//查询资源信息
		List<ForestInfo> forestList = forestMapper.queryForestInfoByQueryVo(vo);
		forestPage.setRows(forestList);
		return forestPage;
	}

	public String editForestInfo(ForestInfo forestInfo) {
		String message = "";
		//修改时间
		forestInfo.setModifyTime(DateUtil.getTime());
		try {
			forestMapper.updateForestInfo(forestInfo);
			message = "success";
		} catch (Exception e) {
			message = "fail";
		}
		return message;
	}

	public List<ForestInfo> queryMapInfo() {
		List<ForestInfo> forestInfo = forestMapper.queryMapInfo();
		if(forestInfo!=null){
			return forestInfo;
		}
		return null;
	}


	

}

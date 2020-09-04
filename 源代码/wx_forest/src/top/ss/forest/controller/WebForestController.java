package top.ss.forest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import top.ss.forest.pojo.ForestInfo;
import top.ss.forest.pojo.Page;
import top.ss.forest.pojo.QueryVo;
import top.ss.forest.service.ForestService;

/**
 * 资源Controller  web端
 * @author Snake
 *
 */
@Controller
@RequestMapping(value={"forest"})
public class WebForestController {

	//注入service
	@Autowired
	private ForestService forestService;
	
	
	/**
	 * 进入登录界面
	 * @return
	 */
	@RequestMapping(value={"login"})
	public String enterIndex(){
		return "login";
	}
	
	/**
	 * 进入管理页面
	 * @return
	 */
	@RequestMapping(value={"forestIndex"})
	public String enterForestIndex(QueryVo vo,Model model){
		//初始化列表数据
		Page<ForestInfo> page = forestService.queryForestInfoByQueryVo(vo);
		model.addAttribute("page", page);
		return "forest";
	}
	
	
	/**
	 * 资源信息查询
	 * @param fid
	 * @return
	 */
	@RequestMapping(value={"queryForestInformation"})
	public @ResponseBody
	ForestInfo queryForestInfo(@RequestBody Map<String, Object> dataMap){
		String id = (String) dataMap.get("id");
		ForestInfo forestIndo = forestService.queryForestInfoById(id);
		return forestIndo;
	}
	
	/**
	 * 资源信息编辑
	 * @param forestInfo
	 * @return
	 */
	@RequestMapping(value={"editForestInfo"})
	public @ResponseBody 
	String editForestInfo(ForestInfo forestInfo){
		String message = forestService.editForestInfo(forestInfo);
		return message;
	}
	
	
	/**
	 * 测试进入地图页
	 * @return
	 */
	@RequestMapping(value={"mapIndex"})
	public String enterMapIndex(){
		return "map";
	}
	
	/**
	 * 地图信息加载
	 * @return
	 */
	@RequestMapping(value={"queryMapInfo"})
	public @ResponseBody
	List<ForestInfo> queryMapInfo(){
		List<ForestInfo> forestInfoList = forestService.queryMapInfo();
		return forestInfoList;
	}
}

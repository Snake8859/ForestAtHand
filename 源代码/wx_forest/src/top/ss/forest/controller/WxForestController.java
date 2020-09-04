package top.ss.forest.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import top.ss.forest.pojo.ForestInfo;
import top.ss.forest.pojo.ForestPic;
import top.ss.forest.service.ForestService;

/**
 * 资源Controller  微信端
 * @author Snake
 *
 */
@Controller
@RequestMapping(value={"wx"})
public class WxForestController {

	//注入service
	@Autowired
	private ForestService forestService;
	
	/**
	 * 资源基本信息提交
	 * @param forestInfo
	 * @return
	 */
	@RequestMapping(value={"getForestInformation"})
	public @ResponseBody
	String getForestInfo(@RequestBody ForestInfo forestInfo){
		String fid = "";
		if(forestInfo!=null){
			fid = forestService.saveForestInfo(forestInfo);
		}
		return fid;
	}
	
	/**
	 * 图片提交
	 * @param multipartFile
	 * @return
	 */
	@RequestMapping(value={"getForestPic"})
	public @ResponseBody
	String getForestPic(HttpServletRequest request, HttpServletResponse response){
		String fid = request.getParameter("fid");
		//图片上传
		MultipartHttpServletRequest req =(MultipartHttpServletRequest)request;
        MultipartFile multipartFile =  req.getFile("picFile");
        
        //获得原始图片名称
        String originalFilename = multipartFile.getOriginalFilename();
        //获得后缀名
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        //uuid生成图片新的名称
        String picName = UUID.randomUUID().toString().replace("-","")+suffix;
        
        //林业资源图片
        ForestPic forestPic = new ForestPic();
        forestPic.setPictureName(picName);
        forestPic.setFid_pic(fid);
      
        //保存路径 windows
        //String realPath = "E:/WeChat笔记/手边林业+林业信息资源管理平台/images";
        //保存路径 liunx
        String realPath = "/usr/local/uploadForestPic";
        try {
			multipartFile.transferTo(new File(realPath,picName));
			forestService.saveForestPic(forestPic);
			return "success";
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return "fail";
		} catch (IOException e) {
			e.printStackTrace();
			return "fail";
		}
		
	}
	
	/**
	 * 资源信息查询
	 * @param fid
	 * @return
	 */
	@RequestMapping(value={"queryForestInformation"})
	public @ResponseBody
	List<ForestInfo> queryForestInfo(@RequestBody  Map<String, Object> datas){
		//查询林业资源
		String uid = (String) datas.get("uid");
		List<ForestInfo> forestInfoList = forestService.queryForestInfoByUid(uid);
		return forestInfoList;
	}
	
}

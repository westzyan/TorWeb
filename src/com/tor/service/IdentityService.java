package com.tor.service;

import java.util.List;

import com.tor.model.*;
import com.tor.utils.Identification;

public class IdentityService {
	
	private String filePath;
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public IdentityService() {
		
	}
	public IdentityService(String filePath) {
		this.filePath = filePath;
	}
	
	public List<Traffic> getList(String file){
		return new Identification().getLastTrafficList(file);
	}
	
	
	/**
	 * 分页查询  
	 * @param pageSize  每页显示多少记录
	 * @param currentPage 当前页
	 * @return 封装了分页信息的bean
	 */
	public PageBean queryForPage(int pageSize, int page,List<Traffic> trafficList) {
		System.out.println(trafficList == null);
		int allRow = trafficList.size();  //总记录数
		int totalPage = PageBean.countTatalPage(pageSize, allRow); //总页数
		final int offset = PageBean.countOffset(pageSize, page); //当前页开始记录
		final int length = pageSize; // 每页记录数
		final int currentPage = PageBean.countCurrentPage(page); // 当前页
		List<Traffic> list = null;
		if(offset<trafficList.size() && offset+length <= trafficList.size()) {
			 list = trafficList.subList(offset, offset+length);
		}else if(offset<trafficList.size() && offset+length >= trafficList.size()) {
			 list = trafficList.subList(offset, trafficList.size());
		}else {
			list = null;
		}
		
		
		
//		List list = itemDao.queryForPage(hql, offset, length); //
		//把分页信息保存到Bean当中
		PageBean pageBean  = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
	
	
	
	
}

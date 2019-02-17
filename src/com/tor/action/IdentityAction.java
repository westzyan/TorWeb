package com.tor.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.tor.model.PageBean;
import com.tor.model.Traffic;
import com.tor.service.IdentityService;

public class IdentityAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String filePath;
	private IdentityService identityService = new IdentityService(filePath);;
	private PageBean pageBean;
	private int page = 1;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	List<Traffic> list;

	@SuppressWarnings("unchecked")
	public String getTrafficPage() {

		HttpSession session = ServletActionContext.getRequest().getSession(true);
		list = (List<Traffic>) session.getAttribute("list");
		String file = (String) session.getAttribute("filePath");
		System.out.println("filepath        " + filePath);
		System.out.println("file        " + file);
		// System.out.println("list==null? " + list == null);
		// System.out.println("list==null? " + (list.size()>0));
		// if(list == null && filePath.equalsIgnoreCase("")) {
		// return "error";
		// }
		if (file == null) {
			list = identityService.getList(filePath);
			session.setAttribute("list", list);
			session.setAttribute("filePath", filePath);
		} else if (filePath != null && !filePath.equals(file)) {
			System.out.println(filePath.equals(file));
			// session.removeAttribute("list");
			list = identityService.getList(filePath);
			session.setAttribute("list", list);
			session.setAttribute("filePath", filePath);
		} else if (filePath == file) {
			session.setAttribute("list", list);
			System.out.println("hahahahhahahahahahaha");
		}
		// if(filePath.equalsIgnoreCase(file)&& list!=null && list.size()>0) {
		// System.out.println("翻页中");
		//
		// }else {
		// System.out.println("判断的是个屁啊");
		// }

		this.pageBean = identityService.queryForPage(20, page, list);
		ServletActionContext.getRequest().setAttribute("pageBean", this.pageBean);
		return "success";
	}

}

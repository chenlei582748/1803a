package com.bw.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.bean.Category;
import com.bw.bean.Goods;
import com.bw.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class GoodsController {

	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("findAll")
	public String findAll(Model model,
			@RequestParam(defaultValue="1")Integer pageNum,
			String gname,String startTime,String endTime,Integer cid){
		PageHelper.startPage(pageNum,3);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("gname", gname);
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("cid", cid);
		
		List<Goods> list = goodsService.queryGoodsAll(map);
		PageInfo<Goods> page = new PageInfo<Goods>(list);
		model.addAttribute("page",page);
		model.addAttribute("map",map);
		
		return "index";
	}
	
	@RequestMapping("queryCategory")
	@ResponseBody
	public List<Category> queryCategory(){
		List<Category> list = goodsService.queryCategory();
		return list;
	}
	
	@RequestMapping("addGoods")
	@ResponseBody
	public boolean addGoods(Goods goods){
		try {
			goodsService.addGoods(goods);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@RequestMapping("updateGoods")
	@ResponseBody
	public boolean updateGoods(Goods goods){
		try {
			goodsService.updateGoods(goods);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(Integer gid,Model model){
		Goods goods = goodsService.queryGoodsById(gid);
		model.addAttribute("goods", goods);
		return "update";
	}
}

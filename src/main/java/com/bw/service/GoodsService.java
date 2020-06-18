package com.bw.service;

import java.util.List;
import java.util.Map;

import com.bw.bean.Category;
import com.bw.bean.Goods;

public interface GoodsService {

	public List<Goods> queryGoodsAll(Map<String, Object> map);
	
	public List<Category> queryCategory();
	
	public void addGoods(Goods goods);
	
	public Goods queryGoodsById(Integer id);
	
	public void updateGoods(Goods goods);
}

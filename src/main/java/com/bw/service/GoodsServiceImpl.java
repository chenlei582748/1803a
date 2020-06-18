package com.bw.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bw.bean.Category;
import com.bw.bean.Goods;
import com.bw.mapper.GoodsMapper;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Resource
	private GoodsMapper goodsMapper;
	
	@Override
	public List<Goods> queryGoodsAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsMapper.queryGoodsAll(map);
	}

	@Override
	public List<Category> queryCategory() {
		// TODO Auto-generated method stub
		return goodsMapper.queryCategory();
	}

	@Override
	public void addGoods(Goods goods) {
		// TODO Auto-generated method stub
		goodsMapper.addGoods(goods);
	}

	@Override
	public Goods queryGoodsById(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.queryGoodsById(id);
	}

	@Override
	public void updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		goodsMapper.updateGoods(goods);
	}

}

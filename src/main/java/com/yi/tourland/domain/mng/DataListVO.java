package com.yi.tourland.domain.mng;

import java.util.List;

public class DataListVO {
	List<AirplaneVO> list;	

	public List<AirplaneVO> getList() {
		return list;
	}

	public void setList(List<AirplaneVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "TestVO [list=" + list + "]";
	}
}

package dtu.captone.alumni.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.model.CanvasjsChartData;

@Service
public class CanvasjsChartServiceImpl implements ChartService{
	
	@Autowired
	private CanvasjsChartData canvasjsChartDao;

	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		// TODO Auto-generated method stub
		return canvasjsChartDao.getCanvasjsDataList();
	}

	@Override
	public List<List<Map<Object, Object>>> getCanvasjsDataListCircleMajor() {
		return canvasjsChartDao.getCanvasjsDataListCircleMajor();
	}

}

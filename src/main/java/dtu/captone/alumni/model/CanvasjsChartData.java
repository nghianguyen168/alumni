package dtu.captone.alumni.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.service.JobService;
 
@Repository
public class CanvasjsChartData {
 
	
	

	@Autowired
	private JobService jobService;
	
 
	public  List<List<Map<Object, Object>>> getCanvasjsDataList() {
		 Map<Object,Object> map = null;
		 List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
		 List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
		map = new HashMap<Object,Object>(); map.put("x", 1483209000000L); map.put("y", jobService.getListByMonth(1).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1485887400000L); map.put("y", jobService.getListByMonth(2).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1488306600000L); map.put("y", jobService.getListByMonth(3).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1490985000000L); map.put("y", jobService.getListByMonth(4).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1493577000000L); map.put("y", jobService.getListByMonth(5).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1496255400000L); map.put("y", jobService.getListByMonth(6).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1498847400000L); map.put("y", jobService.getListByMonth(7).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1501525800000L); map.put("y", jobService.getListByMonth(8).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1504204200000L); map.put("y", jobService.getListByMonth(9).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1506796200000L); map.put("y", jobService.getListByMonth(10).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1509474600000L); map.put("y", jobService.getListByMonth(11).size());dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 1512066600000L); map.put("y", jobService.getListByMonth(12).size());dataPoints1.add(map);
		list.add(dataPoints1);
		return list;
	}
}                        
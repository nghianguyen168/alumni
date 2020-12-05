package dtu.captone.alumni.service;

import java.util.List;
import java.util.Map;

public interface ChartService {
	List<List<Map<Object, Object>>> getCanvasjsChartData();

	List<List<Map<Object,Object>>> getCanvasjsDataListCircleMajor();
}

package dtu.captone.alumni.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dtu.captone.alumni.service.ChartService;
import dtu.captone.alumni.service.JobService;

@Controller
@RequestMapping("/chart")
public class ChartController {


	@Autowired
	private ChartService canvasjsChartService;
	
	@Autowired
	private JobService jobService;
 
	@RequestMapping(method = RequestMethod.GET)
	public String springMVC(ModelMap modelMap) {
		
		List<List<Map<Object, Object>>> canvasjsDataList = canvasjsChartService.getCanvasjsChartData();
		modelMap.addAttribute("dataPointsList", canvasjsDataList);
		return "chart.index";
	}
}

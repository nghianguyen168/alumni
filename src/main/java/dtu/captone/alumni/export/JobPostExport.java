package dtu.captone.alumni.export;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import dtu.captone.alumni.domain.JobApply;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import dtu.captone.alumni.domain.Job;

public class JobPostExport {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private XSSFSheet sheet2;
	private List<Job> jobListPost;
	private List<JobApply> applyList;
	
	 public JobPostExport(List<Job> jobListPost,List<JobApply> applyList) {
	        this.jobListPost = jobListPost;
	        this.applyList = applyList;
	        workbook = new XSSFWorkbook();
	    }
	 
	 private void writeHeaderLine() {
		 sheet = workbook.createSheet("Danh sách tuyển dụng");
	        Row row = sheet.createRow(0);
	         
	        CellStyle style = workbook.createCellStyle();
	        XSSFFont font = workbook.createFont();
	        font.setBold(true);
	        font.setFontHeight(16);
	        style.setFont(font);
	         
	        createCell(row, 0, "Mã", style);      
	        createCell(row, 1, "Tên công ty", style);       
	        createCell(row, 2, "Hạn tuyển dụng", style);
	        createCell(row, 3, "Ngày đăng", style);    
	        createCell(row, 4, "Địa chỉ", style);
	        createCell(row, 5, "Vị trí", style);
	        createCell(row, 6, "Mức lương", style);
	        createCell(row, 7, "Chuyên ngành", style);
	        createCell(row, 8, "Người đăng", style);

		 sheet2 = workbook.createSheet("Danh sách ứng tuyển");
		 Row row1 = sheet2.createRow(0);

		 CellStyle style1 = workbook.createCellStyle();
		 XSSFFont font1 = workbook.createFont();
		 font.setBold(true);
		 font.setFontHeight(16);
		 style.setFont(font);

		 createCell(row1, 0, "ID", style);
		 createCell(row1, 1, "Tên công việc", style);
		 createCell(row1, 2, "Công ty", style);
		 /*createCell(row1, 3, "Người đăng bài", style);*/
		 createCell(row1, 3, "CV", style);
		 createCell(row1, 4, "Người nộp đơn", style);



	 }
	 
	 private void createCell(Row row, int columnCount, Object value, CellStyle style) {
	        sheet.autoSizeColumn(columnCount);
	        Cell cell = row.createCell(columnCount);
	        if (value instanceof Integer) {
	            cell.setCellValue((Integer) value);
	        } else if (value instanceof Boolean) {
	            cell.setCellValue((Boolean) value);
	        }else {
	            cell.setCellValue((String) value);
	        }
	        cell.setCellStyle(style);
	    }
	 private void writeDataLines() {
	        int rowCount = 1;
	 
	        CellStyle style = workbook.createCellStyle();
	        XSSFFont font = workbook.createFont();
	        font.setFontHeight(14);
	        style.setFont(font);
	                 
	        for (Job job : jobListPost) {
	            Row row = sheet.createRow(rowCount++);
	            int columnCount = 0;
	             
	            createCell(row, columnCount++, job.getId(), style);
	            createCell(row, columnCount++, job.getCompanyName(), style);
	            createCell(row, columnCount++, String.valueOf(job.getDeadlineApply()), style);
	            createCell(row, columnCount++, String.valueOf(job.getPostedOn()), style);
	            createCell(row, columnCount++, job.getLocation(), style);
	            createCell(row, columnCount++, job.getPosition(), style);
	            createCell(row, columnCount++, job.getSalary(), style);
	            createCell(row, columnCount++, job.getMajor().getMajorName(), style);
	             
	        }
			 int rowCount1 = 1;
	        for(JobApply jobApply:applyList){
				Row row1 = sheet2.createRow(rowCount1++);
				int columnCount1 = 0;
				createCell(row1,columnCount1++,jobApply.getId(),style);
				createCell(row1,columnCount1++,jobApply.getJob().getPosition(),style);
				createCell(row1,columnCount1++,jobApply.getJob().getCompanyName(),style);
				/*createCell(row1,columnCount1++,"hihi",style);*/
				createCell(row1,columnCount1++,jobApply.getCv(),style);
				createCell(row1,columnCount1++,jobApply.getMember().getFirstName()+" "+jobApply.getMember().getLastName(),style);
			}
	    }
	 
	  public void export(HttpServletResponse response) throws IOException {
	        writeHeaderLine();
	        writeDataLines();
	         
	        ServletOutputStream outputStream = response.getOutputStream();
	        workbook.write(outputStream);
	        workbook.close();
	         
	        outputStream.close();
	         
	    }
}

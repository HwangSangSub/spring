package com.brighten.idi.excel.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brighten.idi.excel.dto.ExcelDto;
import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.order.service.OrderService;
import com.brighten.idi.util.BriException;
import com.brighten.idi.util.BriPage;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2(topic = "brighten")
//@RestController
@Controller
@RequiredArgsConstructor
public class ExcelController {

	private final OrderService orderService;
	
	@ResponseBody
	@PostMapping(value="/api/v1/mngr/delivery/excel" , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public void deleveryExcel(ExcelDto excelDto) throws Exception{
		excelDto.getExcelFile();
		String originFileName=excelDto.getExcelFile().getOriginalFilename();
		if(!originFileName.contains("xls") && !originFileName.contains("xlsx")) 
			throw new BriException(HttpStatus.BAD_REQUEST,"엑셀파일의 형식이 아닙니다.");

		Workbook workbook;
		try {
			workbook = WorkbookFactory.create(excelDto.getExcelFile().getInputStream());
			Sheet sheet = workbook.getSheetAt(0);
			
			for(Row row :sheet) {
				
				for(Cell cell : row) {
					System.err.println(cell);
				}
				
			}
			
		} catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
	@GetMapping(value="/api/v1/mngr/delivery/excel"  )
	public String deliveryList(OrderDto orderDto  , HttpServletResponse response , Model model) throws Exception{
		System.err.println("sdjkdjkdkdkk");
		BriPage<OrderDto> page=orderService.orderList(orderDto);
		System.err.println(page);
		System.err.println("11111111111111111111111");
		model.addAttribute("list", page);
//		if(orderDto.getFlag().equals("Y"))
//		else if(orderDto.getFlag().equals("N"))
			
		return "excelView";
	}
	
	
} 
   
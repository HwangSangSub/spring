package com.brighten.idi.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.brighten.idi.order.dto.OrderDto;
import com.brighten.idi.util.BriPage;

@Component(value = "excelView")
public class ExcelView extends AbstractXlsView{

	@Override
	@Transactional
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		model.get("excel");
		List<OrderDto> list=((BriPage<OrderDto>)model.get("list") ).getContent();
		System.err.println(list);
		String excelName = "송장출력";
		String encodedName = new String(excelName.getBytes("UTF-8"), "ISO-8859-1");
		System.err.println("=====송장출력=====");
        // response 설정을 통해 파일 다운로드를 처리합니다.
        response.setHeader("Content-Disposition", "attachment; filename=\""+encodedName+".xlsx\"");

        // Excel 시트 생성 
        Sheet sheet = workbook.createSheet("Example Sheet");

        // 헤더 행 생성
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("수취인명");
        header.createCell(1).setCellValue("수취인 우편번호"); 
        header.createCell(2).setCellValue("수취인 주소");
        header.createCell(3).setCellValue("수취인 이동통신");
        header.createCell(4).setCellValue("상품명");
        header.createCell(5).setCellValue("배송메세지");
        header.createCell(6).setCellValue("주문번호");
        int i=1;
        for(OrderDto dto :  list ) {
        	
        	Row dataRow = sheet.createRow(i);
        	dataRow.createCell(0).setCellValue(dto.getReceiverName());
        	dataRow.createCell(1).setCellValue(dto.getZipcode());
        	dataRow.createCell(2).setCellValue(dto.getAddress()+dto.getSubAddress());
        	dataRow.createCell(3).setCellValue(dto.getReceiverMobile());
        	dataRow.createCell(4).setCellValue(dto.getOrderItemList().get(0).getGoodsName()+ (dto.getOrderItemList().size()==1 ?"" : " 외 " + (dto.getOrderItemList().size()-1) + "건" ) );
        	dataRow.createCell(5).setCellValue(dto.getMemo());
        	dataRow.createCell(6).setCellValue(dto.getOrderNo().toString());
        	i++;
        }

        // 자동으로 열 너비를 조정
        for (int j = 0; j < 3; j++) {
            sheet.autoSizeColumn(j);
        }
		

	}

}

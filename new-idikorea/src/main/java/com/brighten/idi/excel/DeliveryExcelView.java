package com.brighten.idi.excel;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.brighten.idi.member.dto.MemberDto;

@Component(value = "DeliveryExcelView")
public class DeliveryExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		model.get("excel");
		System.err.println( ((MemberDto)model.get("memberDto")).getSearchValue());
		String excelName = "송장출력";
		String encodedName = new String(excelName.getBytes("UTF-8"), "ISO-8859-1");
        // response 설정을 통해 파일 다운로드를 처리합니다.
        response.setHeader("Content-Disposition", "attachment; filename=\""+encodedName+".xlsx\"");

        // Excel 시트 생성
        Sheet sheet = workbook.createSheet("Example Sheet");

        // 헤더 행 생성
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("ID");
        header.createCell(1).setCellValue("Name");
        header.createCell(2).setCellValue("Email");

        // 데이터 행 생성 (실제 애플리케이션에서는 모델로부터 데이터를 가져옵니다.)
        Row dataRow = sheet.createRow(1);
        dataRow.createCell(0).setCellValue(1);
        dataRow.createCell(1).setCellValue("John Doe");
        dataRow.createCell(2).setCellValue("johndoe@example.com");

        // 자동으로 열 너비를 조정
        for (int i = 0; i < 3; i++) {
            sheet.autoSizeColumn(i);
        }
		

	}

}

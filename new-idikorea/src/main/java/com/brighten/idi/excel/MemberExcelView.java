package com.brighten.idi.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.brighten.idi.member.dto.MemberDto;
import com.brighten.idi.member.mapper.MemberMapper;

@Component(value = "memberExcelView")
public class MemberExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		model.get("excel");
		MemberMapper memberMapper = (MemberMapper) model.get("memberMapper");
		String excelName = "회원목록";
		MemberDto memberDto = (MemberDto)model.get("memberDto");
		memberDto.setItemSize(100000000);
		memberDto.setPageNum(1);
		List<MemberDto> list = memberMapper.memberList(memberDto);
		
		System.err.println(list);
		String encodedName = new String(excelName.getBytes("UTF-8"), "ISO-8859-1");
        // response 설정을 통해 파일 다운로드를 처리합니다.
        response.setHeader("Content-Disposition", "attachment; filename=\""+encodedName+".xlsx\"");

        // Excel 시트 생성
        Sheet sheet = workbook.createSheet("Example Sheet");

        // 헤더 행 생성
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("아이디");
        header.createCell(1).setCellValue("회원명");
        header.createCell(2).setCellValue("세례명");
        header.createCell(3).setCellValue("생년월일");
        header.createCell(4).setCellValue("성별");
        header.createCell(5).setCellValue("그룹");
        header.createCell(6).setCellValue("휴대폰번호");
        header.createCell(7).setCellValue("전화번호");
        header.createCell(8).setCellValue("우편번호");
        header.createCell(9).setCellValue("주소");
        header.createCell(10).setCellValue("도로명주소");
        header.createCell(11).setCellValue("상세주소");
        int j =1;
        for(MemberDto dto : list) {
        	Row dataRow = sheet.createRow(j);
        	dataRow.createCell(0).setCellValue(dto.getMemberId());
        	dataRow.createCell(1).setCellValue(dto.getMemberName());
        	dataRow.createCell(2).setCellValue(dto.getChristianName());
        	dataRow.createCell(3).setCellValue(dto.getBirthYear()+"-"+dto.getBirth());
        	dataRow.createCell(4).setCellValue(dto.getGender().toString());
        	dataRow.createCell(5).setCellValue(dto.getGroupName());
        	dataRow.createCell(6).setCellValue(dto.getMobile());
        	dataRow.createCell(7).setCellValue(dto.getPhone());
        	dataRow.createCell(8).setCellValue(dto.getZipcode());
        	dataRow.createCell(9).setCellValue(dto.getAddress());
        	dataRow.createCell(10).setCellValue(dto.getRoadAddress());
        	dataRow.createCell(11).setCellValue(dto.getSubAddress());
        	j++;
        }

        // 자동으로 열 너비를 조정
        for (int i = 0; i < 3; i++) {
            sheet.autoSizeColumn(i);
        }
		

	}

}

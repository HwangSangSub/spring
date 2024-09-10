package com.brighten.idi.util;

import java.util.List;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Schema(description = "페이지 응답")
@Data
public class BriPage<T> {
    
	@Schema(description = "컨텐츠 리스트")      
	List<T> content;   
 
	@Schema(description = "총 컨텐츠 개수")  
	long totalCount;  

	@Schema(description = "읽어온 컨텐츠 크기")  
	int itemSize;

	@Schema(description = "페이지 번호")  
	int pageNum; 

	@Schema(description = "페이지 크기")
	int pageSize;

	public BriPage(List<T> content, BriPagingDto pagingDto, long totalCount) {
		this.content = content;
		this.itemSize = pagingDto.getItemSize();
		this.pageSize = pagingDto.getPageSize();
		this.pageNum = pagingDto.getPageNum();
		this.totalCount = totalCount;
	}

	@Schema(description = "총 페이지 수")
	public long getTotalPage() {
		return (totalCount-1) / itemSize + 1;
	}

	@Schema(description = "하단 시작 페이지")
	public int getStartPage() {
		return ((pageNum - 1) / pageSize) * pageSize + 1;
	}

	@Schema(description = "하단 마지막 페이지")
	public long getEndPage() {
		long totalPage = getTotalPage();
		long endPage = getStartPage() + pageSize - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		return endPage;
	}
}

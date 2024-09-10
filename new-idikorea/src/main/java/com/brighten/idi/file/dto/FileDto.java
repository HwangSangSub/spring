package com.brighten.idi.file.dto;

import java.time.LocalDateTime;

import com.brighten.idi.enumerate.YesNo;
import com.google.api.client.util.Value;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor 
public class FileDto {

	@Value("${auth.file-server-url}")
	private String fileServerUrl;
	
	@Schema(description =  "파일 번호")
	Long id;

	@Schema(description =  "컨텐츠 유형(이미지, 실행파일..)")
	String contentType;

	@Schema(description =  "사용 여부" , hidden=true)
	YesNo enabled; 

	@Schema(description =  "파일 이름")
	String name;
	
	@Schema(description =  "원본 파일 이름")
	String originName;

	@Schema(description =  "파일 확장자")
	String extention;
	
	@Schema(description =  "파일 디렉토리 경로")
	String dir;

	@Schema(description =  "파일 크기" , hidden=true)
	Long size;
	
	@Schema(description =  "파일 그룹 id" , hidden=true)
	Long fileGroupId;

	@Schema(description =  "파일 경로" , hidden=true)
	String path;

	@Schema(description =  "정렬 순서")
	int sort;

	@Schema(description =  "생성시간" , hidden=true)
	LocalDateTime createTime;

	@Schema(description =  "수정시간" , hidden=true)
	LocalDateTime updateTime;
	

//	public FileEntity toEntity() {
//		return FileEntity.builder()
//				.id(id)
//				.contentType(contentType)
//				.enabled(enabled)
//				.name(name)
//				.extention(extention)
//				.size(size)
//				.sort(sort)
//				.createTime(createTime)
//				.updateTime(updateTime)
//				.build();
//	}
}

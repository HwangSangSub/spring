package com.brighten.idi.file.dto;

import java.time.LocalDateTime;
import java.util.List;

import com.brighten.idi.enumerate.YesNo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileGroupDto {

	long id;

	YesNo enabled;

	LocalDateTime createTime;

    List<FileDto> fileList;

}

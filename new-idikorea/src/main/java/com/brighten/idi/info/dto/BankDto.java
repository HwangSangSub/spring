package com.brighten.idi.info.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.brighten.idi.brand.dto.BrandDto;
import com.brighten.idi.goods.option.GoodsOptionDto;
import com.brighten.idi.order.item.dto.OrderItemDto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class BankDto {
	
	@Schema(description = "순번")
	Integer bankNo;  
	
	@Schema(description = "은행명")
	String bank;  
	
	@Schema(description = "계좌번호")
	String account;  
	
	@Schema(description = "계좌주")
	String name;  
	
}

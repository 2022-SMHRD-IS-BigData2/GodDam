package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data@AllArgsConstructor
public class DayDetailDTO {
	
	private int dinfo_seq;
	private int dam_num;
	private String d_date;
	private double d_level;
	private double d_vow;
	private double d_vow_rate;
	private double d_inflow;
	private double d_ttl_outflow;

}

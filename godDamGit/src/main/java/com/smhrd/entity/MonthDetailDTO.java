package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data@AllArgsConstructor
public class MonthDetailDTO {
	
	private int minfo_seq;
	private int dam_num;
	private String m_date;
	private double m_level;
	private double m_vow;
	private double m_vow_rate;
	private double m_inflow;
	private double m_ttl_outflow;
	private String dam_name;
	private String startDate;
	private String endDate; //1223(18~20) 우종빈, 기간 선택용 field 선언


}

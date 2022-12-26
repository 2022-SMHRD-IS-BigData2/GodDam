package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data@AllArgsConstructor
public class DamDTO {
	private int dam_seq;
	private String dam_name;
	private String dam_loc;
	private String admin_id;
	private String dam_namekor;

}

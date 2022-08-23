package com.ispan.springboot.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DateDto {
	@JsonProperty("dateStar")
	private String dateStar;

	@JsonProperty("dateEnd")
	private String dateEnd;

//============================================================================================================

	public DateDto(String dateStar, String dateEnd) {
		super();
		this.dateStar = dateStar;
		this.dateEnd = dateEnd;
	}

	public DateDto() {
		super();
	}

//============================================================================================================

	public String getDateStar() {
		return dateStar;
	}

	public void setDateStar(String dateStar) {
		this.dateStar = dateStar;
	}

	public String getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}

}

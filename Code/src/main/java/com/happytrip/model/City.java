package com.happytrip.model;

import java.io.Serializable;

/**
 * The persistent class for the cities database table.
 * 
 */
public class City implements Serializable {
	private static final long serialVersionUID = 1L;

	private long cityId;

	private String cityName;

	// bi-directional many-to-one association to State
	private State state;

	public City() {
	}

	public City(long int1) {
		cityId = int1;
	}

	public City(String string) {
		this.cityName = string;
	}

	public long getCityId() {
		return this.cityId;
	}

	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public State getState() {
		return this.state;
	}

	public void setState(State state) {
		this.state = state;
	}

	/* code modified for Collections-bug14-1
	 */
	//modified code starts here for Collections-bug14-1
	
	public boolean equals(Object obj) {
		City city=(City)obj;
		if(getCityName().equalsIgnoreCase(city.getCityName())){
			return true;
		}
		return false;
	}
	
	@Override
	public int hashCode() {
	
		return getCityName().toUpperCase().hashCode();
	}
	//modified code ends here for Collections-bug14-1
}
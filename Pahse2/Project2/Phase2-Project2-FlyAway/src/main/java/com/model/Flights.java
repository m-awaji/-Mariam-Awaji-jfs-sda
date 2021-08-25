package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "flights")
@Entity
public class Flights {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Flight_ID")
	private int flightId;
	
	@Column(name = "Airline")
	private String airline;
	
	@Column(name = "Flight_Date")
	private String flightDate;
	
	@Column(name = "Flight_Source")
	private String flightSource;
	
	@Column(name = "Flight_Destination")
	private String flightDestination;
	
	@Column(name = "Flight_Price")
	private long flightPrice;

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getFlightDate() {
		return flightDate;
	}

	public void setFlightDate(String flightDate) {
		this.flightDate = flightDate;
	}

	public String getFlightSource() {
		return flightSource;
	}

	public void setFlightSource(String flightSource) {
		this.flightSource = flightSource;
	}

	public String getFlightDestination() {
		return flightDestination;
	}

	public void setFlightDestination(String flightDestination) {
		this.flightDestination = flightDestination;
	}

	public long getFlightPrice() {
		return flightPrice;
	}

	public void setFlightPrice(long flightPrice) {
		this.flightPrice = flightPrice;
	}
	
}

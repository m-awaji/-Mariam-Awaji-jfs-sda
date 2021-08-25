package com.service;

import java.util.List;

import com.model.Flights;
import com.dao.FlightDao;


public class FlightService {

	private FlightDao dao;
	public FlightService() {
		dao = new FlightDao();
	}
	
	public int store(Flights flight) {
		int status = 0;
		status = dao.store(flight); 
		return status;
	}
	
	public List<Flights> fetchFlights() {
		List<Flights> list = null;
		list = dao.getFlights(); 
		return list;
	}


	
public List<Flights> fetchAirlines() {
		List<Flights> list2 = null;
		list2 = dao.getAirlines(); 
		return list2; 
	
} 
}

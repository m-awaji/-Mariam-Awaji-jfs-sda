package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Flights;
import com.service.FlightService;


@WebServlet("/AllFlightsServlet")
public class AllFlightsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FlightService service = new FlightService();
		List<Flights> flightsList = service.fetchFlights();
		request.setAttribute("flights", flightsList);
		request.getRequestDispatcher("AllFlights.jsp").forward(request, response);
	}
}

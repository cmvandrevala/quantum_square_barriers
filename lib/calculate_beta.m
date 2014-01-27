function beta = calculate_beta(incident_energy)
	
	declare_parameters
	energy_difference = incident_energy - barrier_height;
	beta = sqrt(2*mass*energy_difference)/hbar;

end

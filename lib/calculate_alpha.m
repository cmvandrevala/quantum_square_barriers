function alpha = calculate_alpha(incident_energy)
	
	declare_parameters
	alpha = sqrt(2*mass*incident_energy)/hbar;

end

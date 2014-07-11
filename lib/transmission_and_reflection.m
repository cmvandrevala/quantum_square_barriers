function [energies, transmission, reflection] = transmission_and_reflection

    declare_parameters

    transmission = zeros(1, number_of_data_points);
    reflection = zeros(1, number_of_data_points);
    energies = incident_energies;

    for i = 1:number_of_data_points

        k_one = calculate_alpha(energies(1,i));
        k_two = calculate_beta(energies(1,i));

        sum_k = k_one + k_two;
        diff_k = k_one - k_two;

        M_ktwo_kone = [sum_k/(2*k_one) diff_k/(2*k_one); diff_k/(2*k_one) sum_k/(2*k_one)];
        M_kone_ktwo = [sum_k/(2*k_two) -diff_k/(2*k_two); -diff_k/(2*k_two) sum_k/(2*k_two)];

        M_free_kone = [exp(-1i*k_one*barrier_width) 0; 0 exp(1i*k_one*barrier_width)];
        M_free_ktwo = [exp(-1i*k_two*barrier_width) 0; 0 exp(1i*k_two*barrier_width)];

        M = M_kone_ktwo*M_free_ktwo*M_ktwo_kone*M_free_kone;
        M = M^number_of_barriers;

        transmission(1,i) = det(M)/M(2,2);    
        reflection(1,i) = M(2,1)/M(2,2);

    end
    
    energies = energies/eV;

end

%% Calculate Alpha
function alpha = calculate_alpha(incident_energy)
	
	declare_parameters
	alpha = sqrt(2*mass*incident_energy)/hbar;

end

%% Calculate Beta
function beta = calculate_beta(incident_energy)
	
	declare_parameters
	energy_difference = incident_energy - barrier_height;
	beta = sqrt(2*mass*energy_difference)/hbar;

end

%% Calculate Incident Energies
function energies = incident_energies
%INCIDENT_ENERGIES Create a vector of incident energies

    declare_parameters
    epsilon = 1e-20;
    energies = linspace(barrier_height + epsilon, max_kinetic_energy + barrier_height, number_of_data_points);

end


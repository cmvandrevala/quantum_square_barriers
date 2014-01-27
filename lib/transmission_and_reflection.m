function [ incident_energy, transmission, reflection ] = transmission_and_reflection
%[ incident_energy, k_one, k_two, transmission, reflection, alpha ] = transmission_and_reflection( barrier_width, barrier_height )
%   Detailed explanation goes here

declare_parameters

% Pre-allocate Arrays
incident_energy = zeros(number_of_data_points, 1);
transmission = zeros(number_of_data_points, 1);
reflection = zeros(number_of_data_points, 1);

% Loop Through Each Energy Value
for i = 1:number_of_data_points
	
    kinetic_energy = barrier_height + energy_step_size*i;
    k_one = calculate_alpha(kinetic_energy);
    k_two = calculate_beta(kinetic_energy);

    sum_k = k_one + k_two;
    diff_k = k_one - k_two;
    
    M_ktwo_kone = [sum_k/(2*k_one) diff_k/(2*k_one); diff_k/(2*k_one) sum_k/(2*k_one)];
    M_kone_ktwo = [sum_k/(2*k_two) -diff_k/(2*k_two); -diff_k/(2*k_two) sum_k/(2*k_two)];
    
    M_free_kone = [exp(-1i*k_one*barrier_width) 0; 0 exp(1i*k_one*barrier_width)];
    M_free_ktwo = [exp(-1i*k_two*barrier_width) 0; 0 exp(1i*k_two*barrier_width)];
    
    M = M_kone_ktwo*M_free_ktwo*M_ktwo_kone*M_free_kone;
    M = M^number_of_barriers;
    
	incident_energy(i) = kinetic_energy;
    transmission(i) = det(M)/M(2,2);    
    reflection(i) = M(2,1)/M(2,2);

end

end


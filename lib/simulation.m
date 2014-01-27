declare_parameters

[energies, transmission, reflection] = transmission_and_reflection

y = linspace(0,1,1000);
photon_energy = 2*pi*hbar*speed_of_light/(465e-9)
x = zeros(1,1000);

for i = 1:1000
	x(1,i) = photon_energy/eV;
end

figure(1)
plot(energies/eV, conj(transmission).*transmission, x, y)
title("Transmission Coefficient vs. Incident Energy")
xlabel("Kinetic Energy (eV)")
ylabel("T")
axis([0 5 0 1])

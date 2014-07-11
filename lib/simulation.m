clear all
clf

[energies, transmission, reflection] = transmission_and_reflection;

figure(1)
plot(energies, conj(transmission).*transmission)
title('Transmission vs. Incident Energy of Electron')
xlabel('Kinetic Energy (eV)')
ylabel('Transmission (T)')

figure(2)
plot(energies, conj(reflection).*reflection)
title('Reflection vs. Incident Energy of Electron')
xlabel('Kinetic Energy (eV)')
ylabel('Reflection (R)')
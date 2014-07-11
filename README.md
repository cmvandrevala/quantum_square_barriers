Quantum Square Barriers
=======================


Background
----------
This simulation calculates the transmission and reflection coefficients for a single electron plane wave incident on a series of square barriers.  It makes use of the transfer matrix method outlined in a series of lecture notes by Michael G. Moore from his PHYS 851 course in fall 2009.  A PDF copy of Dr. Moore's lecture notes is provided in the directory labeled "papers".


Input
-----
The parameters for the simulation are listed in "lib/declare\_parameters.m".  All of the input parameters must be in SI units (joules, kilograms, and meters).  In order to make conversions easier, "eV" and "nm" have been defined.  Appending "\*eV" to a value will convert eV to joules.  Appending "\*nm" to a value will convert nanometers to meters.  For example:

* 10\*eV => (10)(1.60217657e-19) joules
* 10\*nm => (10)(1e-9) meters


Output
------
Running "lib/simulation.m" returns two graphs - one with the transmission coefficient (T) as a function of incident energy and the other with the reflection coefficient (R) as a function of incident energy.

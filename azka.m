global R= 3; # mm
global R_r= 0; # mm
global R_z= 3; # mm
global z_1= 0; # mm
global z_2= 0.3; # mm
global i_0= deg2rad(30); # degrees

function y = E(z)
	global R_z R;
	y= (R_z - z) / R;
endfunction

function y = A1(z)
	y = z;
endfunction

function y = A2(z)
	global R;
	y = -R / 2 * ( E(z) * sqrt(1-E(z)^2) + asin(E(z)) );
endfunction

function y = A3(z)
	global R R_z;
	y = 1 / R * (R_z * z - z^2 /2 );
endfunction

function y = B1(z)
	global i_0 R_r R
	y= sqrt(tan(i_0)^2 * (R_r / R + sqrt (1-E(z)^2) )^2 + 1 / (1- E(z)^2) );
endfunction

function y = B2(z)
	global i_0 R_r R
	y= sqrt(tan(i_0)^2 * (R_r / R + sqrt (1-E(z)^2) )^2 * (1 - E(z)^2) +1 );
endfunction

function y = B3(z)
	global i_0 R_r R
	y= E(z) * sqrt(tan(i_0)^2 * (R_r / R + sqrt (1-E(z)^2) )^2 + 1 / (1- E(z)^2) );
endfunction

result_A1= A1(z_2) - A1(z_1);
result_A2= A2(z_2) - A2(z_1);
result_A3= A3(z_2) - A3(z_1);
result_B1= quad("B1", z_1, z_2);
result_B2= quad("B2", z_1, z_2);
result_B3= quad("B3", z_1, z_2);

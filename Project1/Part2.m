% Writing a script to calculate poles
% Date: 31/01/2026
% Name: Hashaam Zafar


        % Calculations for each 
        R1 = 50;
        R2 = 500; 
        R3 = 500; 
        R4 = 500; 

        RT = (pa(R1, R2) + R3 + R4);
        Capacitances = [200e-9 500e-9 1e-6 2e-6 5e-6];
        for i = 1:5
            pole = 1 / (2 * pi * RT * Capacitances(i)); % rad/s -> Hz
            fprintf("Capacitance = %d, Pole = %d\n", Capacitances(i), pole);
        end


  

% Parallel Addition of resistors to reduce cluttering
function resistance = pa(r1, r2)
    resistance = (1/r1 + 1/r2)^-1;
end
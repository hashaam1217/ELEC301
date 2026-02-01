% Writing a script to calculate capacitance for all the possible resistor combinations
% Date: 31/01/2026
% Name: Hashaam Zafar

ResistorValue1 = 250;
ResistorValue2 = 500; 

for i = 1:5
    for j = i+1:6
        % Setting up all the combinations
        array = [250 250 250 250 250 250];
        array(i) = 500;
        array(j) = 500;

        % Calculations for each 
        R1 = array(1);
        R2 = array(2); 
        R3 = array(3);
        R4 = array(4); 
        R5 = array(5); 
        R6 = array(6); 
    
        RC1 = pa(pa(pa((R3 + R6), R5) + R2, R4), R1);
        RC2 = pa(pa(R1, R4) + R2, pa(R3 + R6, R5));
        RC3 = pa(pa(pa(R1, R4) + R2, R5) + R3, R6);

        W1 = 10^4;
        W2 = 10^5;
        W3 = 10^6;

        C1 = 1 / (W1 * RC1);
        C2 = 1 / (W2 * RC2);
        C3 = 1 / (W3 * RC3);

        C1 = C1 * 10^9;
        C2 = C2 * 10^9;
        C3 = C3 * 10^9;

        syms V1 V2
        eq1 = (V1 - 1) / R1 + V1/R4 + (V1 - V2)/R2 == 0;
        eq2 = (V2 - V1) / R2 + V2 / R5 + V2 / (R3 + R6) == 0;
        sol = solve([eq1, eq2], [V1, V2]);
        Vo = double(sol.V2 * R6 / (R3 + R6));
        
        

        fprintf("For i= %d, j= %d, C1 = %d nF, C2 = %d nF, C3 = %d nF\n", i, j, C1, C2, C3);
        fprintf("Vo = %d\n", Vo);


        % fprintf("Yeet %d %d\n", i, j);
    end
end


% Parallel Addition of resistors to reduce cluttering
function resistance = pa(r1, r2)
    resistance = (1/r1 + 1/r2)^-1;
end
% Test Code. Use to test the BestOf3 function

SensA = 4;
SensB = 12;
SensC = 20;

SensErrA = false;
SensErrB = false;
SensErrC = false;

[OUT_VAL,q_xSensor1Active,q_xSensor2Active,q_xSensor3Active] =... 
    BestOf3(SensA, SensB, SensC, SensErrA, SensErrB, SensErrC);

disp('Output Value: ')
disp(OUT_VAL)
disp('Sensor A Active: ')
disp(q_xSensor1Active)
disp('Sensor B Active: ')
disp(q_xSensor2Active)
disp('Sensor C Active: ')
disp(q_xSensor3Active)
disp('diff1 (A,B) = ')
disp(abs(SensA-SensB))
disp('diff2 (A,C) = ')
disp(abs(SensA-SensC))
disp('diff3 (B,C) = ')
disp(abs(SensB-SensC))

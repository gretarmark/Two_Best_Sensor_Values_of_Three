function [OUT_VAL,q_xSensor1Active,q_xSensor2Active,q_xSensor3Active] =...
    BestOf3(SENSOR_A, SENSOR_B, SENSOR_C, SENSOR_A_ERROR, SENSOR_B_ERROR, SENSOR_C_ERROR)
    
    
    nrSensFunc = 0;
    rHaedaskynjariTemp = [0 0 0];
    
    if ~SENSOR_A_ERROR
	    nrSensFunc = nrSensFunc + 1;
        rHaedaskynjariTemp(nrSensFunc) = SENSOR_A;
    end

    if ~SENSOR_B_ERROR
	    nrSensFunc = nrSensFunc + 1;
	    rHaedaskynjariTemp(nrSensFunc) = SENSOR_B;
    end

    if ~SENSOR_C_ERROR
        nrSensFunc = nrSensFunc + 1;
	    rHaedaskynjariTemp(nrSensFunc) = SENSOR_C;
    end


    iState = nrSensFunc;

    if iState == 1
        OUT_VAL = rHaedaskynjariTemp(1);
	    q_xSensor1Active = ~ SENSOR_A_ERROR;            
        q_xSensor2Active = ~ SENSOR_B_ERROR;            
        q_xSensor3Active = ~ SENSOR_C_ERROR;
    elseif iState == 2
        OUT_VAL = rHaedaskynjariTemp(2);
	    q_xSensor1Active = ~SENSOR_A_ERROR;            
        q_xSensor2Active = ~SENSOR_B_ERROR;            
        q_xSensor3Active = ~SENSOR_C_ERROR;
    elseif iState == 3
        
        if rHaedaskynjariTemp(1) == rHaedaskynjariTemp(2)
            OUT_VAL = rHaedaskynjariTemp(1);
            q_xSensor1Active = true;            
            q_xSensor2Active = true;            
            q_xSensor3Active = false;
        elseif rHaedaskynjariTemp(1) == rHaedaskynjariTemp(3)
            OUT_VAL = rHaedaskynjariTemp(1);
            q_xSensor1Active = true;            
            q_xSensor2Active = false;            
            q_xSensor3Active = true;
        elseif rHaedaskynjariTemp(2) == rHaedaskynjariTemp(3) 
            OUT_VAL = rHaedaskynjariTemp(2);
            q_xSensor1Active = false;            
            q_xSensor2Active = true;            
            q_xSensor3Active = true;
        else
	        diff1 = abs(rHaedaskynjariTemp(1) - rHaedaskynjariTemp(2));
	        diff2 = abs(rHaedaskynjariTemp(1) - rHaedaskynjariTemp(3));
	        diff3 = abs(rHaedaskynjariTemp(2) - rHaedaskynjariTemp(3));
        
%             if diff1 == diff2
% 		        OUT_VAL = (rHaedaskynjariTemp(1) + rHaedaskynjariTemp(2))/2;
% 		        q_xSensor1Active = true;            
%                 q_xSensor2Active = true;            
%                 q_xSensor3Active = false;
%             if diff1 == diff3
% 		        OUT_VAL = (rHaedaskynjariTemp(1) + rHaedaskynjariTemp(2))/2;
% 		        q_xSensor1Active = true;            
%                 q_xSensor2Active = true;            
%                 q_xSensor3Active = false;
%             elseif diff2 == diff3
% 		        OUT_VAL = (rHaedaskynjariTemp(2) + rHaedaskynjariTemp(3))/2;
% 		        q_xSensor1Active = false;            
%                 q_xSensor2Active = true;            
%                 q_xSensor3Active = true;
%             if diff1 == diff2 && diff2 == diff3
% 		        OUT_VAL = rHaedaskynjariTemp(1);
% 		        q_xSensor1Active = true;            
%                 q_xSensor2Active = false;            
%                 q_xSensor3Active = false;
            if diff1 < diff2 && diff1 < diff3
		        OUT_VAL = (rHaedaskynjariTemp(1) + rHaedaskynjariTemp(2))/2;
		        q_xSensor1Active = true;            
                q_xSensor2Active = true;            
                q_xSensor3Active = false;
            elseif diff2 < diff1 && diff2 < diff3
		        OUT_VAL = (rHaedaskynjariTemp(1) + rHaedaskynjariTemp(3))/2;
		        q_xSensor1Active = true;            
                q_xSensor2Active = false;            
                q_xSensor3Active = true;
	        else
		        OUT_VAL = (rHaedaskynjariTemp(2) + rHaedaskynjariTemp(3))/2;
		        q_xSensor1Active = false;            
                q_xSensor2Active = true;            
                q_xSensor3Active = true;
            end
        end
    end
end

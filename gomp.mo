block Gomp

parameter Real T = 2.1; // 48 minuti
parameter Real probGompDown = 1;   //limite superiore della probabilita' di  essere down

Integer prenotati;

RandomValue random(samplePeriod=T,globalSeed=40020,localSeed=14000);

InputBoolean statoAula;
InputInteger nuoviPrenotati;

OutputBoolean aulaAgibile;
OutputBoolean gompDown;
OutputInteger prenotatiOut;

algorithm
when initial() then 
	prenotati := 0;
	prenotatiOut := prenotati;
	gompDown := false;
end when;

when sample(0, T) then
	prenotati := nuoviPrenotati; 

	if (random.r1024 <= probGompDown) then 
		gompDown := false;
	else 
	  	gompDown := true;
	end if;
	  
	prenotatiOut := prenotati;
	aulaAgibile := statoAula;
	  	    
end when;

end Gomp;


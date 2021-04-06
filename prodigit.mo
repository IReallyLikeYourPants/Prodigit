block Prodigit

parameter Real T = 1;
parameter Real probProdigitDown = 0.8;

RandomValue random(samplePeriod=T, globalSeed = 101, localSeed = 424);

Integer nuoviPrenotati;
Integer prenotati;
Boolean prodigitDown;

InputBoolean aulaAgibile;
InputBoolean gompDown;
InputInteger prenotatiIn;
InputInteger pre_in;
InputInteger pre_out;

OutputInteger prenotatiOut;



algorithm
when initial() then 
	prodigitDown := false;
	prenotati := prenotatiIn;
end when;

when sample(0, T) then	
	nuoviPrenotati := 0;
	
	if(gompDown) then 
		if(random.r1024 < probProdigitDown) then
			prodigitDown := true;
		else
			prodigitDown := false;
		end if;
  	else
  		if(aulaAgibile) then
  			if(prenotati + pre_in - pre_out <= 100 and prenotati + pre_in - pre_out >= 0) then 				
  				nuoviPrenotati := pre_in - pre_out;	
  				prenotati := prenotati + nuoviPrenotati;
  			end if;
  		end if;
  	end if;
  	
  	prenotatiOut := prenotati;
end when;

end Prodigit;

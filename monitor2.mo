block Monitor2

InputInteger prenotatiProdigit;   
InputInteger prenotatiGomp;
Integer x;
Integer y;
Integer w;
Integer t;
OutputBoolean segnale;

algorithm

when initial() then 
	segnale := false;
end when;

when sample(0, 0.01) then
	x := prenotatiGomp;
	y := prenotatiProdigit;
	w := y - x;
	t := w;
	if(w > 5 or w < -5) then 
		segnale := true;
	end if;
	  	    
end when;

end Monitor2; 

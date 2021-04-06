block Monitor

InputInteger prenotati;   
Integer c;

OutputBoolean signal;

algorithm

when initial() then 
	signal := false;
end when;

when sample(0, 0.01) then
	c := prenotati;
	if(prenotati > 100 or prenotati < 0) then 
		signal := true;
	end if;
	  	    
end when;

end Monitor; 
  
/*block Monitor

Boolean w; 
InputInteger prenotati;   

OutputBoolean signal;

initial equation    
  w = false;
  
equation
  w = (prenotati > 100 or prenotati < 0);   

algorithm
when edge (w) then
  signal := true;
end when;

end Monitor; */
  

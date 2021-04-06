block Aula

parameter Real T = 0.25; //15 minuti
parameter Real probAulaDown = 1;

RandomValue random(samplePeriod=T, globalSeed = 10230, localSeed = 4210);
OutputBoolean statoAula; 

algorithm

when sample(0, T) then
  if  (random.r1024<=probAulaDown) then 
      statoAula := true;
  else
      statoAula := false; 
  end if;
end when;

end Aula;

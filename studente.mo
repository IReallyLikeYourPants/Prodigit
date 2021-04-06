block Studente

parameter Real T = 1; //12 minuti

RandomDistribution random_in(samplePeriod=T, globalSeed=362310, n1=0.1, n2=0.1, n3=0.2, n4=0.2, n5=0.4);
RandomDistribution random_out(samplePeriod=T, globalSeed=312100, n1=0.0, n2=0.2, n3=0.2, n4=0.3, n5=0.3);

OutputInteger pre_in;
OutputInteger pre_out;

algorithm

when sample(0,T) then
	pre_in := random_in.x;
	pre_out := random_out.x;
end when;

end Studente;

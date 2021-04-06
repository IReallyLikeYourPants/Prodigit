
block RandomDistribution

OutputInteger x;

// import Rng = MLibrary.Random.Generator ;

parameter Integer N = 5;   // number of slots in probability distribution for random variable
parameter Real n1 = 0.2;
parameter Real n2 = 0.2;
parameter Real n3 = 0.2;
parameter Real n4 = 0.2;
parameter Real n5 = 0.2;
// Probability Distribution of random variable in {1, 2, ... N}

parameter Real P[5] =  {n1, n2, n3, n4, n5};

      parameter Real samplePeriod = 1.0
        "Sample period for the generation of random numbers";
      parameter Integer globalSeed = 30020
        "Global seed to initialize random number generator";

    // Random number generators with exposed state
      parameter Integer localSeed = 614657
        "Local seed to initialize random number generator";
       OutputReal r1024 "Random number generated with Xorshift1024star";

protected
      discrete Integer state1024[Modelica.Math.Random.Generators.Xorshift1024star.nState];

algorithm

assert(check(P), "Probability Distribution does not sum up to 1");

      when initial() then
        // Generate initial state from localSeed and globalSeed

        state1024 := Modelica.Math.Random.Generators.Xorshift1024star.initialState(localSeed, globalSeed);
        r1024     := 0;
	x := 0;
	
      elsewhen sample(0,samplePeriod) then
       (r1024,state1024) := Modelica.Math.Random.Generators.Xorshift1024star.random(pre(state1024));
       x := pick(r1024, P) - 1;
       
      end when;


end RandomDistribution;



function  pick
InputReal z;   // uniformly distributed random input
InputReal[:] P;   // probability distribution
OutputInteger w;  // Random variable

protected
Integer i;
Real y;

algorithm

//  Idea:
//  if z is in [0, P[1]] then w = 1,
//  if z is in (P[1], P[1] + P[2]] then w = 2
//  if z is in (P[1] + P[2], P[1] + P[2] + P[3]] then w = 3
//  ....
//  if z is in (P[1] + P[2] + P[3] + .... P[N-1], 1] then w = N


i := 1;
y := P[i];

while ((z > y) and (i < size(P, 1))) loop
  i := i + 1;
  y := y + P[i];
end while;

w := i;

end pick;


function  check
InputReal[:] P;   // probability distribution
OutputBoolean w;

protected
Real y;

algorithm

y := 0.0;

for i in 1:size(P, 1) loop  
    y := y + P[i];
end for;

// w := ((y >= 0.9999) and (y <= 1.0001));
w := (y == 1.0);

end check;

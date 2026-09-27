// Define sampling parameters
Fs = 600;
Ts = 1 / Fs;

// Define high-resolution time vector for continuous analog signals
t = 0:0.0001:0.025; 

// Define discrete time vector and indices
n = 0:(0.025/Ts);
tn = n * Ts;

// Generate original analog signal xa(t)
xa = sin(480 * %pi * t) + 3 * sin(720 * %pi * t);

// Generate discrete sampled signal x(n) 
// The math shows this reduces to -2*sin(0.8*pi*n)
x_discrete = sin(480 * %pi * tn) + 3 * sin(720 * %pi * tn);

// Generate reconstructed analog signal ya(t) output from ideal DAC
ya = -2 * sin(480 * %pi * t);

// Plot original analog signal
scf(1);
subplot(3, 1, 1);
plot(t, xa, 'k-');
title("Original Analog Signal xa(t)");
xlabel("Time (s)");
ylabel("Amplitude");

// Plot sampled discrete signal
subplot(3, 1, 2);
plot2d3(tn, x_discrete);
plot(tn, x_discrete, 'ro');
title("Sampled Discrete Signal x(n) at Fs = 600 Hz");
xlabel("Time (s)");
ylabel("Amplitude");

// Plot reconstructed analog signal showing destructive aliasing
subplot(3, 1, 3);
plot(t, ya, 'b-');
title("Reconstructed Analog Signal ya(t) after Ideal D/A");
xlabel("Time (s)");
ylabel("Amplitude");

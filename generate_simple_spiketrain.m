%Generate single spiketrain

rand('state',sum(100*clock));

nsec=1 ;
T=1;
deltat=0.001;
r=100;
p=r*deltat;
numbins=round(T/deltat);
spiketrain=round(rand(1,numbins) + (p-1/2))

figure;
plot(spiketrain,'.')

figure;
imagesc(spiketrain)


%Generate many "trials" of spiketrains
numtrials=200;
spiketrain=round(rand(numtrials,numbins) + (p-1/2));

figure;
imagesc(spiketrain)
xlabel('time')
ylabel('trial')


%Compute the average spike rate, and standard deviation
rate_per_trial=1/T * sum(spiketrain,2)
mean_rate_per_trial = mean(rate_per_trial)
std_dev_rate_per_trial = std(rate_per_trial)

%%  1. Soru A Sıkkı


clear all
close all

f = 100000;
f=100;
t = -1:1/f:1;
x1 = sawtooth(2*pi*f*t);
subplot(2,1,1)
plot(t,x1)
axis([0 0.2 -1.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude') 
title('Sawtooth Periodic Wave')

%%  1. Soru B Sıkkı

clear all
close all

f = 1000000;
f=20;
t = -1:1/f:1;
x2 = square(2*pi*f*t);
subplot(2,1,2)
plot(t,x2)
axis([0 0.2 -1.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude')
title('Square Periodic Wave')

%% 1 Soru C Sıkkı

clear all
close all
f = 100000;
t = -1:1/f:1;
x1 = tripuls(t,100e-3);
subplot(2,1,1)
plot(t,x1)
axis([-0.1 0.1 -0.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude')
title('Triangular Aperiodic Pulse')

%% 1 Soru D Sıkkı

clear all
close all
f = 10000;
t = -1:1/f:1;
x2 = rectpuls(t,50e-3);
subplot(2,1,2)
plot(t,x2)
axis([-0.1 0.1 -0.2 1.2])
xlabel('Time (sec)')
ylabel('Amplitude')
title('Rectangular Aperiodic Pulse')

%% 1 Soru E Sıkkı

clear all
close all
f=10000000;
f=50000;
tc = gauspuls('cutoff',50e3,0.5,[],-60); 
t1 = -tc : 1e-6 : tc; 
y1 = gauspuls(t1,50e3,0.6);
subplot(2,1,1)
plot(t1*1e3,y1)
xlabel('Time (ms)')
ylabel('Amplitude')
title('Gaussian Pulse')

%% 1 Soru F Sıkkı

clear all
close all
T = 0 : 1/50e3 : 10e-3;
D = [0 : 1/1e3 : 10e-3 ; 0.8.^(0:10)]';
Y = pulstran(T,D,@gauspuls,10E3,.5);
f = 200E9;                    % örnek fq 
D = [2.5 10 17.5]' * 1e-9;    % darbe gecikme süreleri 
t = 0: 1 / f: 2500 / f;        % sinyal değerlendirme süresi 
w = 2e-9;                     % Her bir atımın genişliği 
yp = pulstran (t, D,@rectpuls, w);
subplot(2,1,1)
plot(t*1e9,yp);
axis([0 25 -0.2 1.2])
xlabel('Time (ns)')
ylabel('Amplitude')
title('Rectangular Train')

%% 1 Soru G Sıkkı

clear all
close all

T = 0 : 1/50e3 : 10e-3;
D = [0 : 1/1e3 : 10e-3 ; 0.6.^(0:10)]';
Y = pulstran(T,D,@gauspuls,10E3,.5);
f = 50e3;                    % sample freq
D = [2.5 10 17.5]' * 0.6e-3;     % pulse delay times
t = 0 : 1/f : 2500/f;        % signal evaluation time
w = 10e3;                      % width of each pulse
yp = pulstran(t,D,@rectpuls,w);
subplot(2,1,2)
plot(T*1e3,Y)
xlabel('Time (ms)')
ylabel('Amplitude')
title('Gaussian Pulse Train')


%% 2 Soru 

clear all
close all
t = (-1:0.01:1)';

impulse = t==0;
unitstep = t>=0;
ramp = t.*unitstep;
quad = t.^2.*unitstep;
plot(t,[impulse unitstep ramp quad])
subplot(-1,0,1)

%% 3 Soru 

clear all
close all
fs=1000; % İşaretin frekansı 10 Hz
f=20 % Örnekleme frekansı katsayısı
f=f*fs %Sinyalin örnekleme frekansı Hz;
ts=1/f;
n=[0:(1/f):1]; % Sinyal 0'dan 1 saniyeye kadar
faz=0;
tsy=cos(2*pi*n*fs+faz); 
plot(n,tsy, 'k' ); 
title('Cosinus dalgasi')
xlabel('saniye');
ylabel('genlik');

%% 4 Soru 

clear all
close all
t=-10:10; %vector time
x=rand(1,numel(t)); % Your signal
xmt=[fliplr(x(t>=0)) fliplr(x(t<0))]
xe=(g(t)+g(-t))/2
xo=(g(t)-g(-t))/2
subplot(3,1,2);
plot(t,xe);
title('Even part')
subplot(3,1,3);
plot(t,xo);
title('Odd part')

%% 5 Soru 

clear all
close all
twoDimensionalFilter = fspecial('gauss');
[isseparable,hcol,hrow] = isfilterseparable(twoDimensionalFilter)

%% 6 Soru 

clear all
close all
fs=2000 
f=1000 
t=0:1/fs:5
y1=sin(2*pi*f*t)
subplot(2,1,1)
plot(t,y1,'LineWidth',2)
fs1=50000
t_samp1=0:1/10:5
y2=sin(2*pi*f*t_samp1)
subplot(2,1,2)
stem(t_samp1,y2)

%% 7 Soru 

clear all
close all

rng default
n = 0:2;
x = 4+cos(2*pi*n/24);
x0 = downsample(x,3,0);
x1 = downsample(x,3,1);
x2 = downsample(x,3,2);
y0 = upsample(x0,3,0);
y1 = upsample(x1,3,1);
y2 = upsample(x2,3,2);
subplot(4,1,1)
stem(x,'Marker','none')
title('Original Signal')
ylim([-4 4])

subplot(4,1,2)
stem(y0,'Marker','none')
ylabel('Phase 0')
ylim([-4 4])

subplot(4,1,3)
stem(y1,'Marker','none')
ylabel('Phase 1')
ylim([-4 4])

subplot(4,1,4)
stem(y2,'Marker','none')
ylabel('Phase 2')
ylim([-4 4])


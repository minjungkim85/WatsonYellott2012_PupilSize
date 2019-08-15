close all;
clear; clc;

age  = 30;   % age in years
dCM  = 91;   % viewing distance in cm
wCM  = 20.6; % display width in cm
hCM  = 16.5; % display height in cm

% width and height of the display in degrees of visual angle
w = 2*ATand2(.5 * wCM, dCM);  
h = 2*ATand2(.5 * hCM, dCM); 

% width and height of the visual field in degrees of visual angle
fw = 190; 
fh = 150; 

% area of the display and of the full field
area = [w*h, fw*fh];   

neyes = 2;                  % binocular viewing (neyes=1 for monocular)
lum   = 10.^linspace(-2,4); % luminance in cd/m^2
pupil = nan(1,length(lum));

for s = 1:length(area)
    pupil(s,:) = wy_getPupilSize(age, lum, area(s), neyes, 'Unified', 'area');
end


h = plot(log10(lum),pupil);
xtl = [.02,.2,2,20,200,2000,7000];

set(gca,'XTick',log10(xtl));
set(gca,'XTickLabel',xtl);
xlabel('Luminance (cd/m^2)');
ylabel('Pupil Diameter (mm)');
xlim(log10([.01,10000]));
ylim([1 8.5]);

legend('Display (12.9 x 10.4 dva)', 'Full field (190 x 150 dva)');

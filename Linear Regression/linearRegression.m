function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Will Grace Mech 105 2022
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
%% Array Size Check
xsize = size(x);
ysize = size(y);
if xsize(1,2) ~= ysize(1,2)
    error('Arrays are not the same size');
end

%% Filtering Outliers
num = ysize(1,2); %initial number of values

[fY,sorder] = sort(y); %ascending order
fX = x(sorder); %match x values to y

quartone = floor((num+1)/4); %first quartile index
Q1 = fY(1,quartone);
quartthree = floor((3*num+3)/4); %third quartile index
Q3 = fY(1,quartthree);
IQR = Q3 - Q1; %interquartile range
min = Q1 - 1.5*IQR; %min value from interquartile range
max = Q3 + 1.5*IQR; %max value from interquartile range

r = 1;
while r <= num
    if fY(1,r)<min || fY(1,r)>max %remove values outside of range dtermined by IQR
        fX(:,r) = [];
        fY(:,r) = [];
        r = r-1;
        num = num-1;
    end
    r = r+1;
end
 
%% Linear Regression

%values to calculate a0 and a1
sumX = sum(fX);
sumXsq = sum((fX).^2);
sumY = sum(fY);
sumXY = sum(fY.*fX);
[~,n] = size(fX);
meanY = mean(fY);
meanX = mean(fX);

slope = (n*sumXY - sumX*sumY)/(n*sumXsq - sumX^2); %a1 normal equn
intercept = meanY - slope*meanX; %a0 normal equn

%% R Squared
%used formula 14.21 from book, as it utilizes many previously calculated #s

sumYsq = sum((fY).^2);

r = (n*sumXY - sumX*sumY)/(sqrt(n*sumXsq - (sumX)^2)*sqrt(n*sumYsq - (sumY)^2)); %formula R
Rsquared = r^2; %square value to get R^2

end

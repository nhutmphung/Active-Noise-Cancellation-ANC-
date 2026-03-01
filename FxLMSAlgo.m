function [yhat, eS] = fxlms(x ,y ,L, mu, Sw, Shw, Shx) 

Function performs the Filtered Least Mean Squares Algo. (FxLMS) 

% Inputs:
%   x : input signal 
%   y : desired signal 
%   L : filtered length (positive integer) 
%   mu : step size (positive scalar) 
%   Sw: weighting coefficients for the reference signal 
%   Shw : weighting coeffeicients for the filtered reference signal 
%   Shx : delayed input signal 
% 
% Outputs:
%   yhat : filtered output 
%   eS: squared error 

% Validating inputs 
% ==================================================================================

% Controls how big of a leap/jump the wegihts update upon each iteration. a negative mu would 
% make the error gradient climb/go upward rather than descend casuing it to
% diverge. A 0 learning rate would make it no update at all 
assert(mu > 0, 'Step size must be a positive scalar');

% defines how many past samples the FIR looks back over, must be positive
% because you can't have a filter with fractional or zero taps
assert(L >0 && round(L) == L, 'Filter length must be a positive integer'); 

% making sure that the length of the reference mic and the length of the error mic have the legnth same 
% in the algorithm because at every step you need x(n) and y(n) to exist
assert(length(x) == length(y), 'Input and desired signals must have the same length'); 


% ==================================================================================

Sy = zeros(size(y));
e = zeros(size(y);
Wx = zeros(L, 1);
Ww = zeros(L, 1);
Wy = zeros(size(y));
Sx = zeros(szie(Sw)); 
Shy = zeros(L, 1); 

% ** ALGORITHM **  

for n = 1:length(y)
    Wx = [x(n); Wx(1:L-1)];
    Wy(n) = Wx'*Wx; 
    Sx = [Wy(n); Sx(1:length(Sx)-1)]; 
    Sy(n) = Sw'*Sx; 
    Shx = [x(n); Shx(1:L-1)];
    Shy = [Shw'*Shx; Shy(1:L-1)];
    e(n) = y(n) - Sy(n); 
    Ww = Ww + mu * e(n) * Shy; 

end 

yhat = Sy; 
eS = e.^2;



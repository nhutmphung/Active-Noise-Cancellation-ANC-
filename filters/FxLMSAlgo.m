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

% ** Variable Initialization ** 
% =================================================================================

% the variables are initialized at zero because we at first assume that the noise is silent 
% we cant make assumptions as to what the noise would sound like so, as it might 
% accidentally make the noise cancellation louder 

Sy = zeros(size(y));
e = zeros(size(y));
Wx = zeros(L, 1);
Ww = zeros(L, 1);
Wy = zeros(size(y));
Sx = zeros(size(Sw)); 

% Shy = S hat of y is the real world equivalnce of sound traveling through
% wires and speakers before it hits your ears 
Shy = zeros(L, 1); 

% =================================================================================


% ** ALGORITHM **  

% ┌─────────────────────────────────────────────────────┐
% │                                                     │
% │   x(n)  -> [ Adaptive Filter Ww ] -> Wy(n)          |
% │                                                     │
% │   Wy(n) -> [ Secondary Path Sw ] -> Sy(n)           │
% │                                                     │
% │   e(n) = y(n) - Sy(n)                               │
% │                                                     │
% │   x(n) -> [ Secondary Path Shw ] -> x'(n)           │
% │                                                     │
% │   Ww = Ww + mu * e(n) * x'(n)  ← weight update      |
% │                                                     │
% └─────────────────────────────────────────────────────┘

for n = 1:length(y)                   %NOTE: ^T = Transpose for matrix, or ' (apostrophe is symbol for transpose in matlab)
    Wx = [x(n); Wx(1:L-1)];           %builds the input buffer, shifts x(n) into a length-L 
                                      % Vector: [x(n), x(n-1), ... x(n-L+1)^T]

    Wy(n) = Wx'*Wx;                   %PRIMARY FILTER OUPUT; THIS IS JUST y(n) = Xn*W' (W transposed); 
                                      %Ww is the adaptive filter weight
                                      %being learned by the algorithm 

    Sx = [Wy(n); Sx(1:length(Sx)-1)]; 
    Sy(n) = Sw'*Sx; 
    e(n) = y(n) - Sy(n);             %typical error signal e(n) = d(n) - yhat(n) where Sy(n) is 
                                     % the yhat(n) in this instance

    Shx = [x(n); Shx(1:L-1)];
    Shy = [Shw'*Shx; Shy(1:L-1)];


    Ww = Ww + mu * e(n) * Shy;       %Weight update for the LMS step/learning rate. 
                                     % This is the gradient descent part of the algo. 
                                     %Higher system formula: w(n+1) = w(n) + mu*e(n)*X'n 
                                     %This instance: 
                                     % w(n) = Ww; 
                                     % mu = mu;
                                     %Shy = X'(n) 
                                  
end 

yhat = Sy; 
eS = e.^2;



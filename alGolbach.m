function gold_couples = alGolbach(N)
% alGolbach : function to compute and list every Goldbach couples
% of prime numbers which sum equals the given -even- input.
%
% Author, copyright and support : nicolas (dot) douillet (at) free (dot) fr, 2023.
%
%
% Input
%
% - N : positive even integer scalar.
%
%
% Output
%
% gold_couples : positive integer matrix of prime numbers. The Goldbach couples.
%                size(gold_couples) = [m, 2], with m the number of found couples.


n = 2:N;
P = n(isprime(n)); % primes less or equal to N

assert(isreal(N) && mod(N,2) == 0 && floor(N) == N, 'N must be even integer.');


T = 2*P;        % trivial cases
T = T(T < N+1); % the ones less or equal to N

gold_couples = zeros(0,2);
k = 0;

while k < numel(T) % number of trivial cases before N 
   
    triv_cas = T(end-k);    
    delta = N - triv_cas; % = 2(m - p) where N = 2m
    
    new_couple = 0.5*triv_cas + [0,delta];
    
    if all(isprime(new_couple))
        
        gold_couples = cat(1,gold_couples,new_couple);
    
    end
    
    k = k + 1;
    
end

disp(['N = ', num2str(N),' can be written as the sum(s) of primes belonging to the following (p,p'') couples :']);
disp(gold_couples);


end % alGolbach
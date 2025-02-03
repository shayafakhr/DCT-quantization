% ENSC180, Q2. symstem of linear equations

% T1 = (10 + 20 + T2 + T3) / 4.
% T2 = (20 + 40 + T1 + T4) / 4.
% T3 = (10 + 30 + T1 + T4) / 4.
% T4 = (30 + 40 + T2 + T3) / 4.

% Simplify:
% 4 T1 -   T2 -   T3 + 0 T4 = 30
%  -T1 + 4 T2 + 0 T3 -   T4 = 60
%  -T1 + 0 T2 + 4 T3 -   T4 = 40
% 0 T1 -   T2 -   T3 + 4 T4 = 70

A = [4, -1, -1,  0; ...
    -1,  4,  0, -1; ...
    -1,  0,  4, -1; ...
     0, -1, -1,  4];

b = [30, 60, 40, 70]';

% Matrix inverse
T = inv(A) * b
A * T - b

% Left division
T = A \ b
A * T - b

clear all; clc;

syms x M_a g k_1 y_q l_pq B dgdt phi dpdt e_ga w0 t M_b k_2 l_pgb l_gbq I_b2;

eqns = [-M_a*g+k_1*y_q+k_1*l_pq*B-M_a*dgdt+M_a*l_pq*B*(phi^2)-M_a*l_pq*dpdt+M_a*e_ga*sin(w0*t)*(w0^2)-...
    M_b*g+k_2*y_q-M_b*dgdt-M_b*l_gbq*dpdt+M_b*l_gbq*B*(phi^2) == 0, l_pgb*M_a*g-l_pgb*k_1*y_q-...
    l_pgb*k_1*l_pq*B+l_pgb*M_a*dgdt-l_pgb*M_a*B*(phi^2)+l_pgb*M_a*l_pq*dpdt-l_pgb*M_a*e_ga*sin(w0*t)*(w0^2)+...
    k_2*y_q*l_gbq+M_b*(l_gbq^2)*B*(phi^2)+M_b*(l_gbq^2)*(B^2)*dpdt-I_b2*dpdt == 0];

T = solve(eqns, dgdt, dpdt);
T.dgammadt
T.dphidt




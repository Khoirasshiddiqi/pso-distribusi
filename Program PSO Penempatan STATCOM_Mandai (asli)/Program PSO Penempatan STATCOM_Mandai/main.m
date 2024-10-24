%basecase data
% clear
% close all
% clc
   
% load the data
% [feeder_V, bus, branch] = loadcase1();
% data;
nbus = length(bus(:, 1));  % number of buses

% initialize the voltage at nodes at 1 p.u
V = complex(ones(nbus,1)*feeder_V);

V_old = mean(abs(V));

%iterative operation:
for i = 1:100

    % calculate branch currents from voltages
    [Ibr, out_I] = arus(V, bus, branch);
    
    % calculate losses and increased current due to line losses
    [losses, I_loss] = rugi(Ibr, V, branch);
    Ibr = Ibr + I_loss;

    % calculate node voltages from currents
    [V, out_V] = tegangan(feeder_V, Ibr, bus, branch);

    % termination condition
    change = mean(abs(V)) - V_old;
    if change < 10^-6
        break;
    end
    V_old = mean(abs(V));  % store old Voltages

end

% % display the results
[T_Bus, T_Branch,T_Losses] = display_results(V, feeder_V, Ibr, branch, losses)
% losses;
% Ploss=real(losses);
% Qloss=imag(losses);
% Total_losses_P_KW=sum(Ploss)/1000
% Total_losses_Q_KVAr=sum(Qloss)/1000;
% TeganganBus=abs(V)/feeder_V;
 Injeksi_STATCOM= bus(44,3)



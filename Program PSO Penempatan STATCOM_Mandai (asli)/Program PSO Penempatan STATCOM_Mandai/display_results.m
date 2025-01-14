function [T_Bus, T_Branch, T_Losses] = display_results(V, feeder_V, Ibr, branch, losses)
%DISPLAY OF RESULTS

%Plot the voltage Profiles at all buses
   figure(1)
   plot(abs(V)/feeder_V,':bs','MarkerFaceColor',[1 0 0]);
   title('Bus voltages p.u');
   xlim([0 length(V)]);
   xlabel('bus numbers');
   ylabel('Voltage (p.u)');
   title('Voltage Profile In Makassar Distribution System');
   grid on
    T_Bus = table((1:length(V))',abs(V)/feeder_V, angle(V));
    T_Bus.Properties.VariableNames= {'Bus', 'Voltage','Angle'};
    T_Bus.Properties.VariableUnits = {'','V (p.u)','Radians' };
    
    % calculate losses
    fprintf('\n Losses Results');
    Real_loss = real(losses)/1000
    Reactive_loss = imag(losses)/1000
    T_Losses = sum(Real_loss), sum(Reactive_loss);
    % add the Line level results to a table
    fprintf('\n Branch Results');
    T_Branch = table(branch(:,2), branch(:, 3), abs(Ibr(:)), real(Ibr(:).*V(branch(:,2)))/1000, Real_loss, Reactive_loss);
    T_Branch.Properties.VariableNames= {'From_Bus', 'To_Bus','Current', 'Line_Power', 'Real_loss', 'Reactive_loss'};
    T_Branch.Properties.VariableUnits = {'','','A','kW','kW','kVAR'};
    
end
           
    
%  Total_Real_Loas= Real_Loss(1,1)+ Real_Loss(1,2)+ Real_Loss(1,3)+ Real_Loss(1,4)+Real_Loss(1,5)+ Real_Loss(1,6)   
    
    
    

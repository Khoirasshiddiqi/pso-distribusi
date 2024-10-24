%--------------------------------------------------------------------------
% Title : Optimal Power Flow Using PSO  
%--------------------------------------------------------------------------
close all
clc
clear all
%--------------------------------------------------------------------------
% Parameter PSO
Juml_Particles =  100   ;
jumvar         =   1   ;  
MaxIt          =  100   ;
accel1         =   0.3;
accel2         =   0.3;
w_max          =   0.9 ; % Pso momentum or inertia
w_min          =   0.4 ; % Pso momentum or inertia
It = 1;
r1 = (rand(jumvar,Juml_Particles));
r2 = (rand(jumvar,Juml_Particles));
data;
%===============================================
% Inisialisasi posisi awal PSO
%--------------------------------------------------------------------------
% Constraint
% Randomly Active Power Generator
current_position= -100*rand(1,Juml_Particles);  
%                    80*rand(1,Juml_Particles); 
%                    50*rand(1,Juml_Particles);   
%                    55*rand(1,Juml_Particles);    
%                    30*rand(1,Juml_Particles);   
%                    40*rand(1,Juml_Particles)];
current_position_awal=current_position;
% Inisialisasi velocity awal PSO
velocity=0.05*(-100*rand(1,Juml_Particles));  
%               80*rand(1,Juml_Particles); 
%               50*rand(1,Juml_Particles);   
%               55*rand(1,Juml_Particles);    
%               30*rand(1,Juml_Particles);   
%               40*rand(1,Juml_Particles)];
% Inisialisasi awal local best position
local_best_position=current_position; 
% Evalusi Fungsi Objectif
for ir=1:Juml_Particles
    data;
    % Input Particle ke Bus Data Untuk LF
    bus(62,3)   = current_position(1,ir);        
%     busdata(2,7)   = current_position(2,ir);        
%     busdata(13,7)  = current_position(3,ir);               
%     busdata(22,7)  = current_position(4,ir);        
%     busdata(23,7)  = current_position(5,ir);        
%     busdata(27,7)  = current_position(6,ir);  
%% Batasan Konstrain Daya Aktif 
%  Batasan Maksimum Slack Bus
       if (bus(92,1)) < 0.95
             current_fitness(ir) = 10000;
       end
% %% Batasan Equality
%     if (sum(busdata(:,5)) ~= busdata(1,7)+busdata(2,7)+busdata(13,7)+busdata(22,7)+busdata(23,7)+busdata(27,7)),
%        current_fitness(ir) = 1000;
%     end;
% %% Batasan Inequality
%     if (sum(busdata(:,5)) > busdata(1,7)+busdata(2,7)+busdata(13,7)+busdata(22,7)+busdata(23,7)+busdata(27,7)),
%        current_fitness(ir) = 1000;
%     else
%% LOAD FLOW NEWTON RAPHSON
%    [V, out] = voltages(init_V, Ibr, bus, branch)
%    [Ibr, out] = current(V, bus, branch)
%    [losses, I_loss] = calc_loss(Ibr, V, branch)
%    [T_Bus, T_Branch] = display_results(V, feeder_V, Ibr, branch, losses)
% main;
% [losses, I_loss] = calc_loss(Ibr, V, branch)
%     Tlosses = sum(real(losses)) 
alirandaya;
test 
    Fitness(ir)= test;
    current_fitness(ir) = Fitness(ir);
end
% end
% Local and Best Fitness
local_best_fitness=current_fitness;
[global_best_fitness,g]=min(local_best_fitness);

% Local and Best Position
local_best_position=current_position;
for ir=1:Juml_Particles
    global_best_position(:,ir)=local_best_position(:,g); 
end
% Update Velocity
W=w_max-((w_max-w_min)/MaxIt)*It;
velocity=(W*velocity)+(accel1*(r1.*(local_best_position-current_position)))...
    +(accel2*(r2.*(global_best_position-current_position)));
% Update Position
current_position=current_position+velocity;
% Plot grafik
hfig=figure(1);
hold on
title('---Grafik Konvergensi PSO---');
set(hfig,'position',[50,40,600,300]);
set(hfig,'doublebuffer','on');
hbestplot=plot(1:MaxIt,zeros(1,MaxIt));
xlabel('Iterasi');
ylabel('Total Losses (Kw)');
hold off
drawnow;
% Evaluasi Loop
% while It<=MaxIt
%       % Evalusi Fungsi Objectif
%       for ir=1:Juml_Particles
%         data;
%       % Input Particle ke Bus Data Untuk LF
%           bus(44,3)   = current_position(1,ir);        
% %           busdata(2,7)   = current_position(2,ir);        
% %           busdata(13,7)  = current_position(3,ir);               
% %           busdata(22,7)  = current_position(4,ir);        
% %           busdata(23,7)  = current_position(5,ir);        
% %           busdata(27,7)  = current_position(6,ir);  
%      % Batasan Konstrain Daya Aktif 
%      % Batasan Maksimum Slack Bus
%           if (bus(92,1)) < 0.95,
%              current_fitness(ir) = 10000;
%           end;
% %      % Batasan Equality
% %           if (sum(busdata(:,5)) ~= busdata(1,7)+busdata(2,7)+busdata(13,7)+busdata(22,7)+busdata(23,7)+busdata(27,7)),
% %              current_fitness(ir) = 1000;
% %           end;
% %      % Batasan Inequality
% %           if (sum(busdata(:,5)) > busdata(1,7)+busdata(2,7)+busdata(13,7)+busdata(22,7)+busdata(23,7)+busdata(27,7)),
% %              current_fitness(ir) = 1000;
% %           else
%      % LOAD FLOW NEWTON RAPHSON
% %      data;
%          alirandaya;
%          test;
% %          test = sum(Ploss)/1000
% %           test = alirandaya (busdata,linedata);
%           Fitness(ir)= test;
%           current_fitness(ir) = Fitness(ir);
%           end
%       
%       % Update Local Best
%       for ir=1:Juml_Particles
%         if current_fitness(ir)<local_best_fitness(ir) 
%            local_best_fitness(ir)=current_fitness(ir);
%            local_best_position(:,ir)=current_position(:,ir);
%         end
%       end
%       % Update Global Best
%       [current_global_best_fitness(It),g]=min(local_best_fitness); 
%     
%       if current_global_best_fitness(It)<global_best_fitness
%          global_best_fitness=current_global_best_fitness; 
%             for ir=1:Juml_Particles
%                 global_best_position(:,ir)=local_best_position(:,g); 
%             end
%       end
%       % Update Velocity
%       W=w_max-((w_max-w_min)/MaxIt)*It;
%       velocity=(W*velocity)+(accel1*(r1.*(local_best_position-current_position)))...
%           +(accel2*(r2.*(global_best_position-current_position)));
% % Update Position
% current_position=current_position+velocity;          
% % Draw Graphics
% % plotvector=get(hbestplot,'Ydata');
% % plotvector(It)=current_global_best_fitness(It);
% % set(hbestplot,'Ydata',plotvector);
% drawnow
% It=It+1 ;
%  end
ProgramAkhir
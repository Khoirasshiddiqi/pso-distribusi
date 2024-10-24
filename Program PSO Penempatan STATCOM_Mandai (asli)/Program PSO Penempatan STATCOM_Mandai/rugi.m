function [losses, I_loss] = rugi(Ibr, V, branch)
%Mengitung Losses jaringan
% and the loss current

R = branch(:,4);
X = branch(:,5);

losses = (Ibr.^2).*complex(R,X);

I_loss = losses./V(branch(:,2));

end
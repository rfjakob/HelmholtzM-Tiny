function [ points ] = calculate_points_oneblock(n, g)
%CALCULATE_POINTS_ONEBLOCK Summary of this function goes here
%   Detailed explanation goes here

global config;

points=[]; % Format: [x y z antiparallel], x y z in Tesla, antiparallel 0 or 1

if g==1 || g==3
    antipar=1;
    % No anti mode in on-anti switching
    if config.mode==2
        return;
    end
else
    antipar=0;
end

nc=config.number_of_cycles(g);

if config.mode==0 % Rotating field
    if n(1)==0
        s=[1 0 0];
    elseif n(2)==0
        s=[0 1 0];
    elseif n(3)==0
        s=[0 0 1];
    else
        % n is not in any special plane.
        % Assume s(1)=1 and s(2)=1, calculate s(3).
        s=[1 1 -(n(1)+n(2))/n(3)];
        s=s/norm(s); % Unity length
    end
    s=s(:);
    for c=1:nc
        for r_degrees=0:config.step_size:(360-config.step_size)
            r=r_degrees/360*2*pi;
            R=rotationmat3D(r,n);
            p=R*s;
            points=[points; p.' antipar];
        end
    end
elseif config.mode==1 % On-off switching
    n=n/norm(n);
    for c=1:nc
        points=[points; n antipar; 0 0 0 antipar];
    end
elseif config.mode==2 % On-anti switching
    n=n/norm(n);
    for c=1:nc
        points=[points; n 0; n 1];
    end
end

end


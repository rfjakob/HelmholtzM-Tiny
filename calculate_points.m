function [ ] = calculate_points( )
%CALCULATE_POINTS Calculate points of the circle to step through.

global config;

points=[]; % Format: [x y z antiparallel], x y z in Tesla, antiparallel 0 or 1

for a=[1 2 3] % loop trough axes

    if config.axes_enabled(a)==0
            % If the axis is disabled skip it
            continue;
    end
    n=config.rotation_axes(a,:);
    
    for g=[1 2 3] % loop trough anti->normal->anti
        nextblock=calculate_points_oneblock(n, g);
        points=[points; nextblock];
    end
end

config.points_todo=points;
config.points_todo(:,1:3)=config.points_todo(:,1:3)*config.target_flux_density;

plot_status();

end


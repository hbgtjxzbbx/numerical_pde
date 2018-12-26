function [x, u] = drawPeriodicFunction(N, uName)
% [x, u] = drawPeriodicFunction(N, uName);
% User draw a periodic function on screen using mouse.
% Inputs  N: number of points in the returned function
%         uName: name of function (displayed)
% Returns x: N equally spaced points in [0, 2*pi)
%         u: function values at x.
    xlim([0, 2*pi]);
    ylim([-1, 1]);
    xlabel('x');
    ylabel(uName);
    grid;

    % callback functions are on the bottom of this file
    set(gcf, 'WindowButtonDownFcn',@down);
    set(gcf, 'WindowButtonUpFcn',@up);
    set(gcf, 'WindowButtonMotionFcn',@motion);
    set(gca, 'UserData', [0]); % 0: blank, 1: drawing, 2: done
    
    % wait until mouse up
    finished = 0;
    while ~finished
        data = get(gca, 'UserData');
        if data(1) == 2
            finished = 1;
        else
            pause(0.1);
        end
    end

    % line coordinates from gca.UserData
    [x, u] = interpPeriodic(data(2:2:end), data(3:2:end), N);
    
    % replot periodic line
    cla;
    h = line(x, u);
    set(h, 'LineWidth', 3);
    set(h, 'color', 'r');
    
function [x, y] = interpPeriodic(x0, y0, N)
    % make periodic
    if x0(2) - x0(1) > 0 % increasing x
        xp = [x0(end) - 2*pi, x0, x0(1) + 2*pi];
    else % decreasing x
        xp = [x0(end) + 2*pi, x0, x0(1) - 2*pi];
    end
        
    yp = [y0(end), y0, y0(1)];
    
    x = [0:N-1] * 2*pi / N;
    y = interp1(xp, yp, x, 'linear');
    
        
function motion(src, data)
    data = get(gca, 'UserData');
    if length(data) == 0 return; end
    if data(1) == 1
        pt = get(gca, 'CurrentPoint');
        x = pt(1,1);
        y = pt(1,2);
        if x <= 0 || x >= 2*pi return; end
        if length(data) < 5 % fewer than 2 points are stored (line segment cannot be plotted)
            data = [data, x, y];
        else
            if data(end-1) == data(end-3) % repeated x coordinates
                data = data(1:end-2);
            else
                % draw line segment
                h = line([data(end-3), data(end-1)], [data(end-2), data(end)]);
                set(h, 'LineWidth', 3);
                set(h, 'color', 'r');
                % note that the last line segment is not plotted but this
                % effect is negligible
                
                % add to data
                if (x - data(end-1))*(data(end-1) - data(end-3)) > 0
                    data = [data, x, y];
                end
            end
        end
        set(gca, 'UserData', data);
    end
    return

function down(src, data)
    data = get(gca, 'UserData');
    if length(data) == 0 return; end
    data(1) = 1;
    set(gca, 'UserData', data);
    motion;
    return
    
function up(src, data)
    data = get(gca, 'UserData');
    if length(data) == 0 return; end
    data(1) = 2;
    set(gca, 'UserData', data);
    motion;
    return
            
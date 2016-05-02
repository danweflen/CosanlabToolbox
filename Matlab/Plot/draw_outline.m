function draw_outline(d, color, linewidth)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% draw_outline(d, color, linewidth)
%
% This function will draw an outline of significant pixels in a matrix of %
% zeros.  Will consider contiguous pixels part of the same shape.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%
% d                         Binary matrix (can be image_data() object)
% color                     Line Color
% linewidth                 Line Width
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (c) 2015 Luke Chang
%
% Permission is hereby granted, free of charge, to any person obtaining a
% copy of this software and associated documentation files (the "Software"), 
% to deal in the Software without restriction, including without limitation 
% the rights to use, copy, modify, merge, publish, distribute, sublicense, 
% and/or sell copies of the Software, and to permit persons to whom the 
% Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
% THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
% DEALINGS IN THE SOFTWARE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

idx = find(d==1);
sz_d = size(d);
[y,x] = ind2sub(sz_d,idx);

for px = 1:length(idx)
    if y(px)-1 > 0 && y(px)-1 <= sz_d(1) && x(px) > 0 && x(px) <= sz_d(2)
        if ~d(y(px)-1,x(px))
            line([x(px)-.5, x(px)+.5],[y(px)-.5,y(px)-.5],'color',color,'linewidth',linewidth)
        end
    end
    if y(px) > 0 && y(px) <= sz_d(1) && x(px) -1 > 0 && x(px)-1 <= sz_d(2)
        if ~d(y(px),x(px)-1)
            line([x(px)-.5, x(px)-.5],[y(px)-.5,y(px)+.5],'color',color,'linewidth',linewidth)
        end
    end
    if y(px) > 0 && y(px) <= sz_d(1) && x(px)+1 > 0 && x(px)+1 <= sz_d(2)
        if ~d(y(px),x(px)+1)
            line([x(px)+.5, x(px)+.5],[y(px)-.5,y(px)+.5],'color',color,'linewidth',linewidth)
        end
    end 
    if y(px)+1 > 0 && y(px)+1 <= sz_d(1) && x(px) > 0 && x(px) <= sz_d(2)
        if  ~d(y(px)+1,x(px))
            line([x(px)-.5, x(px)+.5],[y(px)+.5,y(px)+.5],'color',color,'linewidth',linewidth)
        end
    end
end

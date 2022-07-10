function [] = makelink(x1, y1, z1, x2, y2, z2, t, c)
%makelink(x1, y1, z1, x2, y2, z2, thickness)
%   MAKELINK plots a square based bar in 3D space 
%   takes 8 inputs:
%   x1, y2, z1 are the 3D coordinates of the start of the link
%   x2, y2, z2 are the 3D coordinates of the end of the link
%   t is the thickness of the bar
%   c is the colour (RGB array) of the bar

% Author: Daniel Jakob (18409686), 06/03/2021, Version 1.2

t = t/2; % bar thickness halved, centering bar £\label{line:thickhalf}£
if z1 == z2 % flat members £\label{line:flatcheck}£
    if y1 == y2 % going in x-direction
        vertices =  [x1 y1+t z1-t; £\label{line:xbarstart}£
                     £\textcolor{mytext}{x1 y1+t z1+t};£    
                     £\textcolor{mytext}{x1 y1-t z1+t};£
                     £\textcolor{mytext}{x1 y1-t z1-t};£
                     £\textcolor{mytext}{x2 y2+t z2-t};£
                     £\textcolor{mytext}{x2 y2+t z2+t};£
                     £\textcolor{mytext}{x2 y2-t z2+t};£
                     £\textcolor{mytext}{x2 y2-t z2-t}];\label{line:xbarfinish}£
              
    else % going in y-direction (must rotate by 90 deg)
        vertices =  [x1+t y1 z1-t;
                     x1+t y1 z1+t;    
                     x1-t y1 z1+t;
                     x1-t y1 z1-t;
                     x2+t y2 z2-t;
                     x2+t y2 z2+t;
                     x2-t y2 z2+t;
                     x2-t y2 z2-t];
    end
else % non-flat members
    vertices=   [x1+t y1-t z1;
                 x1+t y1+t z1;    
                 x1-t y1+t z1;
                 x1-t y1-t z1;
                 x2+t y2-t z2;
                 x2+t y2+t z2;
                 x2-t y2+t z2;
                 x2-t y2-t z2];
    
end

faces = [1 2 3 4; £\label{line:linkfacesstart}£
         £\textcolor{mynumber}{1 2 6 5}£;
         £\textcolor{mynumber}{2 3 7 6}£;
         £\textcolor{mynumber}{3 4 8 7}£;
         £\textcolor{mynumber}{4 1 5 8}£;
         £\textcolor{mynumber}{5 6 7 8}£]; £\label{line:linkfacesfinish}£
patch('Vertices', vertices, 'Faces', faces, 'FaceColor', c); £\label{line:barpatch}£
end
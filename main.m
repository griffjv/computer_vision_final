% This script creates a menu driven application

%%%%%%%%%%%%%%%%%%%%%%%%%%
% CSCI 5722 - Final
% Professor Fleming
% Griffin Van Anne - 107276487
% Aurangzeb Malik - 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all;clc;

% Display a menu and get a choice
choice = menu('Choose an option', 'Exit Program', 'Load Image Set','Add Image to Set',...
    'Sort Images', 'Display Image Sets');
 
% Choice 1 is to exit the program
while choice ~= 1
   switch choice
       case 0
           disp('Error - please choose one of the options.')
           % Display a menu and get a choice
           choice = menu('Choose an option', 'Exit Program', 'Load Image Set','Add Image to Set',...
    'Sort Images', 'Display Image Sets');
        case 2
            if ~exist('imgs.mat')
                % Load images and store in array
                image_files = dir('./images');
                imgs = {};
                for i = 3:length(image_files)
                    imgs(i-2) = {imread(strcat('./images/', image_files(i).name))};
                end
                save('imgs');
            else
                load('imgs')
            end
       case 3
           % Add image to set
           
           
       case 4
           % Sort images

              
       case 5
           % Display sets
           choice2 = menu('Choose an option','Display Outdoor Scenes', 'Display Portraits', 'Display Text Documents', ...
    'Display Cars', 'Display Skies', 'Display Flowers'); 
           switch choice2
               case 0
                    disp('Error - please choose one of the options.')
           % Display a menu and get a choice
                    choice2 = menu('Choose an option', 'Display Outdoor Scenes', 'Display Portraits', 'Display Text Documents', ...
                    'Display Cars', 'Display Skies', 'Display Flowers');
               case 1
                   % display outdoor scenes
               case 2
                   % display portraits
               case 3
                   % display text documents
               case 4
                   % display cars
               case 5
                   % display skies
               case 6
                   % display flowers
           end
   end
   % Display menu again and get user's choice
   choice = menu('Choose an option', 'Exit Program', 'Load Image Set','Add Image to Set',...
    'Sort Images', 'Display Image Sets');  
end
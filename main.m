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
            % Load images and store in array
            image_files = dir('./images');
            imgs = {};
            for i = 3:length(image_files)
                % saves the paths to the images
                imgs(i-2) = {strcat('./images/', image_files(i).name)};
            end
       case 3
           % Add image to set
           prompt = "What is the path to the image you wish to add? If not in current folder, start input with './' to change folder path: ";
           new_img = input(prompt,"s");
           imgs(end+1) = {strcat(new_img)};
           
       case 4
           % Sort images, order of sorted_imgs cell array must correspond
           % to Display menu option
           sorted_imgs = sort_images(imgs);
              
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
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Outdoor-Scenes';
                   display_cluster(sorted_imgs{1}, plot_title, save_output)
               case 2
                   % display portraits
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Portraits';
                   display_cluster(sorted_imgs{2}, plot_title, save_output)
               case 3
                   % display text documents
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Text';
                   display_cluster(sorted_imgs{3}, plot_title, save_output)
               case 4
                   % display cars
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Images with Cars';
                   display_cluster(sorted_imgs{4}, plot_title, save_output)
               case 5
                   % display skies
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Images with Skies';
                   display_cluster(sorted_imgs{5}, plot_title, save_output)
               case 6
                   % display flowers
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Images with Flowers';
                   display_cluster(sorted_imgs{6}, plot_title, save_output)
           end
   end
   % Display menu again and get user's choice
   choice = menu('Choose an option', 'Exit Program', 'Load Image Set','Add Image to Set',...
    'Sort Images', 'Display Image Sets');  
end
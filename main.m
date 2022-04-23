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
           choice2 = menu('Choose an option', 'Rocky Beach', 'Grass-like Hills', 'Green Mountains', ...
                    'Dark Images (black & white and night time)', 'Shrubbery'); 
           switch choice2
               case 0
                    disp('Error - please choose one of the options.')
           % Display a menu and get a choice
                    choice2 = menu('Choose an option', 'Rocky Beach', 'Grass-like Hills', 'Green Mountains', ...
                    'Dark Images (black & white and night time)', 'Shrubbery');
               case 1
                   % display outdoor scenes
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Rocky Beach';
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
                   plot_title = 'Grass-like Hills';
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
                   plot_title = 'Green Mountains';
                   display_cluster(sorted_imgs{3}, plot_title, save_output)
                   choice3 = menu('Choose an option','Classify on including Skies', "Back to main menu"); 
                   switch choice3
                       case 0
                           disp('Error - please choose one of the options.');
                           % Display a menu and get a choice
                           choice3 = menu('Choose an option','Display Skies', "Back to main menu");
                       case 1
                           %adv sort
                           sorted_skies = sort_images_adv(sorted_imgs{3}, "skies")
                           prompt = 'Save output image? Yes or No: ';
                           save_answer = input(prompt, "s");
                           if strcmp(save_answer, 'Yes')
                               save_output = true;
                           else
                               save_output = false;
                           end
                           plot_title = 'Skies';
                           display_cluster(sorted_skies{1}, plot_title, save_output)
                           plot_title = 'No Skies';
                           display_cluster(sorted_skies{2}, plot_title, save_output)

                       case 2
                           disp('Going Back to main.');
                   end
               case 4
                   % display cars
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Dark Images (black & white and night time)';
                   display_cluster(sorted_imgs{4}, plot_title, save_output)
                   choice3 = menu('Choose an option','Display Skies', "Back to main menu"); 
                   switch choice3
                       case 0
                           disp('Error - please choose one of the options.');
                           % Display a menu and get a choice
                           choice3 = menu('Choose an option','Display black & white vs dark clusters', "Back to main menu");
                       case 1
                           %adv sort
                           sorted_skies = sort_images_adv(sorted_imgs{4}, "bw")
                           prompt = 'Save output image? Yes or No: ';
                           save_answer = input(prompt, "s");
                           if strcmp(save_answer, 'Yes')
                               save_output = true;
                           else
                               save_output = false;
                           end
                           plot_title = 'black & white';
                           display_cluster(sorted_skies{1}, plot_title, save_output)
                           plot_title = 'night time';
                           display_cluster(sorted_skies{2}, plot_title, save_output)

                       case 2
                           disp('Going Back to main.');
                   end
                   
               case 5
                   % display skies
                   prompt = 'Save output image? Yes or No: ';
                   save_answer = input(prompt, "s");
                   if strcmp(save_answer, 'Yes')
                       save_output = true;
                   else
                       save_output = false;
                   end
                   plot_title = 'Shrubbery';
                   display_cluster(sorted_imgs{5}, plot_title, save_output)
           end
   end
   % Display menu again and get user's choice
   choice = menu('Choose an option', 'Exit Program', 'Load Image Set','Add Image to Set',...
    'Sort Images', 'Display Image Sets');  
end
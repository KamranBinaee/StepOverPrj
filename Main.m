
clc
clear all
close all

%% You just need to pass the .mat file name and the experiment Data structure will be generated
MatFileName = 'Exp_RawMat_exp_data-2014-11-26-16-38.mat';
ExpData = GenerateDataStructure(MatFileName);

% Here is how to access left foot marker data
% ExpData.LeftFoot_FrIdx_mIdx_XYZ(FrameNumber, MarkerID, XYZ)

%% For Example This function finds the Toe Clearance before step over
%% As you can see the ExpData structure is passed to the function,
%% the index and the X location of the Toe is returned. One can subtract
%% this from the Obtacle Position to find the Toe Clearnace

[X_ToeClearance FrameIndex] = FindToeClearance(ExpData, ExpData.TrialType_FrIdx(1,:))

%% This function finds Step Over Frame for each Trial
%% As you can see the ExpData structure is passed to the function,
%% the index and the X location of the Toe is returned. One can subtract
%% this from the Obtacle Position to find the Toe Clearnace

clear VOCopts

if ispc %albert paths
	% get current directory with forward slashes
	cwd='C:\Users\alber\pascal_2006';
	cwd(cwd=='\')='/';
else %Sav paths
    
end

VOCopts.wtype = 'dsift';
VOCopts.dicttype = 'hikmeans';
VOCopts.cltype = 'svm';

% WORDS
VOCopts.dsift.binSize = 4; %4 or 8
VOCopts.dsift.step = 3;
VOCopts.dsift.onlyBB = 1;

VOCopts.phow.sizes = [4,8]; %default:  [4 6 8 10]
VOCopts.phow.color = 2; %1: gray, 2: hsv, 3: rgb, 4: opponent
VOCopts.phow.step = 30; %default 2
VOCopts.phow.onlyBB = 0;

%DICTIONARY
VOCopts.hikmeans.K = 3;
VOCopts.hikmeans.nleaves = 30;

VOCopts.ikmeans.K = 10;

%FEATURES

%CLASSIFIER
VOCopts.subWindows = [3 3];


% change this path to point to your copy of the PASCAL VOC data
VOCopts.datadir=[cwd '/'];
% change this path to a writable directory for your results
VOCopts.resdir=[cwd '/results/'];
% change this path to a writable local directory for the example code
VOCopts.localdir=[cwd '/local/'];
% initialize the test set
VOCopts.testset='val'; % use validation data for development test set
%VOCopts.testset='test'; % use test set for final challenge

% initialize paths
VOCopts.imgsetpath=[VOCopts.datadir 'VOC2006/ImageSets/%s.txt'];
VOCopts.clsimgsetpath=[VOCopts.datadir 'VOC2006/ImageSets/%s_%s.txt'];
VOCopts.annopath=[VOCopts.datadir 'VOC2006/Annotations/%s.txt'];
VOCopts.imgpath=[VOCopts.datadir 'VOC2006/PNGImages/%s.png'];
VOCopts.clsrespath=[VOCopts.resdir '%s_cls_' VOCopts.testset '_%s.txt'];
VOCopts.detrespath=[VOCopts.resdir '%s_det_' VOCopts.testset '_%s.txt'];

% initialize the VOC challenge options
VOCopts.classes={'bicycle','bus','car','cat','cow','dog',...
                 'horse','motorbike','person','sheep'};
VOCopts.nclasses=length(VOCopts.classes);	
VOCopts.minoverlap=0.5;


% WORDS caching filename
if strcmp(VOCopts.wtype, 'dsift')
    wordopts = VOCopts.dsift;
elseif strcmp(VOCopts.wtype, 'phow')
    wordopts = VOCopts.phow;
end

VOCopts.wordstrainpath = [VOCopts.localdir VOCopts.wtype '_train_' ...
    num2str(struct2array(wordopts), '%i_') '%s.mat'];

% DICTIONARY caching filename
VOCopts.dictpath = [VOCopts.localdir, VOCopts.dicttype, '_' ...
    num2str(struct2array(VOCopts.hikmeans), '%i_'), VOCopts.wtype, '_test_', ...
    num2str(struct2array(wordopts), '%i_'), '%s.mat'];

%TEST FEATURES caching
VOCopts.wordstestpath = [ VOCopts.localdir, 'test_', VOCopts.dicttype, '_', ...
    num2str(struct2array(VOCopts.hikmeans), '%i_'), VOCopts.wtype, '_test_', ...
    num2str(struct2array(wordopts), '%i_'), 'win_', num2str(VOCopts.subWindows, '%i_') '%s.mat'];




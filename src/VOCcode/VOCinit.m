clear VOCopts

if ispc %albert paths
	% get current directory with forward slashes
	cwd='C:\Users\alber\pascal_2006';
	cwd(cwd=='\')='/';
else %Sav paths
    
end

VOCopts.verbose = 0;

VOCopts.wtype = 'dsift';
VOCopts.dicttype = 'hikmeans';
VOCopts.cltype = 'rdf';


% WORDS
VOCopts.dsift.binSize = 4; %4 or 8
VOCopts.dsift.step = 3;
VOCopts.dsift.onlyBB = 1;

%DICTIONARY
VOCopts.hikmeans.K = 3;
VOCopts.hikmeans.nleaves = 60;

VOCopts.ikmeans.K = 10;

%FEATURES

%CLASSIFIER

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
VOCopts.wordstrainpath = [VOCopts.localdir VOCopts.wtype '_train_' ...
    num2str(struct2array(VOCopts.dsift), '%i_') '%s.mat'];

VOCopts.wordstestpath = [VOCopts.localdir VOCopts.wtype '_test_' ...
    num2str(struct2array(VOCopts.dsift), '%i_') '%s.mat'];


% DICTIONARY caching filename
VOCopts.dictpath = [VOCopts.localdir, VOCopts.dicttype, ...
    num2str(struct2array(VOCopts.hikmeans), '%i_'), VOCopts.wtype, '_test_', ...
    num2str(struct2array(VOCopts.dsift), '%i_'), '%s.mat'];




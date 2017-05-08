clear VOCopts

if ispc %albert paths
	% get current directory with forward slashes
	cwd='C:\Users\alber\pascal_2006';
	cwd(cwd=='\')='/';
else %Sav paths
    
end

VOCopts.wtype = 'dsift';
VOCopts.dicttype = 'hikmeans';

VOCopts.cltype = 'svc';


% WORDS
VOCopts.dsift.binSize = 8; %4 or 8
VOCopts.dsift.step = 10;

%DICTIONARY
VOCopts.hikmeans.K = 2;
VOCopts.hikmeans.nleaves = 50;

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

% initialize example options
VOCopts.exfdpath=[VOCopts.localdir '%s_fd.mat'];


% Vocabulary DSIFT caching filename
name_cache = 'dsift_train_';
dsift_params = reshape(cell2mat(struct2cell(VOCopts.dsift)),1,[]);
for i = 1:length(dsift_params)
    name_cache = [name_cache int2str(dsift_params(i)) '_'];
end
VOCopts.dsiftpath = [VOCopts.localdir name_cache '%s.mat'];


% HIKMEANS caching filename
hikmeans_params = reshape(cell2mat(struct2cell(VOCopts.hikmeans)),1,[]);
name_cache2 = 'hikmeans_';
for i = 1:length(hikmeans_params)
    name_cache2 = [name_cache2 int2str(hikmeans_params(i)) '_'];
end
name_cache2 = [name_cache2 name_cache];
VOCopts.hikmeanspath = [VOCopts.localdir name_cache2 '%s.mat'];

% Test HOBW DSIFT caching filename
name_cache = 'dsift_test_';
dsift_params = reshape(cell2mat(struct2cell(VOCopts.dsift)),1,[]);
for i = 1:length(dsift_params)
    name_cache = [name_cache int2str(dsift_params(i)) '_'];
end
VOCopts.testdsiftpath = [VOCopts.localdir name_cache '%s.mat'];




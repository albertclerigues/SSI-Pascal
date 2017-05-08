function [ words ] = SSI_w_DSIFT( VOCopts, I )
opts = VOCopts.dsift;
[~, words] = vl_dsift(I, 'size', opts.binSize, 'step', opts.step, 'FAST');
end


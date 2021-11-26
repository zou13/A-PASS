function extras = write_extras(fname,extras)
% Write extra bits of information
%__________________________________________________________________________
% Copyright (C) 2005-2017 Wellcome Trust Centre for Neuroimaging

%
% $Id: f68fe52aca437d1a4830884d9538f4d5c792d08f $


if ~isstruct(extras) || isempty(fieldnames(extras))
    return;
end

[pth,nam,ext] = fileparts(fname);
switch ext
    case {'.hdr','.img','.nii'}
        mname = fullfile(pth,[nam '.mat']);
    case {'.HDR','.IMG','.NII'}
        mname = fullfile(pth,[nam '.MAT']);
    otherwise
        mname = fullfile(pth,[nam '.mat']);
end
try
    opt = spm_get_defaults('mat.format');
catch
    opt = '-v6';
end
save(mname,'-struct','extras', opt);

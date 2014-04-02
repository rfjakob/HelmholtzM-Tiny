function logname = save_log( log, startdate, dirname, exname )
narginchk(1, 4);
if nargin < 2
    startdate=log.date_start;
if nargin < 3
    dirname=winqueryreg('HKEY_CURRENT_USER',...
                        'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders',...
                        'Desktop');
end
if nargin < 4
    exname='';
end    

logname = [dirname '\' exname datestr(startdate,'YYYYmmdd_HHMMSS') '.xls'];

%dont warn when creating sheets in the spreadsheet
warning('off','MATLAB:xlswrite:AddSheet');

xlswrite(logname,log.field_expected,'field_expected');
xlswrite(logname,log.field_measured,'field_measured');
xlswrite(logname,log.field_set_antiparallel,'field_set_antiparallel');
xlswrite(logname,log.current_expected,'current_expected');
xlswrite(logname,log.current_measured,'current_measured');
xlswrite(logname,log.earth_field,'earth_field');
xlswrite(logname,log.swtime,'swtime');
xlswrite(logname,log.antipar,'antipar');
xlswrite(logname,log.date,'date');

end
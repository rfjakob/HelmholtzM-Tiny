function [ ] = set_redlab_bit( bitname, BitValue )
%SET_REDLAB_BIT Set a bit (or bit block) on the redlab unit by functional
%name (see below).

global config

switch bitname
    case 'antiparallel'
        BitNum=[8 10 12];
    case 'XPOL'
        BitNum=9;
    case 'YPOL'   
        BitNum=11;
    case 'ZPOL'
        BitNum=13;
    case 'all'
        BitNum=[8 9 10 11 12 13];
    otherwise
        error('BUG: Invalid bitname "%d"',bitname)
end
 
[BoardNum,~,PortType]=redlab_conf();

for b=BitNum
    if config.dryrun==1
        r=0;
    else
        % int cbDBitOut(int BoardNum, int PortType, int BitNum, unsigned short BitValue)
        r=calllib('cbw32','cbDBitOut',BoardNum, PortType, b, BitValue);
    end
    if r~=0
        error('Could set bit on redlab relay switching board: Error %d',r)
    end
end

end


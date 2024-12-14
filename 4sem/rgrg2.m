str='прИвет';
fid = fopen('my_file2.dat','wb');
if fid==-1
    error('awfawfa');
end
fwrite(fid,[str '1' '2'],'int16');
fclose(fid); 
%b=fread(fid,5,'double');


fid = fopen('my_file2.dat','rb');
b=0;
cnt=1;
while ~feof(fid)
    [V,N]=fread(fid,1,'int16');
    if N>0
        b(cnt)=V;
        cnt=cnt+1;
    end
end

fclose(fid);
disp(char(b));
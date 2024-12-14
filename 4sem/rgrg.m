A=[1 2 3 4 5];
fid = fopen('my_file.dat','rb');
if fid==-1
    error('awfawfa');
end
%b=fread(fid,5,'double');


b=0;
cnt=1;
while ~feof(fid)
    [V,N]=fread(fid,1,'double');
    if N>0
        b(cnt)=V;
        cnt=cnt+1;
    end
end

fclose(fid);
disp(b);

fid = fopen('my_ex.txt','rb');
if fid==-1
    error('awfawfa');
end
s = fscanf(fid,'%d,%f,%f,%f,%f,%d');
fclose(fid); 
clear
ztmin=zeros(2,5);
for j=1:5
    dir1="data/Execution"+string(j)+".mat";
    load(dir1)
    ztmin(1,j)=tmin;
    dir2="data/notExecution"+string(j)+".mat";
    load(dir2)
    ztmin(2,j)=tmin;
end
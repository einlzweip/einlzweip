function experiment(a)
A=zeros(26,2);
A(:,1)=1:26;
p=puzzle(A);
for i=1:a
    Rp(p);
    Op(p);
    Op(p);
    Un(p);
    Hp(p);
    Un(p);
end
plotcube(p.stones);
p.stones
end

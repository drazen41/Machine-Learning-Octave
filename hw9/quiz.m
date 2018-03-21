A = randi(10,5,3);
B = randi(10,3,5);
R = round(rand(5,5));
C = A*B;
total = 0;
for i=1:5
  for j=1:5
    if(R(i,j)==1)
      total=total+C(i,j);
    end
  end
end
total1 = sum(sum((A*B).*R));
total2 = sum(sum(C(R==1)));
C = (A*B)*R;total3=sum(C(:));
%total4=sum(sum(A(R==1)*B(R==1))); % out of bound
      
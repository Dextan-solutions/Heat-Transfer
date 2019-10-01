clear 
clc;
x(1:4)=20;
time=0;
timef=3;
a(2:4)=1;
b(1)=-1.5;
b(2:4)=-3;
c(1:3)=1;
    display('THE SOLUTION BY TDMA AT TIME seconds');
   fprintf('%3s %5s %10s %10s %10s\n','Time','T1','T2','T3','T4')
   count=1;
    hh=ones(30,4);
for time=0.1:0.1:timef
    xold=x;
    d(1)=-0.5*xold(1);
    d(2)=-xold(2);
    d(3)=-xold(3);
    d(4)=-xold(4)-300;
    i=1;
    n=4;
    beta(i)=b(i);
    gamma(i)=d(i)/beta(i);
    il=i+1;
    for j=il:n
        beta(j)=b(j)-a(j)*c(j-1)/beta(j-1);
        gamma(j)=(d(j)-a(j)*gamma(j-1))/beta(j);
    end
    x(n)=gamma(n);
    n1=n-i;
    for k=1:n1
        j=n-k;
        x(j)=gamma(j)-c(j)*x(j+1)/beta(j);
    end
%     display(['THE SOLUTION BY TDMA AT TIME ',num2str(time),'seconds'])
  fprintf('%3g', time); fprintf('  %8.4f', x(1)); fprintf('   %8.4f', x(2));
  fprintf('   %8.4f', x(3)); fprintf('   %8.4f', x(4));
    fprintf('\n');
%     tt(count)=time;
%     temp(count).tt=[x(1),x(2),x(3),x(4)];
    hh(count,1:4)=[x(1),x(2),x(3),x(4)];
    count=count+1;
end

[tkt,llent]=meshgrid(1:1:n,0.1:0.1:timef);
    mesh(tkt,llent,hh)
%     xlim([0 1]);
    title('Temprature Distriution on a Metal bar')
    xlabel('Position[meter x 0.25]','Rotation',15)
    ylabel('time[sec]','Rotation',-35)
    zlabel('Temprature[K]')
%     surf(hh)
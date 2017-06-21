fid=fopen('data1.txt','r');
A=fscanf(fid,'%f',[4 inf]);
t1=A(2,:)./10;
f1=A(3,:);
s1=A(4,:);
fclose(fid);
fid=fopen('data2.txt','r');
A=fscanf(fid,'%f',[4 inf]);
t2=A(2,:)./10;
f2=A(3,:);
s2=A(4,:);
fclose(fid);

w0=4.034;
uw0=0.0001295;
ut=0.0001;
w1=2*pi./t1;
w2=2*pi./t2;
uw1=2*pi*ut./t1.^2;
uw2=2*pi*ut./t2.^2;

k1=w1./w0;
k2=w2./w0;
uk1=2*pi/w0./t1.^2.*sqrt(w0^2*ut^2+t1.^2.*uw0^2);
uk2=2*pi/w0./t2.^2.*sqrt(w0^2*ut^2+t2.^2.*uw0^2);

figure(1);
plot(k1,s1,'.b');
hold on;
plot(k2,s2,'.r');
for i=1:length(t1)
    uncertainty(k1(i),s1(i),uk1(i),1,'b');
end
for i=1:length(t2)
    uncertainty(k2(i),s2(i),uk2(i),1,'r');
end
hold off;
xlabel('$$\omega/\omega_0$$','Interpreter','latex','Fontsize',15);
ylabel('$$\theta_{st}$$','Interpreter','latex','Fontsize',15);
set(gca,'FontSize',15);
legend({'Damping Selection 2','Damping Selection 3'},'Fontsize',15);

figure(2);
plot(k1,f1,'.b');
hold on;
plot(k2,f2,'.r');
for i=1:length(t1)
    uncertainty(k1(i),f1(i),uk1(i),1,'b');
end
for i=1:length(t2)
    uncertainty(k2(i),f2(i),uk2(i),1,'r');
end
hold off;
xlabel('$$\omega/\omega_0$$','Interpreter','latex','Fontsize',15);
ylabel('$$\varphi$$','Interpreter','latex','Fontsize',15);
set(gca,'FontSize',15);
legend({'Damping Selection 2','Damping Selection 3'},'Fontsize',15);

for i=1:25
    fprintf('%d\t&\t%.3f\t&\t%.3f$\\times10^{-4}$\t&\t',i,k1(i),uk1(i)*10000);
    fprintf('%d\t&\t%.3f\t&\t%.3f$\\times10^{-4}$\\\\\n',i,k2(i),uk2(i)*10000);
end

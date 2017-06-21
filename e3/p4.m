A=[5 10 15 20 25 30]/100;
v=0.997/100./([40.19 20.12 13.51 10.18 8.15 6.88]./1000);
[curve,gof]=fit((A.^2)',(v.^2)','poly1');
plot(A.^2,v.^2,'.black','MarkerSize',1);
hold on;
uncertainty(A.^2,v.^2,0.0001,0.01,'b');
plot(curve);
hold off;
xlabel('A^2/m^2');
ylabel('v_{max}^2/m^2s^{-2}');
title(['k=' num2str(curve.p1) 's^{-2}']);
gof.rmse
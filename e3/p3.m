A=[5 10 15 20 25 30];
T=[12770.7 12759.3 12754.3 12751 12752.4 12782.1]/10;
plot(A,T,'.black','MarkerSize',1);
hold on;
uncertainty(A,T,0.1,1,'b');
hold off;
axis([0 33 1000 1500]);
xlabel('A/cm');
ylabel('T/ms');
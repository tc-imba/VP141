function spring( L,m,fig )

    figure(fig);
    [curve,gof]=fit(L',m','poly1');
    plot(L,m,'.black','MarkerSize',1);
    hold on;
    uncertainty(L,m,0.01/100*10,0.01*9.8/1000*10,'b');
    plot(curve);
    hold off;
    xlabel('L/m');
    ylabel('F/N');
    title(['k=' num2str(curve.p1) 'N/m']);
    gof.rmse

end


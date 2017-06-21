function relation( T,M,fig )

    figure(fig);
    [curve,gof]=fit(M',T','poly1');
    plot(M,T,'.black','MarkerSize',1);
    hold on;
    uncertainty(M,T,0.1,0.1,'b');
    plot(curve);
    hold off;
    xlabel('M/g');
    ylabel('T/ms');
    title(['k=' num2str(curve.p1) 'ms/g']);
    gof.rmse

end


function time( t,L,u,fig )

    figure(fig);
    [curve,gof]=fit(t',L','poly1');
    plot(t,L,'.black','MarkerSize',1);
    hold on;
    uncertainty(t,L,u/1000,0.01,'b');
    plot(curve);
    hold off;
    xlabel('t/ms');
    ylabel('L/mm');
    title(['v=' num2str(curve.p1) 'm/s']);
    gof.rmse

end


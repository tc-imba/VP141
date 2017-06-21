function uncertainty( x,y,dx,dy,c )
    for i=1:length(x)
        x1=x(i)-dx;
        y1=y(i)-dy;
        x2=x(i)+dx;
        y2=y(i)+dy;
        line([x1+0.3*dx x2-0.3*dx],[y1 y1],'color',c);
        line([x1+0.3*dx x2-0.3*dx],[y2 y2],'color',c);
        line([x1 x1],[y1+0.3*dy y2-0.3*dy],'color',c);
        line([x2 x2],[y1+0.3*dy y2-0.3*dy],'color',c);
        line([x(i) x(i)],[y1 y2],'color',c);
        line([x1 x2],[y(i) y(i)],'color',c);
    end
end


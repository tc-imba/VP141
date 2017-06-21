function uncertainty( x,y,dx,dy,c )
    x1=x-dx;
    y1=y-dy;
    x2=x+dx;
    y2=y+dy;
    line([x1+0.3*dx x2-0.3*dx],[y1 y1],'color',c);
    line([x1+0.3*dx x2-0.3*dx],[y2 y2],'color',c);
    line([x1 x1],[y1+0.3*dy y2-0.3*dy],'color',c);
    line([x2 x2],[y1+0.3*dy y2-0.3*dy],'color',c);
    line([x x],[y1 y2],'color',c);
    line([x1 x2],[y y],'color',c);
end


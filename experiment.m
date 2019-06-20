function experiment(a)
    %Experiment, ob zu überprüfen, ob die Drehungen richtig funktionieren
    %Bei experiment (1260) sollte der gelöste Würfel herauskommen, bei allen kleineren Argumenten ist es nicht der gelöste Würfel
    
    A=zeros(26,2);
    A(:,1)=1:26;
    p=puzzle(A);
    %Drehungsfolge
    for i=1:a
        Rp(p);
        Op(p);
        Op(p);
        Un(p);
        Hp(p);
        Un(p);
    end
    %Plot des resultierenden Würfels
    plotcube(p.stones);
    p.stones
end

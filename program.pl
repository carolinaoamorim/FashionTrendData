% arquivo com os programas


% 1) Qual estampa é a favorita para a primavera?

peca_primavera(ID, Nome, Pattern, Wish) :-
    peca(ID, Nome, _, Pattern, spring, _, _, _, Wish, _).

favorita_primavera(Wish-Pattern-Nome) :-
    setof(W-P-N,
            ID^Category^Sales^Rating^Out^Year^
            peca(ID, N, Category, P, spring, Sales, Rating, Out, W, Year),
            Lista),
    last(Lista, Wish-Pattern-Nome).

% 2) Em qual ano os biker shorts foram tendência? 

tendencia_bikershorts(ID, Nome, Sales, Year) :-
    peca(ID, biker_shorts, _, _, _, Sales, _, _, _, Year).

ano_bikershorts(Sales-Year) :-
    setof(S-Y,
            I^Name^Category^Pattern^Out^Wish^Ano^
            peca(ID, biker_shorts, Category, Pattern, winter, S, Rating, Out, Wish, Y),
            Lista),
    last(Lista, Sales-Year).


% 3) Qual foi o melhor produto do inverno?

produto_inverno(ID, Nome, Category, Rating) :-
    peca(ID, Nome, Category, _, winter, _, Rating, _, _, _).

favorita_primavera(Rating-Category-Nome) :-
    setof(R-C-N,
            ID^Pattern^Sales^Out^Wish^Year^
            peca(ID, N, C, Pattern, winter, Sales, R, Out, Wish, Year),
            Lista),
    last(Lista, Rating-Category-Nome).
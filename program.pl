% arquivo com os programas


% 1) Qual estampa é a favorita para a primavera? -> Qual estampa teve a maior soma de wishlist count na spring

peca_primavera(Pattern, Wish) :-
    peca(_, _, _, Pattern, spring, _, _, _, Wish, _).

wishlist_total_primavera(Pattern, Total) :-
    findall(Wish,
            peca(_, _, _, Pattern, spring, _, _, _, Wish, _),
            Lista),
    sum_list(Lista, Total).

favorita_primavera(Total-Pattern) :-
    setof(T-P,
            wishlist_total_primavera(P-T)
            Lista),
    last(Lista, Total-Pattern).

% 2) Em qual ano os biker shorts foram tendência? -> Qual ano os biker_shorts tiveram a maior soma de sales_count

tendencia_bikershorts(ID, Nome, Sales, Year) :-
    peca(ID, biker_shorts, _, _, _, Sales, _, _, _, Year).

ano_bikershorts(Sales-Year) :-
    setof(S-Y,
            I^Name^Category^Pattern^Out^Wish^Ano^
            peca(ID, biker_shorts, Category, Pattern, winter, S, Rating, Out, Wish, Y),
            Lista),
    last(Lista, Sales-Year).


% 3) Qual foi o melhor produto do inverno? -> Qual categoria teve a maior media de avarage rating no inverno

produto_inverno(ID, Nome, Category, Rating) :-
    peca(ID, Nome, Category, _, winter, _, Rating, _, _, _).

favorita_primavera(Rating-Category-Nome) :-
    setof(R-C-N,
            ID^Pattern^Sales^Out^Wish^Year^
            peca(ID, N, C, Pattern, winter, Sales, R, Out, Wish, Year),
            Lista),
    last(Lista, Rating-Category-Nome).
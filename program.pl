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

bikershorts_venda(Year, Sales) :-
    peca(_, biker_shorts, _, _, _, Sales, _, _, _, Year).

sales_bikershorts(Year, Total) :-
    findall(Sales,
            peca(_, biker_shorts, _, _, _, Sales, _, _, _, Year),
            Lista),
    sum_list(Lista, Total).

ano_bikershorts(Total-Year) :-
    setof(T-Y,
            sales_bikershorts(Y, T),
            Lista),
    last(Lista, Total-Year).


% 3) Qual foi o melhor produto do inverno? -> Qual categoria teve a maior media de avarage rating no inverno

inverno_rating(Category, AvarageRating) :-
    peca(_, _, Category, _, winter, _, AvarageRating, _, _, _).

media_rating(Category, Media) :-
    findall(AvarageRating,
            peca(_, _, Category, _, winter, _, AvarageRating, _, _, _),
            Lista),

    sum_list(Lista, Soma), 
    length(Lista, Quantidade),
    Media is Soma / Quantidade.

favorita_inverno(Rating-Category-Nome) :-
    setof(M-C,
            ID^Pattern^Sales^Out^Wish^Year^
            produto_inverno(C, M),
            Lista),
    last(Lista, Media-Category).
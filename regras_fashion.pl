% 1) Qual estampa é a favorita para a primavera? -> Qual estampa teve a maior soma de wishlist count na spring

peca_primavera(Pattern, Wish) :-
    peca(_, _, _, Pattern, _, spring, _, _, Wish, _).

wishlist_total_primavera(Pattern, Total) :-
    peca_primavera(Pattern, _),
    findall(Wish,
            peca(_, _, _, Pattern, _, spring, _, _, Wish, _),
            Lista),
    sum_list(Lista, Total).

favorita_primavera(Total-Pattern) :-
    setof(T-P,
            wishlist_total_primavera(P, T),
            Lista),
    last(Lista, _-Pattern).

% 2) Em qual ano os Wool Jackets foram tendência no outono?

wooljacket_venda(Year, Sales) :-
    peca(_, wool_jacket, _, _, _, autumn, Sales, _, _, Year).

sales_wooljacket(Year, Total) :-
    wooljacket_venda(Year, _),
    findall(Sales,
            peca(_, wool_jacket, _, _, _, autumn, Sales, _, _, Year),
            Lista),
    sum_list(Lista, Total).

ano_wooljacket(Total-Year) :-
    setof(T-Y,
            sales_wooljacket(Y, T),
            Lista),
    last(Lista, _-Year).


% 3) Qual foi o melhor produto do inverno? -> Qual categoria teve a maior media de avarage rating no inverno

inverno_rating(Category, Rating) :-
    peca(_, _, Category, _, _,winter, _, Rating, _, _).

media_rating(Category, Media) :-
    inverno_rating(Category, _),
    findall(Rating,
            peca(_, _, Category, _, _, winter, _, Rating, _, _),
            Lista),

    sum_list(Lista, Soma), 
    length(Lista, Quantidade),
    Media is Soma / Quantidade.

favorita_inverno(Media-Category) :-
    setof(M-C,
            media_rating(C, M),
            Lista),
    last(Lista, _-Category).
% 1) Qual estampa é a favorita para a primavera? -> Qual estampa teve a maior soma de wishlist count na spring

peca_primavera(Pattern, Wish) :-
    peca(_, _, _, Pattern, _, spring, _, _, Wish, _).

wishlist_total_primavera(Pattern, Total) :-
    peca_primavera(Pattern, _),
    findall(Wish,
            peca(_, _, _, Pattern, _, spring, _, _, Wish, _),
            Lista),
    sum_list(Lista, Total).

favorita_primavera(Pattern) :-
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

ano_wooljacket(Year) :-
    setof(T-Y,
            sales_wooljacket(Y, T),
            Lista),
    last(Lista, _-Year).


% 3) Qual é a peça com melhor avaliação no inverno entre pessoas entre 18-24 anos?

inverno_idade_rating(Category, Rating) :-
    peca(_, _, Category, _, 18_24, winter, _, Rating, _, _).

media_rating_jovem(Category, Media) :-
    inverno_idade_rating(Category, _),
    findall(Rating,
            peca(_, _, Category, _, 18_24, winter, _, Rating, _, _),
            Lista),

    sum_list(Lista, Soma), 
    length(Lista, Quantidade),
    Media is Soma / Quantidade.

favorita_inverno_jovem(Category) :-
    setof(M-C,
            media_rating_jovem(C, M),
            Lista),
    last(Lista, _-Category).
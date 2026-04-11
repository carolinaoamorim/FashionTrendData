% arquivo com as perguntas

% 1) Qual estampa é a favorita para a primavera? -> com o maior wish_list_count

?- peca_primavera(Pattern, Wish).
?- wishlist_total_primavera(Pattern, Total)
?- favorita_primavera(Resultado).

% 2) Em qual ano os biker shorts foram tendência? -> com o maior sales_count

?- tendencia_bikershorts(ID, Sales, Year).
?- ano_bikershorts(Resultado).

% 3) Qual foi o melhor produto do inverno? -> com o avarage rating

?- produto_inverno(ID, Nome, Category, Rating).
?- melhor_inverno(Resultado).
% arquivo com as perguntas

% 1) Qual estampa é a favorita para a primavera? -> com o maior wish_list_count

?- peca_primavera(Pattern, Wish).
?- wishlist_total_primavera(Pattern, Total).
?- favorita_primavera(Resultado).

% 2) Em qual ano os Wool Jackets foram tendência no outono? -> com o maior sales_count

?- wooljacket_venda(Year, Sales).
?- sales_wooljacket(Year, Total).
?- ano_wooljacket(Resultado).

% 3) Qual é a peça mais ultizada no inverno entre pessoas entre 18-24 anos? com o avarage rating

?- inverno_rating(Category, Rating).
?- media_rating(Category, Media).
?- favorita_inverno(Resultado).
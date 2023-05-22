# Numerical_Methods_project

Task1 - Markov is coming...
Timp de implementare - 5 ore
-------------------------------------------------------------------------------
    Functia parse_labyrinth primeste calea catre fisierul de input si citeste
matricea labirintului element cu element.
    Functia get_adjacency_matrix primeste ca parametru matricea obtinuta
anterior si creeaza o matrice auxiliara ce contine sirul de numere 1, 2, ...,
rows * columns pentru a putea determina cu usurinta pozitia in care ne aflam in
momentul curent in labirint.In continuare, se convertesc numerele ce codifica
pozitiile din labirint in cei 4 biti aferenti si se realizeaza cazuri atat
pentru cazurile de adiacenta cu celulele vecine, cat si cazuri pentru adiacente
cu starile de WIN sau LOSE.
    Functia get_link_matrix primeste ca parametru matricea labirintului si
initializeaza matricea de legaturi cu matricea de adiacenta, fiind ulterior
parcursa pe linii si contorizate toate conexiunile unei celule, pentru a putea
forma matricea de legaturi.
    Functia get_Jacobi_parameters are ca parametrii de output matricea si
vectorul de iteratie din matricea legaturilor.
    Functia perform_iterative verifica, initial, daca matricea este pozitiv
definita, caz in carese executa algoritmul iterativ Jacobi, in caz contrar
iesindu-se din functie.
    Functia heuristic_greedy creeaza un vector de cale in care introduce nodul
de start si un vector al celulelor vizitate, initial 0.In continuare, se
verifica printre vecinii celului curente, verificand adiacenta cu starea de WIN,
caz in care se returneaza vectorul de cale, si vecinul cu probabilitatea cea mai
mare de a ajunge in starea de WIN, acesta fiind adaugat in vectorul de cale si
marcat ca vizitat.In cazul in care nu s-a gasit un astfel de vecin si avem
adiacenta cu starea de LOSE, stergem celula curenta din cale.Bucla continua cat
timp vectorul de cale nu este gol.
    Functia decode_path creeaza aceeasi matrice auxiliara ca la functia pentru
matricea de adiacenta si parcurge vectorul de cale, pentru fiecare celula
intalnita verificand in matricea auxiliara pozitia la care se afla, aceasta
fiind introdusa in matricea decodificata.

Task2 - Linear Regression
Timp de implementare - 15 ore
-------------------------------------------------------------------------------
    Functia parse_data_set_file citeste dimensiunile matricei initiale si
valorile matricei, convertind numerele.
    Functia parse_csv_file citeste matricea din fisierul CSV, ignorand prima
linie, iterand prin aceasta si convertind prima coloana, cea a predictorilor,
in numere de tip double, iar celelalte primind o verificare suplimentara in
functie de tip lor:in cazul in care intalnim siruri care ar putea fi convertite
in numere, se realizeaza conversia, in caz contrar sirurile intalnite sunt
convertite la tipul mat.
    Functia prepare_for_regression itereaza prin matricea primita ca parametru
si transforma sirurile "yes" si "no" in 0 si 1, retinand coloana care contine
celelalte 3 siruri, coloanele din dreapta acesteia fiind mutate cu o pozitie spre
dreapta.Ulterior, coloana cu cele 3 siruri este transformata in codificarile
corespunzatoare.
    Functia linear_regression_cost_function realizeaza algoritmul descris in
breviar, utilizand vectorizari in favoarea unei bucle for.
    Functia gradient_descent implementeaza algoritmul descris in enunt,
adaugand elementul 0 aferent lui Theta(0) la final.
    Functia lasso_regressoin_cost_function implementeaza formula descrisa in
cerinta.
    Functia ridge_regressoin_cost_function implementeaza formula descrisa in
cerinta.
    Functia normal_equation verifica daca matricea FeaturesMatrix' *
FeaturesMatrix este pozitiv definita, caz in care se realizeaza algoritmul
descris, in caz contrar iesindu-se din functie.In ambele cazuri, vectorului i
se adauga elementul Theta(0) = 0.

Task3 - MNIST 101
Timp de implementare - 10 ore
-------------------------------------------------------------------------------
    Functia load_dataset preia datele din fisierul de intrare intr-o matrice 
si un vector al label-urilor.
    Functia split_dataset imparte datele primite din functia anterioara in date
pentru antrenarea modelului si date pentru testarea acestuia.
    Functia initialize_weights initializeaza ponderile in intervalul (-e, e).
    Functia cost_function remodeleaza parametrii astfel incat acestia sa fie
compatibili cu operatiile de inmultire, adaugand matricei coloana de bias
aferenta.In continuare, functia realizeaza algoritmul pentru functia de cost,
calculand erorile pentru straturile retelei neuronale si gradientul pentru
fiecare dintre acestea 3, folosind vectorizari pentru a imbunatati timpul de
prezicere al claselor pentru functia urmatoare.
    Functia predict_classes identifica, pe baza iesirilor calculate pentru cele
3 straturi, clasa prezisa pentru fiecare exemplu de intrare.

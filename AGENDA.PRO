domains

   %tipdatepers = date personale (nume, nr_telefon, tip_data_nastere)
   %tipdatanastere = datanastere( Zi, Luna, An )
   
   tipdatepers = datepers(string, string, tipdatanastere)
   
   tipdatanastere = datanastere(integer, integer, integer)
   
   tipdateagenda = dateagenda(string)

%baza de fapte pentru proprietarul agendei
database-proprietar
   proprietar(tipdatepers)
 
%baza de fapte pentru cunoscutii din agenda 
database-cunoscut
   cunoscut(tipdatepers)
 
%baza de fapte pentru activitatile din agenda 
database-activitate
   activitate(tipdateagenda)
   
   
%%setul de reguli 
predicates
   run
   
   %Preluare optiune
   preluareopt(string)
   
   %Validare optiune
   validareopt(string)
   
   %Executare optiune
   executaopt(string)
   
   %Adaugare date personale
   adaugdatepers
   
   %Eliminare date personale
   elimdatepers
   
   %Afisare date personale
   afisdatepers
   
   %Salvare date personale
   savedatepers
   
   %Adaugare date cunoscut
   adaugdatecunoscut
   
   %Eliminare date cunoscut
   elimdatecunoscut
   
   %Afisare date cunoscut
   afisdatecunoscut
   
   %Salvare date cunoscut
   savedatecunoscut
   
   %Adaugare date activitate
   adaugdateactiv
   
   %Eliminare date activitate
   elimdateactiv
   
   %Afisare date activitate
   afisdateactiv
   
   %Salvare date activitate
   savedateactiv
   
   %Citire date de nastere 
   %Citire Zi
   citirezi(integer)
   
   %Citire Luna
   citireluna(integer)
   
   %Citire An
   citirean(integer)
	
	
clauses

    preluareopt(Opt):-
	  %makewindow(Handle,Yleft,Ytop,Width,Height,TitleString)
	  makewindow(1, 6, 7, "Meniul optiunilor disponibile:", 1, 17, 17, 50),
	  %cursor(+Input:stream, +muta:integer) - muta caracterele inainte( pentru valori +) sau inapoi (pentru valori -).
	  cursor(0, 0), write(" 0. Iesire din aplicatie"), nl,
	  cursor(1, 0), write(" 1. Adaugarea datelor personale"), nl,
	  cursor(2, 0), write(" 2. Stergerea datelor personale"), nl,
	  cursor(3, 0), write(" 3. Afisarea datelor personale"), nl,
	  cursor(4, 0), write(" 4. Adaugarea datelor unui cunoscut"), nl,
	  cursor(5, 0), write(" 5. Stergerea datelor unui cunoscut"), nl,
	  cursor(6, 0), write(" 6. Afisarea datelor unui cunoscut"), nl,
	  cursor(7, 0), write(" 7. Adaugarea unei activitati"), nl,
	  cursor(8, 0), write(" 8. Stergerea unei activitati"), nl,
	  cursor(9, 0), write(" 9. Afisarea activitatilor"), nl,
      cursor(10, 0), write("Selectati o optiune: "),
	  readln(Opt),
	validareopt(Opt).
	
	%tratarea exceptiilor pentru preluarea optiunii
    preluareopt(Opt):-
   	  clearwindow,
	  cursor(0, 0), write("Invalid! Apasati o tasta pentru revenire"),
	  readchar(_),
	preluareopt(Opt).
	
	
    validareopt(Opt):-
      Opt = "0";
	  Opt = "1";
	  Opt = "2";
	  Opt = "3";
	  Opt = "4";
	  Opt = "5";
	  Opt = "6";
	  Opt = "7";
	  Opt = "8";
	  Opt = "9";
	  Opt = "10".
	
	%cazul pentru iesirea din aplicatie
    executaopt("0"):-
	 exit.
	
    executaopt("1"):-
	  makewindow(2,6,7,"Adaugarea datelor personale",1,15,15,50),
	  cursor(0,0),write("Obs! Datele actuale se vor pierde. Continuati? (Y/N)"),
	  readchar(Opt),
	  Opt='Y',
	  clearwindow,
	  elimdatepers,
	  savedatepers,
	  adaugdatepers,
	  savedatepers,
	removewindow.
	
    executaopt("1"):-
	removewindow.
	
    executaopt("2"):-
	  makewindow(3, 6, 7, "Stergerea datelor personale", 1, 15, 15, 50),
	  elimdatepers,
	  savedatepers,
	removewindow.
	
    executaopt("3"):-
	  makewindow(4, 6, 7, "Afisarea datelor personale", 1, 15, 15, 50),
	  afisdatepers,
	  readchar(_),
	removewindow.
	
    executaopt("4"):-
	  makewindow(5, 6, 7, "Adaugarea datelor unui cunoscut", 1, 15, 15, 50),
	  adaugdatecunoscut,
	  savedatecunoscut,
	removewindow.
	
    executaopt("5"):-
	  makewindow(6, 6, 7, "Stergerea datelor unui cunoscut", 1, 15, 15, 50),
	  elimdatecunoscut,
	  savedatecunoscut,
	removewindow.
	
    executaopt("6"):-
	  makewindow(7, 6, 7, "Afisarea datelor unui cunoscut", 1, 15, 15, 50),
	  afisdatecunoscut,
	  readchar(_),
	removewindow.
	
    executaopt("7"):-
	  makewindow(8, 6, 7, "Adaugarea unei activitati", 1, 15, 15, 50),
	  adaugdateactiv,
	  savedateactiv,
	removewindow.
	
    executaopt("8"):-
	  makewindow(9, 6, 7, "Stergerea unei activitati", 1, 15, 15, 50),
	  elimdateactiv,
	  savedateactiv,
	removewindow.
	
    executaopt("9"):-
	  makewindow(10, 6, 7, "Afisarea activitatilor", 1, 15, 15, 50),
	  afisdateactiv,
	  readchar(_),
	removewindow.
	
	
	
	citirezi(Zi):-
	readint(Zi).
	
    citirezi(Zi):-
	  clearwindow,
	  cursor(0, 0), write("Incorect! Scrieti o zi valida:"),
	  readchar(_),
	  clearwindow,
	  cursor(0, 0), write("Zi nastere:"),
	citirezi(Zi).
	
    citireluna(Luna):-
	readint(Luna).
	
    citireluna(Luna):-
	  clearwindow,
	  cursor(0, 0), write("Invalid! Scrieti o luna valida."),
	  readchar(_),
	  clearwindow,
	  cursor(0, 0), write("Luna nastere: "),
	citireluna(Luna).
	
    citirean(An):-
	readint(An).
	
    citirean(An):-
	  clearwindow,
	  cursor(0, 0), write("Invalid! Scrieti un an valid."),
	  readchar(_),
	  clearwindow,
	  cursor(0, 0), write("An nastere: "),
	citirean(An).
	
	adaugdatepers:-
	  write("Numar telefon: "), readln(Telefon),
	  write("Nume: "), readln(Nume),
	  write("Data nasterii: "), nl,
	  write("Zi: "), citirezi(Zi),
	  write("Luna: "), citireluna(Luna),
	  write("An: "), citirean(An),
	  assert(proprietar(datepers(Nume, Telefon,datanastere(ZI, Luna, AN)))),
	savedatepers.

    elimdatepers:-
	retractall(proprietar(datepers(_,_,datanastere(_,_,_)))).

    savedatepers:-
	save("datePersonale.txt", proprietar).
	
    afisdatepers:-
	  proprietar(datepers(Nume, Telefon, datanastere(Zi, Luna, An))),
	  write("Nume: ",Nume), nl,
	  write("Telefon: ",Telefon), nl,
	  write("Data nasterii: ",Zi,".",Luna,".",An), nl,
	  fail.
    afisdatepers.
	
    adaugdatecunoscut:-
	  write("Nume: "), readln(Nume),
	  write("Numar telefon: "), readln(Telefon),
	  write("Data nasterii: "), nl,
	  write("Zi: "), citirezi(Zi),
	  write("Luna: "), citireluna(Luna),
	  write("An: "), citirean(An),
	  assert(cunoscut(datepers(Nume, Telefon,datanastere(Zi, Luna, An)))),
    savedatecunoscut.
   
    elimdatecunoscut:-
	retractall(cunoscut(datepers(_,_,datanastere(_,_,_)))).

    savedatecunoscut:-
	save("dateCunoscut.txt", cunoscut).
	
    afisdatecunoscut:-
	  cunoscut(datepers(Nume, Telefon, datanastere(Zi, Luna, An))),
	  write("Nume: ",Nume), nl,
	  write("Telefon: ",Telefon), nl,
	  write("Data nasterii: ",Zi,".",Luna,".",An), nl,
	  fail.
    afisdatecunoscut.
	
    adaugdateactiv:-
	  write("Activitate: "), readln(Activitate),
	  assert(activitate(dateagenda(Activitate))),
	savedateactiv.
	
    elimdateactiv:-
	retractall(activitate(dateagenda(_))).
	
    afisdateactiv:-
	  activitate(dateagenda(Activitate)),
	  write(Activitate), nl,
	  fail.
    afisdateactiv.
	
    savedateactiv:-
	save("dateActivitate.txt", activitate).
	
    run:-
          consult("datecunoscut.txt",cunoscut),
	  preluareopt(Opt),
	  executaopt(Opt),
	run.
	
 goal
	run.
%personaje(Personaje).
personaje(campanita).
personaje(magoDeOz).
personaje(cavenaghi).
personaje(conejoDePascua).
personaje(reyesMagos).
personaje(magoCapria).

%creeEn(persona,CreeEn).
creeEn(gabriel,campanita).
creeEn(gabriel,magoDeOz).
creeEn(gabriel,cavenaghi).
creeEn(juan,conejoDePascua).
creeEn(macarena,reyesMagos).
creeEn(macarena,magoCapria).
creeEn(macarena,campanita).
%diego no cree en nadie asi que no lo pongo para que de falso por universo cerrado.

%suenio(Persona,tipoDeSuenio).
%ganarLoteria([NumerosApostados]).
%futbolistaEn(Equipo).
%cantante(DiscosVendidos).

suenio(gabriel,ganarLoteria([5,9])).
suenio(gabriel,futbolistaEn(arsenal)).
suenio(juan,cantante(100000)).
suenio(macarena,cantante(10000)).
%el de ganar la loteria no va porque no la quiere ganar.

/*
Los conceptos que entraron en juego son el de universo cerrado, ya que los predicados que no esten declarados en la base de datos
va a ser siempre falsos. Ejemplo diego que no cree en nadie, si yo pergunto en quien cree diego o que suenios tiene diego va a 
devolver false. 
El otro concepto que entro en juego en este punto es el de polimorfismo ya que me permite tratar de distinta forma a los predicados
de creeEn y suenio y de esta forma tener todos los suenios de una persona y en quien cree dicha persona.
*/

%equipo(Equipo,Tamanio).
equipo(arsenal,chico).
equipo(aldosivi,chico).

esAmbicioso(Persona):-
    suenio(Persona,_),
    findall(Dificultad,(suenio(Persona,Suenio),dificultadSuenio(Suenio,Dificultad)),ListaDificultades),
    sumlist(ListaDificultades,DificultadTotal),    
    DificultadTotal > 20.

dificultadSuenio(cantante(DiscosVendidos),Dificultad):-
    DiscosVendidos > 500000,
    Dificultad is 6.

dificultadSuenio(cantante(DiscosVendidos),Dificultad):-
    DiscosVendidos =< 500000,
    Dificultad is 4.

dificultadSuenio(ganarLoteria(ListaDeNumerosApostados),Dificultad):-
    length(ListaDeNumerosApostados,CantidadDeNumerosApostados),
    Dificultad is (10 * CantidadDeNumerosApostados).

dificultadSuenio(futbolistaEn(Equipo),Dificultad):-
    equipo(Equipo,chico),
    Dificultad is 3.

dificultadSuenio(futbolistaEn(Equipo),Dificultad):-
    equipo(Equipo,grande),
    Dificultad is 16.

 
tienenQuimica(Personaje,Persona):-
    creeEn(Persona,Personaje),
    criterioPersonaje(Personaje,Persona).

criterioPersonaje(campanita,Persona):-
    suenio(Persona,Suenio),
    dificultadSuenio(Suenio,Dificultad),
    Dificultad < 5. % tiene al menos 1 de dificultad menor a 5

criterioPersonaje(Personaje,Persona):-
    personaje(Personaje), % me aseguro que sea un personaje
    suenio(Persona,Suenio),
    esSuenioPuro(Suenio),
    not(esAmbicioso(Persona)).

esSuenioPuro(futbolistaEn(_)).

esSuenioPuro(cantante(DiscosVendidos)):-
    DiscosVendidos =< 200000.


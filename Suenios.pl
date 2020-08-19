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
%ganarLoteria(N1,N2).
%futbolistaEn(Equipo).
%cantante(DiscosVendidos).

suenio(gabriel,ganarLoteria(5,9)).
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


% PUNTO 1
%vive(Persona, casa(Metros)).
%vive(Persona, depto(Ambientes, Banios)).
%vive(Persona, loft(AnioConstruccion)).
vive(juan, casa(120)).
vive(nico, depto(3, 2)).
vive(alf, depto(3, 1)).
vive(julian, loft(2000)).
vive(vale, depto(4, 1)).
vive(fer, casa(110)).

barrio(alf, almagro).
barrio(juan, almagro).
barrio(nico, almagro).
barrio(julian, almagro).
barrio(vale, flores).
barrio(fer, flores).

% PUNTO 2
% todas las personas de un barrio, viven en propiedades copadas
barrioCopado(Barrio):-
    barrio(_, Barrio),
    forall(barrio(Persona, Barrio), (vive(Persona, Propiedad), propiedadCopada(Propiedad))).
    
propiedadCopada(casa(Metros)):- Metros > 100.
propiedadCopada(depto(Ambientes, _)):- Ambientes > 3.
propiedadCopada(depto(_, Banio)):- Banio > 1.
propiedadCopada(loft(Anio)):- Anio > 2015.

% PUNTO 3
% no existe una propiedad en este barrio que sea barata
barrioCaro(Barrio):-
    barrio(_, Barrio),
    not(((barrio(Persona, Barrio), vive(Persona, Propiedad)), propiedadBarata(Propiedad))).

propiedadBarata(loft(Anio)):- Anio < 2005.
propiedadBarata(casa(Metros)):- Metros < 90.
propiedadBarata(depto(Ambientes, _)):- between(1, 2, Ambientes).

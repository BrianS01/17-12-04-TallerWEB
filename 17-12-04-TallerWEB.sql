/*
 *  Taller WEB
 *   co-Author :::   Juan Albarracin
 *   co-Author :::  Mario BolaÃƒÂ±os
 *   co-Author ::: Sergio Orozco
 *   co-Author :::  Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
 */
 
drop database if exists basestallerIIIWEB;
create database basestallerIIIWEB;
use basestallerIIIWEB;

 create table application
(
	idApplication int,
    nombre varchar(45),
    descripcion varchar(45),
	idSchema int,
    primary key(idCol),
    foreign key(idColMadre) references colmena(idCol),
    foreign key(idApiario) references apiario(idApiario)
);

/*
 *  Taller WEB
 *   co-Author :::   Juan Albarracin
 *   co-Author :::  Mario Bolanos
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
	idSchemaTable int,
    idViewContainer int,
    primary key(idApplication),
    foreign key(idSchemaTable) references SchemaTable(idSchemaTable),
    foreign key(idViewContainer) references ViewContainer(idViewContainer)
)ENGINE=MyISAM;


create table schematable
(
	idSchemaTable int,
    nombre varchar(45),
    idTableTable int,
    primary key(idSchemaTable),
    foreign key(idTableTable) references TableTable(idTableTable)
)ENGINE=MyISAM;


create table tabletable
(
	idTableTable int,
    nombre varchar(45),
    idForeignKeyTable int,
    primary key(idTableTable),
    foreign key(idForeignKeyTable) references ForeignKeyTable(idForeignKeyTable)
)ENGINE=MyISAM;


create table foreignkeytable
(
	idForeignKeyTable int,
    nombre boolean,
    primary key(idForeignKeyTable)
)ENGINE=MyISAM;


create table viewcontainer
(
	idViewContainer int,
    isLandMark boolean,
    isDefault boolean,
    isXOR boolean,
    protect boolean,
    idSimpleField int,
    idSelectionField int,
    idInteractionFlow int,
    primary key(idViewContainer),
    foreign key(idSimpleField) references SimpleField(idSimpleField),
    foreign key(idSelectionField) references SelectionField(idSelectionField),
    foreign key(idInteractionFlow) references InteractionFlow(idInteractionFlow)
)ENGINE=MyISAM;


create table SimpleField
(
	idSimpleField int,
    editionMask varchar(45),
    defaultValue varchar(45),
    validationMessage varchar(45),
    primary key(idSimpleField)
)ENGINE=MyISAM;


create table SelectionField
(
	idSelectionField int,
    isMultiSelection boolean,
    primary key(idSelectionField)
)ENGINE=MyISAM;


create table ParameterBinding
(
	idParameterBinding int,
    primary key(idParameterBinding)
)ENGINE=MyISAM;


create table ParameterBindingGroup
(
	idParameterBindingGroup int,
    idParameterBinding int,
    primary key(idParameterBindingGroup),
    foreign key(idParameterBinding) references ParameterBinding(idParameterBinding)
)ENGINE=MyISAM;


create table InteractionFlow
(
	idInteractionFlow int,
    nombre varchar(45),
    typeEvent varchar(45),
    idParameterBindingGroup int,
    primary key(idInteractionFlow),
    foreign key(idParameterBindingGroup) references ParameterBindingGroup(idParameterBindingGroup)
)ENGINE=MyISAM;
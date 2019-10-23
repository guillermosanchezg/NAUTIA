-- Carga del primer juego de datos

LOAD DATA INFILE 'C:/AGBD/PRAC1_AGBD201819/CARGA/datos/juegodatos1/Personas500.txt'
INTO TABLE Personas 
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
 (PersonaID,DNI,Nombre,Apellidos,Genero,Direccion,Localidad,Provincia,CodigoPostal,
  Telefono,Altura,Peso,UsaGafas,TipoPermiso,@fNac)
 SET FechaNac = STR_TO_DATE(@fNac, '%d/%m/%Y') ;
 

LOAD DATA INFILE 'C:/AGBD/PRAC1_AGBD201819/CARGA/datos/juegodatos1/Vehiculos500.txt'
INTO TABLE Vehiculos 
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/AGBD/PRAC1_AGBD201819/CARGA/datos/juegodatos1/Propietarios500.txt'
INTO TABLE Propietarios 
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
 (VehiculoID,PropietarioID,@fcompra)
 SET FechaCompra = STR_TO_DATE(@fcompra, '%Y-%m-%d');
 
LOAD DATA INFILE 'C:/AGBD/PRAC1_AGBD201819/CARGA/datos/juegodatos1/Sanciones500.txt'
INTO TABLE Sanciones 
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
	(VehiculoID,ConductorID,Calificacion,Lugar,Mes,Anio,@vImporte,Descuento,Puntos,
	Denunciante,Hecho,@vVelocidadLimite,@vVelolicidadCircula)
SET Importe = REPLACE(@vImporte, ',', '.'),
	VelocidadLimite = if(@vVelocidadLimite='',null,@vVelocidadLimite),
	VelocidadCircula = if(@vVelocidadCircula='',null,@vVelocidadCircula)  
;


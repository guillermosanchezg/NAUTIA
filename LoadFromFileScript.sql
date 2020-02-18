LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/community.csv'
INTO TABLE community 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
 (Name);
 
SELECT * FROM community;

SELECT * FROM camp;
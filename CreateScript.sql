-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema nautiatoolkit
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `nautiatoolkit` ;

-- -----------------------------------------------------
-- Schema nautiatoolkit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nautiatoolkit` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema nautiatoolkit
-- -----------------------------------------------------
USE `nautiatoolkit` ;

-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Community` (
  `idCommunity` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idCommunity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp` (
  `idCamp` INT NOT NULL AUTO_INCREMENT,
  `StabilisationDate` VARCHAR(45) NULL,
  `MigrationRate` INT NULL,
  `EnviromentValeuArea` VARCHAR(45) NULL,
  `DeforestedArea` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idCamp`),
  CONSTRAINT `fk_Camp_Community`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_Community_idx` ON `nautiatoolkit`.`Camp` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Country` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Country` (
  `idCountry` INT NOT NULL AUTO_INCREMENT,
  `CountryName` VARCHAR(45) NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`HostCommunity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`HostCommunity` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`HostCommunity` (
  `idHostCommunity` INT NOT NULL AUTO_INCREMENT,
  `Community_idCommunity` INT NOT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idHostCommunity`, `Country_idCountry`),
  CONSTRAINT `fk_HostCommunity_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HostCommunity_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_HostCommunity_Community1_idx` ON `nautiatoolkit`.`HostCommunity` (`Community_idCommunity` ASC);

CREATE INDEX `fk_HostCommunity_Country1_idx` ON `nautiatoolkit`.`HostCommunity` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_Demography`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_Demography` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_Demography` (
  `idGD_Demography` INT NOT NULL AUTO_INCREMENT,
  `Female_LT_5` FLOAT NULL,
  `Male_LT_5` FLOAT NULL,
  `Female_BT_5_17` FLOAT NULL,
  `Male_BT_5_17` FLOAT NULL,
  `Female_BT_18_59` FLOAT NULL,
  `Male_BT_18_59` FLOAT NULL,
  `Female_GT_59` FLOAT NULL,
  `Male_GT_59` FLOAT NULL,
  `GrowthRate` FLOAT NULL,
  `RefugeePopulation` FLOAT NULL,
  `IDH` FLOAT NULL,
  `LifeExpectancy` FLOAT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_Demography`, `Country_idCountry`),
  CONSTRAINT `fk_General_Demography_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_General_Demography_Country1_idx` ON `nautiatoolkit`.`GD_Demography` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_Economy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_Economy` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_Economy` (
  `idGD_Economy` INT NOT NULL AUTO_INCREMENT,
  `Farming` FLOAT NULL,
  `CattelRaising` FLOAT NULL,
  `Industry` FLOAT NULL,
  `ServiceSector` FLOAT NULL,
  `PovertyPopulation` FLOAT NULL,
  `GINI` FLOAT NULL,
  `GDPPerCapita` FLOAT NULL,
  `PovertyLine` FLOAT NULL,
  `LocalCoin` VARCHAR(45) NULL,
  `ExchangeRate` FLOAT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_Economy`, `Country_idCountry`),
  CONSTRAINT `fk_GD_Economy_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GD_Economy_Country1_idx` ON `nautiatoolkit`.`GD_Economy` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_Government`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_Government` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_Government` (
  `idGD_Govermment` INT NOT NULL AUTO_INCREMENT,
  `RegimeType` VARCHAR(45) NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_Govermment`, `Country_idCountry`),
  CONSTRAINT `fk_GD_Government_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GD_Government_Country1_idx` ON `nautiatoolkit`.`GD_Government` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_Urbanism`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_Urbanism` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_Urbanism` (
  `idGD_Urbanism` INT NOT NULL AUTO_INCREMENT,
  `UrbanPopulation` FLOAT NULL,
  `RuralPopulation` FLOAT NULL,
  `UrbanDensity` FLOAT NULL,
  `RuralDensity` FLOAT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_Urbanism`, `Country_idCountry`),
  CONSTRAINT `fk_GD_Urbanism_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GD_Urbanism_Country1_idx` ON `nautiatoolkit`.`GD_Urbanism` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_Infrastructure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_Infrastructure` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_Infrastructure` (
  `idGD_Infrastructure` INT NOT NULL AUTO_INCREMENT,
  `RuralWaterAccess` FLOAT NULL,
  `UrbanWaterAccess` FLOAT NULL,
  `RuralSanitationAccess` FLOAT NULL,
  `UrbanSanitationAccess` FLOAT NULL,
  `RuralElectricityAccess` FLOAT NULL,
  `UrbanElectricityAccess` FLOAT NULL,
  `NationalElectricityTariff` FLOAT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_Infrastructure`, `Country_idCountry`),
  CONSTRAINT `fk_GD_Infrastructure_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GD_Infrastructure_Country1_idx` ON `nautiatoolkit`.`GD_Infrastructure` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_ServiceAccess`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_ServiceAccess` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_ServiceAccess` (
  `idGD_ServiceAccess` INT NOT NULL AUTO_INCREMENT,
  `IlliteracyRate` FLOAT NULL,
  `InternetAccessRate` FLOAT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_ServiceAccess`, `Country_idCountry`),
  CONSTRAINT `fk_GD_ServiceAccess_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GD_ServiceAccess_Country1_idx` ON `nautiatoolkit`.`GD_ServiceAccess` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_Shelter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_Shelter` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_Shelter` (
  `idGD_Shelter` INT NOT NULL AUTO_INCREMENT,
  `PeopleInSlum` FLOAT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_Shelter`, `Country_idCountry`),
  CONSTRAINT `fk_Shelter_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Shelter_Country1_idx` ON `nautiatoolkit`.`GD_Shelter` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_Integration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_Integration` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_Integration` (
  `idCamp_Integration` INT NOT NULL AUTO_INCREMENT,
  `RelationshipCause` VARCHAR(45) NULL,
  PRIMARY KEY (`idCamp_Integration`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_MovementReason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_MovementReason` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_MovementReason` (
  `idCamp_MovementReason` INT NOT NULL AUTO_INCREMENT,
  `Reason` VARCHAR(45) NULL,
  PRIMARY KEY (`idCamp_MovementReason`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_NaturalHazard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_NaturalHazard` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_NaturalHazard` (
  `idCamp_NaturalHazard` INT NOT NULL AUTO_INCREMENT,
  `HazardType` VARCHAR(45) NULL,
  PRIMARY KEY (`idCamp_NaturalHazard`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_EnergySource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_EnergySource` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_EnergySource` (
  `idCamp_EnergySource` INT NOT NULL AUTO_INCREMENT,
  `Source` VARCHAR(45) NULL,
  PRIMARY KEY (`idCamp_EnergySource`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_LocalVEgetation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_LocalVEgetation` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_LocalVEgetation` (
  `idCamp_LocalVEgetation` INT NOT NULL AUTO_INCREMENT,
  `Species` VARCHAR(45) NULL,
  PRIMARY KEY (`idCamp_LocalVEgetation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_LocalCrop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_LocalCrop` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_LocalCrop` (
  `idCamp_LocalCrop` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idCamp_LocalCrop`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_ClimaticRegion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_ClimaticRegion` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_ClimaticRegion` (
  `idCamp_ClimaticRegion` INT NOT NULL AUTO_INCREMENT,
  `Region` VARCHAR(45) NULL,
  `MaxTemp` INT NULL,
  `MinTemp` INT NULL,
  `AVGTemp` FLOAT NULL,
  `RelativeHumidity` FLOAT NULL,
  `MaxRainfall` INT NULL,
  `MinRainfall` INT NULL,
  `Irradiance` FLOAT NULL,
  `WindSpeed` INT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`idCamp_ClimaticRegion`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_ClimaticRegion_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_ClimaticRegion_Camp1_idx` ON `nautiatoolkit`.`Camp_ClimaticRegion` (`Camp_idCamp` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_Mobility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_Mobility` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_Mobility` (
  `idCamp_Mobility` INT NOT NULL AUTO_INCREMENT,
  `ConstentOutCamp` VARCHAR(45) NULL,
  `MaxDistance` INT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`idCamp_Mobility`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_Mobility_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_Mobility_Camp1_idx` ON `nautiatoolkit`.`Camp_Mobility` (`Camp_idCamp` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_Shelter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_Shelter` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_Shelter` (
  `idCamp_Shelter` INT NOT NULL AUTO_INCREMENT,
  `UpgradingPosibility` VARCHAR(45) NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`idCamp_Shelter`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_Shelter_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_Shelter_Camp1_idx` ON `nautiatoolkit`.`Camp_Shelter` (`Camp_idCamp` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_Population`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_Population` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_Population` (
  `idSE_Population` INT NOT NULL AUTO_INCREMENT,
  `LT_5` INT NULL,
  `BT_5_17` INT NULL,
  `BT_18_59` INT NULL,
  `GT_59` INT NULL,
  `DiferentAbilitiesPeople` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSE_Population`, `Community_idCommunity`),
  CONSTRAINT `fk_SC_Population_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SC_Population_Community1_idx` ON `nautiatoolkit`.`SE_Population` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_HouseHoldComposition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_HouseHoldComposition` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_HouseHoldComposition` (
  `idSE_HouseHoldComposition` INT NOT NULL AUTO_INCREMENT,
  `Women` FLOAT NULL,
  `Men` FLOAT NULL,
  `Teenagers` FLOAT NULL,
  `Kids` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSE_HouseHoldComposition`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_HouseHoldComposition_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_HouseHoldComposition_Community1_idx` ON `nautiatoolkit`.`SE_HouseHoldComposition` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_CleaningMAterial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_CleaningMAterial` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_CleaningMAterial` (
  `idSE_CleaningMAterial` INT NOT NULL AUTO_INCREMENT,
  `Material` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_CleaningMAterial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_ConflictArea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_ConflictArea` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_ConflictArea` (
  `idEonflictArea` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idEonflictArea`, `Community_idCommunity`),
  CONSTRAINT `fk_SC_ConflictArea_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SC_ConflictArea_Community1_idx` ON `nautiatoolkit`.`SE_ConflictArea` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_ExpenseType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_ExpenseType` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_ExpenseType` (
  `idSE_ExpenseType` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_ExpenseType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_GenderData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_GenderData` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_GenderData` (
  `idSE_GenderData` INT NOT NULL AUTO_INCREMENT,
  `LeadingWomen` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSE_GenderData`, `Community_idCommunity`),
  CONSTRAINT `fk_SC_GenderData_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SC_GenderData_Community1_idx` ON `nautiatoolkit`.`SE_GenderData` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`G_PoliticalActor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`G_PoliticalActor` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`G_PoliticalActor` (
  `idG_PoliticalActor` INT NOT NULL AUTO_INCREMENT,
  `ActorName` VARCHAR(45) NULL,
  `ActorType` VARCHAR(45) NULL,
  PRIMARY KEY (`idG_PoliticalActor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FA_Topography`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FA_Topography` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FA_Topography` (
  `idFA_Topography` INT NOT NULL AUTO_INCREMENT,
  `UpperBound` INT NULL,
  `LowerBound` INT NULL,
  `Slope` INT NULL,
  `PhreaticSlope` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFA_Topography`, `Community_idCommunity`),
  CONSTRAINT `fk_Topography_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Topography_Community1_idx` ON `nautiatoolkit`.`FA_Topography` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FA_NaturalResource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FA_NaturalResource` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FA_NaturalResource` (
  `idFA_NaturalResource` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  `Bound` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFA_NaturalResource`, `Community_idCommunity`),
  CONSTRAINT `fk_FA_NaturalResource_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FA_NaturalResource_Community1_idx` ON `nautiatoolkit`.`FA_NaturalResource` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`U_Urbanism`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`U_Urbanism` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`U_Urbanism` (
  `idU_Urbanism` INT NOT NULL AUTO_INCREMENT,
  `UrbanPlan` VARCHAR(45) NULL,
  `UrbanPlanDuratrion` INT NULL,
  `CampLimits` VARCHAR(45) NULL,
  `LandManagement` VARCHAR(45) NULL,
  `PlannedGrowth` VARCHAR(45) NULL,
  `GrowthForecast` INT NULL,
  `UrbanPlanRiskInstruments` VARCHAR(45) NULL,
  `Storm_Tornado` VARCHAR(45) NULL,
  `Earthquakes` VARCHAR(45) NULL,
  `Flood` VARCHAR(45) NULL,
  `AVG_PlotArea` INT NULL,
  `PlotDelimitation` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idU_Urbanism`, `Community_idCommunity`),
  CONSTRAINT `fk_U_Urbanism_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_U_Urbanism_Community1_idx` ON `nautiatoolkit`.`U_Urbanism` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`U_PublicSpace`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`U_PublicSpace` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`U_PublicSpace` (
  `idU_PublicSpace` INT NOT NULL AUTO_INCREMENT,
  `TotalArea` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idU_PublicSpace`, `Community_idCommunity`),
  CONSTRAINT `fk_U_PublicSpace_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_U_PublicSpace_Community1_idx` ON `nautiatoolkit`.`U_PublicSpace` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`U_Area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`U_Area` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`U_Area` (
  `idU_Area` INT NOT NULL AUTO_INCREMENT,
  `AreaType` VARCHAR(45) NULL,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idU_Area`, `Community_idCommunity`),
  CONSTRAINT `fk_U_FloodingArea_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_U_FloodingArea_Community1_idx` ON `nautiatoolkit`.`U_Area` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`U_RecreationalArea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`U_RecreationalArea` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`U_RecreationalArea` (
  `idRecreationalArea` INT NOT NULL AUTO_INCREMENT,
  `AreaName` VARCHAR(45) NULL,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Woodland_ShadedArea` TINYINT(1) NULL,
  `UrbanFurniture` TINYINT(1) NULL,
  `Floor_DrainageSystem` TINYINT(1) NULL,
  `PSTrush` TINYINT(1) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idRecreationalArea`, `Community_idCommunity`),
  CONSTRAINT `fk_U_RecreationalArea_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_U_RecreationalArea_Community1_idx` ON `nautiatoolkit`.`U_RecreationalArea` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`U_Road`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`U_Road` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`U_Road` (
  `idU_Road` INT NOT NULL AUTO_INCREMENT,
  `RoadsLength` INT NULL,
  `DrainageSystem` VARCHAR(45) NULL,
  `Conditioning` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idU_Road`, `Community_idCommunity`),
  CONSTRAINT `fk_U_Road_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_U_Road_Community1_idx` ON `nautiatoolkit`.`U_Road` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_WaterInfrastructure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_WaterInfrastructure` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_WaterInfrastructure` (
  `idINF_WaterInfrastructure` INT NOT NULL AUTO_INCREMENT,
  `WaterQuality` VARCHAR(45) NULL,
  `ConsumptionPerCapita` FLOAT NULL,
  `SourceType` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_WaterInfrastructure`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_WaterInfrastructure_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_WaterInfrastructure_Community1_idx` ON `nautiatoolkit`.`INF_WaterInfrastructure` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_IrrigatonSystem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_IrrigatonSystem` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_IrrigatonSystem` (
  `idIrrigatonSystem` INT NOT NULL AUTO_INCREMENT,
  `Operating` VARCHAR(45) NULL,
  `WaterPumpPower` INT NULL,
  `EnergySource` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idIrrigatonSystem`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_IrrigatonSystem_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_IrrigatonSystem_Community1_idx` ON `nautiatoolkit`.`INF_IrrigatonSystem` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_PotabilizationSystem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_PotabilizationSystem` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_PotabilizationSystem` (
  `idINF_PotabilizationSystem` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idINF_PotabilizationSystem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_WasteManagementgInfrastructure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_WasteManagementgInfrastructure` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_WasteManagementgInfrastructure` (
  `idINF_WasteManagementgInfrastructure` INT NOT NULL AUTO_INCREMENT,
  `CollectionServicePerMonth` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_WasteManagementgInfrastructure`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_WasteManagementgInfrastructure_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_WasteManagementgInfrastructure_Community1_idx` ON `nautiatoolkit`.`INF_WasteManagementgInfrastructure` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_Landfill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_Landfill` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_Landfill` (
  `idINF_Landfill` INT NOT NULL AUTO_INCREMENT,
  `DistanceToHouses` INT NULL,
  `DistanceToWaterResource` INT NULL,
  `FertilEnviromentLocation` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_Landfill`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_Landfill_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_Landfill_Community1_idx` ON `nautiatoolkit`.`INF_Landfill` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_EnergyInfrastructure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_EnergyInfrastructure` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_EnergyInfrastructure` (
  `idINF_EnergyInfrastructure` INT NOT NULL AUTO_INCREMENT,
  `ElectricServiceByElectricityGrid` VARCHAR(45) NULL,
  `MediumVoltage` INT NULL,
  `DistributionGridVoltage` INT NULL,
  `ExpandPlan` VARCHAR(45) NULL,
  `BlackoutElectricityPerDay` INT NULL,
  `CurveOfDemand` VARCHAR(45) NULL,
  `DistanceToElectricityGrid` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_EnergyInfrastructure`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_EnergyInfrastructure_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_EnergyInfrastructure_Community1_idx` ON `nautiatoolkit`.`INF_EnergyInfrastructure` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_GenerationSource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_GenerationSource` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_GenerationSource` (
  `idINF_GenerationSource` INT NOT NULL AUTO_INCREMENT,
  `Source` VARCHAR(45) NULL,
  PRIMARY KEY (`idINF_GenerationSource`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_GenerationSystem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_GenerationSystem` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_GenerationSystem` (
  `idINF_GenerationSystem` INT NOT NULL AUTO_INCREMENT,
  `Sector` VARCHAR(45) NULL,
  `SystemType` VARCHAR(45) NULL,
  `Capacity` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_GenerationSystem`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_GenerationSystem_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_GenerationSystem_Community1_idx` ON `nautiatoolkit`.`INF_GenerationSystem` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_Appliance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_Appliance` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_Appliance` (
  `idINF_Appliance` INT NOT NULL AUTO_INCREMENT,
  `ApplianceType` VARCHAR(45) NULL,
  PRIMARY KEY (`idINF_Appliance`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_ExpandPlanBeneficiaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_ExpandPlanBeneficiaries` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_ExpandPlanBeneficiaries` (
  `idINF_ExpandPlanBeneficiaries` INT NOT NULL AUTO_INCREMENT,
  `Beneficiary` VARCHAR(45) NULL,
  PRIMARY KEY (`idINF_ExpandPlanBeneficiaries`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_Kitchen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_Kitchen` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_Kitchen` (
  `idINF_Kitchen` INT NOT NULL AUTO_INCREMENT,
  `MainKitchenType` VARCHAR(45) NULL,
  `MainFuel` VARCHAR(45) NULL,
  `FirewoodConsumption` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_Kitchen`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_Kitchen_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_Kitchen_Community1_idx` ON `nautiatoolkit`.`INF_Kitchen` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_CookWoman`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_CookWoman` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_CookWoman` (
  `idINF_CookWoman` INT NOT NULL AUTO_INCREMENT COMMENT '2',
  `CookingPlace` VARCHAR(45) NULL,
  `CookingHours` FLOAT NULL,
  `WeeklyFirewood` INT NULL,
  `FirewoodHours` INT NULL,
  `HealthFirewood` TINYINT(1) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_CookWoman`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_CookWoman_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_CookWoman_Community1_idx` ON `nautiatoolkit`.`INF_CookWoman` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_PublicLighting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_PublicLighting` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_PublicLighting` (
  `idINF_PublicLighting` INT NOT NULL AUTO_INCREMENT,
  `StreetLightWorking` VARCHAR(45) NULL,
  `LightPointsDistance` FLOAT NULL,
  `InfluenceInWomensSafety` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_PublicLighting`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_PublicLighting_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_PublicLighting_Community1_idx` ON `nautiatoolkit`.`INF_PublicLighting` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_StreetLamp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_StreetLamp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_StreetLamp` (
  `idINF_StreetLamp` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_StreetLamp`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_StreetLamp_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_StreetLamp_Community1_idx` ON `nautiatoolkit`.`INF_StreetLamp` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_MobilityInfrastructure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_MobilityInfrastructure` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_MobilityInfrastructure` (
  `idINF_MobilityInfrastructure` INT NOT NULL AUTO_INCREMENT,
  `DistanceToWorkstation` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_MobilityInfrastructure`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_MobilityInfrastructure_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_MobilityInfrastructure_Community1_idx` ON `nautiatoolkit`.`INF_MobilityInfrastructure` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_MobilityWay`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_MobilityWay` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_MobilityWay` (
  `idINF_ExternalMobility` INT NOT NULL AUTO_INCREMENT,
  `Way` VARCHAR(45) NULL,
  PRIMARY KEY (`idINF_ExternalMobility`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_MobillityPoint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_MobillityPoint` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_MobillityPoint` (
  `idINF_MobillityPoint` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_MobillityPoint`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_MobillityPoint_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_MobillityPoint_Community1_idx` ON `nautiatoolkit`.`INF_MobillityPoint` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_BuildingQuality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_BuildingQuality` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_BuildingQuality` (
  `idS_BuildingQuality` INT NOT NULL AUTO_INCREMENT,
  `NoFiltrationRoof` TINYINT(1) NULL,
  `SecureStructured` TINYINT(1) NULL,
  `ThermalConfort` TINYINT(1) NULL,
  `ClimaticHazard` TINYINT(1) NULL,
  PRIMARY KEY (`idS_BuildingQuality`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_EducationalCenter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_EducationalCenter` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_EducationalCenter` (
  `idS_EducationalCenter` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `NoAccessArea` FLOAT NULL,
  `EducationType` VARCHAR(45) NULL,
  `Students` INT NULL,
  `Workingpoints` INT NULL,
  `Teachers` INT NULL,
  `Material` VARCHAR(100) NULL,
  `MorningHoursStudy` FLOAT NULL,
  `EveningHoursStudy` FLOAT NULL,
  `NightHoursStudy` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  `S_BuildingQuality_idS_BuildingQuality` INT NOT NULL,
  PRIMARY KEY (`idS_EducationalCenter`, `Community_idCommunity`),
  CONSTRAINT `fk_S_EducationaCenter_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_EducationaCenter_S_BuildingQuality1`
    FOREIGN KEY (`S_BuildingQuality_idS_BuildingQuality`)
    REFERENCES `nautiatoolkit`.`S_BuildingQuality` (`idS_BuildingQuality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_EducationaCenter_Community1_idx` ON `nautiatoolkit`.`S_EducationalCenter` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_EducationaCenter_S_BuildingQuality1_idx` ON `nautiatoolkit`.`S_EducationalCenter` (`S_BuildingQuality_idS_BuildingQuality` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_NoEducationCause`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_NoEducationCause` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_NoEducationCause` (
  `idS_NoEducationCause` INT NOT NULL AUTO_INCREMENT,
  `Cause` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_NoEducationCause`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_Subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_Subject` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_Subject` (
  `idS_Subject` INT NOT NULL AUTO_INCREMENT,
  `Subject` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_Subject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_HealthCenterService`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_HealthCenterService` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_HealthCenterService` (
  `idS_HealthCenterService` INT NOT NULL AUTO_INCREMENT,
  `PrimaryAttention2kms` FLOAT NULL,
  `Hospital5kms` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idS_HealthCenterService`, `Community_idCommunity`),
  CONSTRAINT `fk_S_HealthCenterService_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_HealthCenterService_Community1_idx` ON `nautiatoolkit`.`S_HealthCenterService` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_PrimaryAttention`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_PrimaryAttention` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_PrimaryAttention` (
  `idS_PrimaryAttention` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `NoAccesArea` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  `S_BuildingQuality_idS_BuildingQuality` INT NOT NULL,
  PRIMARY KEY (`idS_PrimaryAttention`, `Community_idCommunity`),
  CONSTRAINT `fk_S_PrimaryAttention_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_PrimaryAttention_S_BuildingQuality1`
    FOREIGN KEY (`S_BuildingQuality_idS_BuildingQuality`)
    REFERENCES `nautiatoolkit`.`S_BuildingQuality` (`idS_BuildingQuality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_PrimaryAttention_Community1_idx` ON `nautiatoolkit`.`S_PrimaryAttention` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_PrimaryAttention_S_BuildingQuality1_idx` ON `nautiatoolkit`.`S_PrimaryAttention` (`S_BuildingQuality_idS_BuildingQuality` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_Hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_Hospital` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_Hospital` (
  `idS_Hospital` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `NoAccessArea` FLOAT NULL,
  `Beds` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  `S_BuildingQuality_idS_BuildingQuality` INT NOT NULL,
  PRIMARY KEY (`idS_Hospital`, `Community_idCommunity`),
  CONSTRAINT `fk_S_Hospital_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_Hospital_S_BuildingQuality1`
    FOREIGN KEY (`S_BuildingQuality_idS_BuildingQuality`)
    REFERENCES `nautiatoolkit`.`S_BuildingQuality` (`idS_BuildingQuality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_Hospital_Community1_idx` ON `nautiatoolkit`.`S_Hospital` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_Hospital_S_BuildingQuality1_idx` ON `nautiatoolkit`.`S_Hospital` (`S_BuildingQuality_idS_BuildingQuality` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_Cementery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_Cementery` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_Cementery` (
  `idS_Cementery` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `NoAccessArea` FLOAT NULL,
  `CorrectLocation` VARCHAR(45) NULL,
  `UpperBound` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idS_Cementery`, `Community_idCommunity`),
  CONSTRAINT `fk_S_Cementery_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_Cementery_Community1_idx` ON `nautiatoolkit`.`S_Cementery` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_OtherCenter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_OtherCenter` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_OtherCenter` (
  `idS_OtherCenter` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `NoAccessArea` FLOAT NULL,
  `CenterType` VARCHAR(45) NULL,
  `CenterName` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idS_OtherCenter`, `Community_idCommunity`),
  CONSTRAINT `fk_S_OtherCenter_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_OtherCenter_Community1_idx` ON `nautiatoolkit`.`S_OtherCenter` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_DataAccess`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_DataAccess` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_DataAccess` (
  `idS_DataAccess` INT NOT NULL AUTO_INCREMENT,
  `DataType` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_DataAccess`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_Tecknowlege`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_Tecknowlege` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_Tecknowlege` (
  `idS_Tecknowlege` INT NOT NULL AUTO_INCREMENT,
  `knowlegeType` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_Tecknowlege`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_HardwareAccesibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_HardwareAccesibility` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_HardwareAccesibility` (
  `idS_HardwareAccesibility` INT NOT NULL AUTO_INCREMENT,
  `HardWareType` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_HardwareAccesibility`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_ProgramingKnowlege`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_ProgramingKnowlege` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_ProgramingKnowlege` (
  `idS_ProgramingKnowlege` INT NOT NULL AUTO_INCREMENT,
  `Language` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_ProgramingKnowlege`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_App`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_App` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_App` (
  `idS_App` INT NOT NULL AUTO_INCREMENT,
  `App` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_App`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SH_Shelter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SH_Shelter` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SH_Shelter` (
  `idSH_Shelter` INT NOT NULL AUTO_INCREMENT,
  `TotalHouses` INT NULL,
  `ConstructionCost` FLOAT NULL,
  `ConstructionType` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSH_Shelter`, `Community_idCommunity`),
  CONSTRAINT `fk_SH_Shelter_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SH_Shelter_Community1_idx` ON `nautiatoolkit`.`SH_Shelter` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SH_House`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SH_House` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SH_House` (
  `idSH_House` INT NOT NULL AUTO_INCREMENT,
  `Rooms` INT NULL,
  `GasTight` TINYINT(1) NULL,
  `SecureStructured` TINYINT(1) NULL,
  `ClimateThreatProtect` TINYINT(1) NULL,
  `WindowsAllRooms` TINYINT(1) NULL,
  `NoHumidity` TINYINT(1) NULL,
  `NoAnimals` TINYINT(1) NULL,
  `LT30Dregrees` TINYINT(1) NULL,
  `PosibleUpgrading` TINYINT(1) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSH_House`, `Community_idCommunity`),
  CONSTRAINT `fk_SH_FamilyHouse_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_FoodSafety`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_FoodSafety` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_FoodSafety` (
  `idFS_FoodSafety` INT NOT NULL AUTO_INCREMENT,
  `Cause` VARCHAR(45) NULL,
  `KidsAffected` TINYINT(1) NULL,
  `WomenAffected` TINYINT(1) NULL,
  `MenAffected` TINYINT(1) NULL,
  `SeniorsAffected` TINYINT(1) NULL,
  `Ingtake` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_FoodSafety`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_FoodSafety_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_FoodSafety_Community1_idx` ON `nautiatoolkit`.`FS_FoodSafety` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_FoodAccess`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_FoodAccess` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_FoodAccess` (
  `idFS_FoodAccess` INT NOT NULL AUTO_INCREMENT,
  `FoodType` VARCHAR(45) NULL,
  PRIMARY KEY (`idFS_FoodAccess`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_DailyMeal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_DailyMeal` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_DailyMeal` (
  `idFS_DailyMeal` INT NOT NULL AUTO_INCREMENT,
  `TimesPerDay` INT NULL,
  `ImportantMeal` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_DailyMeal`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_DailyMeal_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_DailyMeal_Community1_idx` ON `nautiatoolkit`.`FS_DailyMeal` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_FoodSource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_FoodSource` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_FoodSource` (
  `idFS_FoodSource` INT NOT NULL AUTO_INCREMENT,
  `Source` VARCHAR(45) NULL,
  PRIMARY KEY (`idFS_FoodSource`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_TypicalPlate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_TypicalPlate` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_TypicalPlate` (
  `idFS_TypicalPlate` INT NOT NULL AUTO_INCREMENT,
  `Plate` VARCHAR(45) NULL,
  `Kcal` FLOAT NULL,
  PRIMARY KEY (`idFS_TypicalPlate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_FoodAccessContinuity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_FoodAccessContinuity` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_FoodAccessContinuity` (
  `idFS_FoodAccessContinuity` INT NOT NULL AUTO_INCREMENT,
  `SelfSufficiencySeason` VARCHAR(100) NULL,
  `NoProcessedFoodDuration` INT NULL,
  `FoodConservationTec` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_FoodAccessContinuity`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_FoodAccessContinuity_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_FoodAccessContinuity_Community1_idx` ON `nautiatoolkit`.`FS_FoodAccessContinuity` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_GrainConservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_GrainConservation` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_GrainConservation` (
  `idFS_GrainConservation` INT NOT NULL AUTO_INCREMENT,
  `ConservationTec` VARCHAR(45) NULL,
  PRIMARY KEY (`idFS_GrainConservation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_GrainMill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_GrainMill` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_GrainMill` (
  `idGrainMill` INT NOT NULL AUTO_INCREMENT,
  `EnginePower` FLOAT NULL,
  `Operative` VARCHAR(45) NULL,
  `GoodUbication` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idGrainMill`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_GrainMill_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_GrainMill_Community1_idx` ON `nautiatoolkit`.`FS_GrainMill` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_OwnCultivationFoodType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_OwnCultivationFoodType` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_OwnCultivationFoodType` (
  `idFS_OwnCultivationFoodType` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idFS_OwnCultivationFoodType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_ElectricGenerationMix`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_ElectricGenerationMix` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_ElectricGenerationMix` (
  `idGD_ElectricGenerationMix` INT NOT NULL AUTO_INCREMENT,
  `Hydro` FLOAT NULL,
  `Diesel` FLOAT NULL,
  `Gas` FLOAT NULL,
  `Coal` FLOAT NULL,
  `Fotovoltaic` FLOAT NULL,
  `Wind` FLOAT NULL,
  `Biofuel` FLOAT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idGD_ElectricGenerationMix`, `Country_idCountry`),
  CONSTRAINT `fk_GD_ElectricGenerationMix_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GD_ElectricGenerationMix_Country1_idx` ON `nautiatoolkit`.`GD_ElectricGenerationMix` (`Country_idCountry` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FA_GeographicIdentification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FA_GeographicIdentification` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FA_GeographicIdentification` (
  `idFA_GeographicIdentification` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `PhreaticLevel` INT NULL,
  `Area` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFA_GeographicIdentification`, `Community_idCommunity`),
  CONSTRAINT `fk_FA_GeographicIdentification_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FA_GeographicIdentification_Community1_idx` ON `nautiatoolkit`.`FA_GeographicIdentification` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`G_PublicPolitic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`G_PublicPolitic` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`G_PublicPolitic` (
  `idG_PublicPolitic` INT NOT NULL AUTO_INCREMENT,
  `DocumentTittle` VARCHAR(100) NULL,
  `Path` VARCHAR(100) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idG_PublicPolitic`, `Community_idCommunity`),
  CONSTRAINT `fk_G_PublicPolitic_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_G_PublicPolitic_Community1_idx` ON `nautiatoolkit`.`G_PublicPolitic` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_PersonalHygiene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_PersonalHygiene` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_PersonalHygiene` (
  `idSE_PersonalHygiene` INT NOT NULL AUTO_INCREMENT,
  `TimesPerWeek` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSE_PersonalHygiene`, `Community_idCommunity`),
  CONSTRAINT `fk_SC_PersonalHygiene_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SC_PersonalHygiene_Community1_idx` ON `nautiatoolkit`.`SE_PersonalHygiene` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_SafetyPlace`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_SafetyPlace` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_SafetyPlace` (
  `idSE_SafetyPlace` INT NOT NULL AUTO_INCREMENT,
  `Place_Time` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_SafetyPlace`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_SafetyCommittee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_SafetyCommittee` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_SafetyCommittee` (
  `idSE_SafetyCommittee` INT NOT NULL AUTO_INCREMENT,
  `SC_SafetyCommittee` VARCHAR(45) NULL,
  `WomenPatrol` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSE_SafetyCommittee`, `Community_idCommunity`),
  CONSTRAINT `fk_SC_SafetyCommittee_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SC_SafetyCommittee_Community1_idx` ON `nautiatoolkit`.`SE_SafetyCommittee` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_SafetyLatrines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_SafetyLatrines` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_SafetyLatrines` (
  `idSE_SafetyLatrines` INT NOT NULL AUTO_INCREMENT,
  `SeparatedBySex` VARCHAR(45) NULL,
  `Light` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSE_SafetyLatrines`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_SafetyLatrines_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_SafetyLatrines_Community1_idx` ON `nautiatoolkit`.`SE_SafetyLatrines` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_Priority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_Priority` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_Priority` (
  `idSE_Priority` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_Priority`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`U_LandUse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`U_LandUse` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`U_LandUse` (
  `idU_LandUse` INT NOT NULL AUTO_INCREMENT,
  `PrivateLandArea` INT NULL,
  `UrbanFloodingArea` INT NULL,
  `UrbanSlopeRiskAre` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idU_LandUse`, `Community_idCommunity`),
  CONSTRAINT `fk_U_LandUse_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_U_LandUse_Community1_idx` ON `nautiatoolkit`.`U_LandUse` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_TimeSpent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_TimeSpent` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_TimeSpent` (
  `idINF_TimeSpent` INT NOT NULL AUTO_INCREMENT,
  `DailyTimeSpent` FLOAT NULL,
  `INF_WaterInfrastructure_idINF_WaterInfrastructure` INT NOT NULL,
  `INF_WaterInfrastructure_Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_TimeSpent`, `INF_WaterInfrastructure_idINF_WaterInfrastructure`, `INF_WaterInfrastructure_Community_idCommunity`),
  CONSTRAINT `fk_INF_TimeSpent_INF_WaterInfrastructure1`
    FOREIGN KEY (`INF_WaterInfrastructure_idINF_WaterInfrastructure` , `INF_WaterInfrastructure_Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`INF_WaterInfrastructure` (`idINF_WaterInfrastructure` , `Community_idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_TimeSpent_INF_WaterInfrastructure1_idx` ON `nautiatoolkit`.`INF_TimeSpent` (`INF_WaterInfrastructure_idINF_WaterInfrastructure` ASC, `INF_WaterInfrastructure_Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_SanitationAccess`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_SanitationAccess` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_SanitationAccess` (
  `idINF_SanitationAccess` INT NOT NULL AUTO_INCREMENT,
  `OutdoorsLatrine` TINYINT(1) NULL,
  `SharedLatrine` TINYINT(1) NULL,
  `IndividualLatrine` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_SanitationAccess`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_SanitationAccess_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_SanitationAccess_Community1_idx` ON `nautiatoolkit`.`INF_SanitationAccess` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_SanitationSystemQuality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_SanitationSystemQuality` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_SanitationSystemQuality` (
  `idINF_SanitationSystemQuality` INT NOT NULL AUTO_INCREMENT,
  `LatrineQuality` VARCHAR(45) NULL,
  `BuildingQuality` VARCHAR(100) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_SanitationSystemQuality`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_SanitationSystemQuality_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_SanitationSystemQuality_Community1_idx` ON `nautiatoolkit`.`INF_SanitationSystemQuality` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_LightingTech`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_LightingTech` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_LightingTech` (
  `idINF_LightingTech` INT NOT NULL AUTO_INCREMENT,
  `TechType` VARCHAR(45) NULL,
  `TechPower` INT NULL,
  `INF_PublicLighting_idINF_PublicLighting` INT NOT NULL,
  `INF_PublicLighting_Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_LightingTech`, `INF_PublicLighting_idINF_PublicLighting`, `INF_PublicLighting_Community_idCommunity`),
  CONSTRAINT `fk_INF_LightingTech_INF_PublicLighting1`
    FOREIGN KEY (`INF_PublicLighting_idINF_PublicLighting` , `INF_PublicLighting_Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`INF_PublicLighting` (`idINF_PublicLighting` , `Community_idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_LightingTech_INF_PublicLighting1_idx` ON `nautiatoolkit`.`INF_LightingTech` (`INF_PublicLighting_idINF_PublicLighting` ASC, `INF_PublicLighting_Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_CorralUbication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_CorralUbication` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_CorralUbication` (
  `idFS_CorralUbication` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Type` VARCHAR(45) NULL,
  `DrainageSystem` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_CorralUbication`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_CorralUbication_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_CorralUbication_Community1_idx` ON `nautiatoolkit`.`FS_CorralUbication` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_CorralCropData`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_CorralCropData` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_CorralCropData` (
  `idFS_CorralCropData` INT NOT NULL AUTO_INCREMENT,
  `PastoralismTechnique` VARCHAR(45) NULL,
  `FertilizationSystem` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_CorralCropData`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_CorralCropData_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_CorralCropData_Community1_idx` ON `nautiatoolkit`.`FS_CorralCropData` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_EthnicGroup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_EthnicGroup` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_EthnicGroup` (
  `idGD_EthnicGroup` INT NOT NULL AUTO_INCREMENT,
  `EthnicGroup` VARCHAR(45) NULL,
  PRIMARY KEY (`idGD_EthnicGroup`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Comun_Religion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Comun_Religion` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Comun_Religion` (
  `idComun_Religion` INT NOT NULL AUTO_INCREMENT,
  `Religion` VARCHAR(45) NULL,
  PRIMARY KEY (`idComun_Religion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`HostCommunity_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`HostCommunity_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`HostCommunity_has_Camp` (
  `HostCommunity_idHostCommunity` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`HostCommunity_idHostCommunity`, `Camp_idCamp`),
  CONSTRAINT `fk_HostCommunity_has_Camp_HostCommunity1`
    FOREIGN KEY (`HostCommunity_idHostCommunity`)
    REFERENCES `nautiatoolkit`.`HostCommunity` (`idHostCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HostCommunity_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_HostCommunity_has_Camp_Camp1_idx` ON `nautiatoolkit`.`HostCommunity_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_HostCommunity_has_Camp_HostCommunity1_idx` ON `nautiatoolkit`.`HostCommunity_has_Camp` (`HostCommunity_idHostCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`People`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`People` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`People` (
  `idPeople` INT NOT NULL AUTO_INCREMENT,
  `Sex` VARCHAR(45) NULL,
  `Workshop` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idPeople`, `Community_idCommunity`),
  CONSTRAINT `fk_People_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_People_Community1_idx` ON `nautiatoolkit`.`People` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`InterviewedCenter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`InterviewedCenter` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`InterviewedCenter` (
  `idInterviewedCenter` INT NOT NULL AUTO_INCREMENT,
  `CenterType` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idInterviewedCenter`, `Community_idCommunity`),
  CONSTRAINT `fk_InterviewedCenter_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_InterviewedCenter_Community1_idx` ON `nautiatoolkit`.`InterviewedCenter` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_has_Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_has_Country` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_has_Country` (
  `Camp_idCamp` INT NOT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`Camp_idCamp`, `Country_idCountry`),
  CONSTRAINT `fk_Camp_has_Country_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camp_has_Country_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_has_Country_Country1_idx` ON `nautiatoolkit`.`Camp_has_Country` (`Country_idCountry` ASC);

CREATE INDEX `fk_Camp_has_Country_Camp1_idx` ON `nautiatoolkit`.`Camp_has_Country` (`Camp_idCamp` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_NaturalHazard_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_NaturalHazard_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_NaturalHazard_has_Camp` (
  `Camp_NaturalHazard_idCamp_NaturalHazard` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  `Times10Year` VARCHAR(45) NULL,
  PRIMARY KEY (`Camp_NaturalHazard_idCamp_NaturalHazard`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_NaturalHazard_has_Camp_Camp_NaturalHazard1`
    FOREIGN KEY (`Camp_NaturalHazard_idCamp_NaturalHazard`)
    REFERENCES `nautiatoolkit`.`Camp_NaturalHazard` (`idCamp_NaturalHazard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camp_NaturalHazard_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_NaturalHazard_has_Camp_Camp1_idx` ON `nautiatoolkit`.`Camp_NaturalHazard_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Camp_NaturalHazard_has_Camp_Camp_NaturalHazard1_idx` ON `nautiatoolkit`.`Camp_NaturalHazard_has_Camp` (`Camp_NaturalHazard_idCamp_NaturalHazard` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_MovementReason_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_MovementReason_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_MovementReason_has_Camp` (
  `Camp_MovementReason_idCamp_MovementReason` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`Camp_MovementReason_idCamp_MovementReason`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_MovementReason_has_Camp1_Camp_MovementReason1`
    FOREIGN KEY (`Camp_MovementReason_idCamp_MovementReason`)
    REFERENCES `nautiatoolkit`.`Camp_MovementReason` (`idCamp_MovementReason`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camp_MovementReason_has_Camp1_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_MovementReason_has_Camp1_Camp1_idx` ON `nautiatoolkit`.`Camp_MovementReason_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Camp_MovementReason_has_Camp1_Camp_MovementReason1_idx` ON `nautiatoolkit`.`Camp_MovementReason_has_Camp` (`Camp_MovementReason_idCamp_MovementReason` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_LocalVEgetation_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_LocalVEgetation_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_LocalVEgetation_has_Camp` (
  `Camp_LocalVEgetation_idCamp_LocalVEgetation` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`Camp_LocalVEgetation_idCamp_LocalVEgetation`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_LocalVEgetation_has_Camp_Camp_LocalVEgetation1`
    FOREIGN KEY (`Camp_LocalVEgetation_idCamp_LocalVEgetation`)
    REFERENCES `nautiatoolkit`.`Camp_LocalVEgetation` (`idCamp_LocalVEgetation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camp_LocalVEgetation_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_LocalVEgetation_has_Camp_Camp1_idx` ON `nautiatoolkit`.`Camp_LocalVEgetation_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Camp_LocalVEgetation_has_Camp_Camp_LocalVEgetation1_idx` ON `nautiatoolkit`.`Camp_LocalVEgetation_has_Camp` (`Camp_LocalVEgetation_idCamp_LocalVEgetation` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_LocalCrop_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_LocalCrop_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_LocalCrop_has_Camp` (
  `Camp_LocalCrop_idCamp_LocalCrop` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`Camp_LocalCrop_idCamp_LocalCrop`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_LocalCrop_has_Camp_Camp_LocalCrop1`
    FOREIGN KEY (`Camp_LocalCrop_idCamp_LocalCrop`)
    REFERENCES `nautiatoolkit`.`Camp_LocalCrop` (`idCamp_LocalCrop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camp_LocalCrop_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_LocalCrop_has_Camp_Camp1_idx` ON `nautiatoolkit`.`Camp_LocalCrop_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Camp_LocalCrop_has_Camp_Camp_LocalCrop1_idx` ON `nautiatoolkit`.`Camp_LocalCrop_has_Camp` (`Camp_LocalCrop_idCamp_LocalCrop` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`GD_EthnicGroup_has_Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`GD_EthnicGroup_has_Country` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`GD_EthnicGroup_has_Country` (
  `GD_EthnicGroup_idGD_EthnicGroup` INT NOT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`GD_EthnicGroup_idGD_EthnicGroup`, `Country_idCountry`),
  CONSTRAINT `fk_GD_EthnicGroup_has_Country_GD_EthnicGroup1`
    FOREIGN KEY (`GD_EthnicGroup_idGD_EthnicGroup`)
    REFERENCES `nautiatoolkit`.`GD_EthnicGroup` (`idGD_EthnicGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GD_EthnicGroup_has_Country_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_GD_EthnicGroup_has_Country_Country1_idx` ON `nautiatoolkit`.`GD_EthnicGroup_has_Country` (`Country_idCountry` ASC);

CREATE INDEX `fk_GD_EthnicGroup_has_Country_GD_EthnicGroup1_idx` ON `nautiatoolkit`.`GD_EthnicGroup_has_Country` (`GD_EthnicGroup_idGD_EthnicGroup` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_CleaningMAterial_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_CleaningMAterial_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_CleaningMAterial_has_Community` (
  `SE_CleaningMAterial_idSE_CleaningMAterial` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`SE_CleaningMAterial_idSE_CleaningMAterial`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_CleaningMAterial_has_Community_SE_CleaningMAterial1`
    FOREIGN KEY (`SE_CleaningMAterial_idSE_CleaningMAterial`)
    REFERENCES `nautiatoolkit`.`SE_CleaningMAterial` (`idSE_CleaningMAterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SE_CleaningMAterial_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_CleaningMAterial_has_Community_Community1_idx` ON `nautiatoolkit`.`SE_CleaningMAterial_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_SE_CleaningMAterial_has_Community_SE_CleaningMAterial1_idx` ON `nautiatoolkit`.`SE_CleaningMAterial_has_Community` (`SE_CleaningMAterial_idSE_CleaningMAterial` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_IncomeType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_IncomeType` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_IncomeType` (
  `idSE_IncomeType` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_IncomeType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_Economy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_Economy` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_Economy` (
  `idSE_Economy` INT NOT NULL AUTO_INCREMENT,
  `BasicBasketCost` FLOAT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idSE_Economy`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_Economy_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_Economy_Community1_idx` ON `nautiatoolkit`.`SE_Economy` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_IncomeType_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_IncomeType_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_IncomeType_has_Community` (
  `idSE_IncomeType_has_Community` INT NOT NULL AUTO_INCREMENT,
  `SE_IncomeType_idSE_IncomeType` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Sex` VARCHAR(45) NULL,
  `IncomeValue` FLOAT NULL,
  PRIMARY KEY (`idSE_IncomeType_has_Community`, `SE_IncomeType_idSE_IncomeType`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_IncomeType_has_Community_SE_IncomeType1`
    FOREIGN KEY (`SE_IncomeType_idSE_IncomeType`)
    REFERENCES `nautiatoolkit`.`SE_IncomeType` (`idSE_IncomeType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SE_IncomeType_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_IncomeType_has_Community_Community1_idx` ON `nautiatoolkit`.`SE_IncomeType_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_SE_IncomeType_has_Community_SE_IncomeType1_idx` ON `nautiatoolkit`.`SE_IncomeType_has_Community` (`SE_IncomeType_idSE_IncomeType` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_ExpenseType_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_ExpenseType_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_ExpenseType_has_Community` (
  `idSE_ExpenseType_has_Community` INT NOT NULL AUTO_INCREMENT,
  `SE_ExpenseType_idSE_ExpenseType` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Sex` VARCHAR(45) NULL,
  `ExpenseValue` INT NULL,
  PRIMARY KEY (`idSE_ExpenseType_has_Community`, `SE_ExpenseType_idSE_ExpenseType`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_ExpenseType_has_Community_SE_ExpenseType1`
    FOREIGN KEY (`SE_ExpenseType_idSE_ExpenseType`)
    REFERENCES `nautiatoolkit`.`SE_ExpenseType` (`idSE_ExpenseType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SE_ExpenseType_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_ExpenseType_has_Community_Community1_idx` ON `nautiatoolkit`.`SE_ExpenseType_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_SE_ExpenseType_has_Community_SE_ExpenseType1_idx` ON `nautiatoolkit`.`SE_ExpenseType_has_Community` (`SE_ExpenseType_idSE_ExpenseType` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_Priority_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_Priority_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_Priority_has_Community` (
  `idSE_Priority_has_Community` INT NOT NULL AUTO_INCREMENT,
  `SE_Priority_idSE_Priority` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `sex` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_Priority_has_Community`, `SE_Priority_idSE_Priority`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_Priority_has_Community_SE_Priority1`
    FOREIGN KEY (`SE_Priority_idSE_Priority`)
    REFERENCES `nautiatoolkit`.`SE_Priority` (`idSE_Priority`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SE_Priority_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_Priority_has_Community_Community1_idx` ON `nautiatoolkit`.`SE_Priority_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_SE_Priority_has_Community_SE_Priority1_idx` ON `nautiatoolkit`.`SE_Priority_has_Community` (`SE_Priority_idSE_Priority` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_WorkType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_WorkType` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_WorkType` (
  `idSE_WorkType` INT NOT NULL AUTO_INCREMENT,
  `WorkType` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_WorkType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_WorkType_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_WorkType_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_WorkType_has_Community` (
  `idSE_WorkType_has_Community` INT NOT NULL AUTO_INCREMENT,
  `SE_WorkType_idSE_WorkType` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Sex` VARCHAR(45) NULL,
  `Kid` TINYINT(1) NULL,
  PRIMARY KEY (`idSE_WorkType_has_Community`, `SE_WorkType_idSE_WorkType`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_WorkType_has_Community_SE_WorkType1`
    FOREIGN KEY (`SE_WorkType_idSE_WorkType`)
    REFERENCES `nautiatoolkit`.`SE_WorkType` (`idSE_WorkType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SE_WorkType_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_WorkType_has_Community_Community1_idx` ON `nautiatoolkit`.`SE_WorkType_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_SE_WorkType_has_Community_SE_WorkType1_idx` ON `nautiatoolkit`.`SE_WorkType_has_Community` (`SE_WorkType_idSE_WorkType` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`G_PoliticalActor_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`G_PoliticalActor_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`G_PoliticalActor_has_Community` (
  `G_PoliticalActor_idG_PoliticalActor` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`G_PoliticalActor_idG_PoliticalActor`, `Community_idCommunity`),
  CONSTRAINT `fk_G_PoliticalActor_has_Community_G_PoliticalActor1`
    FOREIGN KEY (`G_PoliticalActor_idG_PoliticalActor`)
    REFERENCES `nautiatoolkit`.`G_PoliticalActor` (`idG_PoliticalActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_G_PoliticalActor_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_G_PoliticalActor_has_Community_Community1_idx` ON `nautiatoolkit`.`G_PoliticalActor_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_G_PoliticalActor_has_Community_G_PoliticalActor1_idx` ON `nautiatoolkit`.`G_PoliticalActor_has_Community` (`G_PoliticalActor_idG_PoliticalActor` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_WaterPoint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_WaterPoint` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_WaterPoint` (
  `idINF_WaterPoint` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Working` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_WaterPoint`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_WaterPoint_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_WaterPoint_Community1_idx` ON `nautiatoolkit`.`INF_WaterPoint` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_ColletionPoints`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_ColletionPoints` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_ColletionPoints` (
  `idINF_ColletionPoints` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_ColletionPoints`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_ColletionPoints_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_ColletionPoints_Community1_idx` ON `nautiatoolkit`.`INF_ColletionPoints` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure` (
  `idINF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure` INT NOT NULL AUTO_INCREMENT,
  `INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries` INT NOT NULL,
  `INF_EnergyInfrastructure_idINF_EnergyInfrastructure` INT NOT NULL,
  `INF_EnergyInfrastructure_Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure`, `INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries`, `INF_EnergyInfrastructure_idINF_EnergyInfrastructure`, `INF_EnergyInfrastructure_Community_idCommunity`),
  CONSTRAINT `fk_INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure_I1`
    FOREIGN KEY (`INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries`)
    REFERENCES `nautiatoolkit`.`INF_ExpandPlanBeneficiaries` (`idINF_ExpandPlanBeneficiaries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure_I2`
    FOREIGN KEY (`INF_EnergyInfrastructure_idINF_EnergyInfrastructure` , `INF_EnergyInfrastructure_Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`INF_EnergyInfrastructure` (`idINF_EnergyInfrastructure` , `Community_idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure_idx` ON `nautiatoolkit`.`INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure` (`INF_EnergyInfrastructure_idINF_EnergyInfrastructure` ASC, `INF_EnergyInfrastructure_Community_idCommunity` ASC);

CREATE INDEX `fk_INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure_idx1` ON `nautiatoolkit`.`INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure` (`INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_GenerationSource_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_GenerationSource_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_GenerationSource_has_Community` (
  `idINF_GenerationSource_has_Community` INT NOT NULL AUTO_INCREMENT,
  `INF_GenerationSource_idINF_GenerationSource` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Sector` VARCHAR(45) NULL,
  `TimeAccess` FLOAT NULL,
  `Cost` INT NULL,
  PRIMARY KEY (`idINF_GenerationSource_has_Community`, `INF_GenerationSource_idINF_GenerationSource`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_GenerationSource_has_Community_INF_GenerationSource1`
    FOREIGN KEY (`INF_GenerationSource_idINF_GenerationSource`)
    REFERENCES `nautiatoolkit`.`INF_GenerationSource` (`idINF_GenerationSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INF_GenerationSource_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_GenerationSource_has_Community_Community1_idx` ON `nautiatoolkit`.`INF_GenerationSource_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_INF_GenerationSource_has_Community_INF_GenerationSource1_idx` ON `nautiatoolkit`.`INF_GenerationSource_has_Community` (`INF_GenerationSource_idINF_GenerationSource` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_Appliance_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_Appliance_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_Appliance_has_Community` (
  `idINF_Appliance_has_Community` INT NOT NULL AUTO_INCREMENT,
  `INF_Appliance_idINF_Appliance` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Sector` VARCHAR(45) NULL,
  `Power` FLOAT NULL,
  PRIMARY KEY (`idINF_Appliance_has_Community`, `INF_Appliance_idINF_Appliance`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_Appliance_has_Community_INF_Appliance1`
    FOREIGN KEY (`INF_Appliance_idINF_Appliance`)
    REFERENCES `nautiatoolkit`.`INF_Appliance` (`idINF_Appliance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INF_Appliance_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_Appliance_has_Community_Community1_idx` ON `nautiatoolkit`.`INF_Appliance_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_INF_Appliance_has_Community_INF_Appliance1_idx` ON `nautiatoolkit`.`INF_Appliance_has_Community` (`INF_Appliance_idINF_Appliance` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_WomenSafety`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_WomenSafety` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_WomenSafety` (
  `idINF_WomenSafety` INT NOT NULL AUTO_INCREMENT,
  `Influence` VARCHAR(45) NULL,
  `INF_PublicLighting_idINF_PublicLighting` INT NOT NULL,
  `INF_PublicLighting_Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idINF_WomenSafety`, `INF_PublicLighting_idINF_PublicLighting`, `INF_PublicLighting_Community_idCommunity`),
  CONSTRAINT `fk_INF_WomenSafety_INF_PublicLighting1`
    FOREIGN KEY (`INF_PublicLighting_idINF_PublicLighting` , `INF_PublicLighting_Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`INF_PublicLighting` (`idINF_PublicLighting` , `Community_idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_WomenSafety_INF_PublicLighting1_idx` ON `nautiatoolkit`.`INF_WomenSafety` (`INF_PublicLighting_idINF_PublicLighting` ASC, `INF_PublicLighting_Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_MedicineAccess`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_MedicineAccess` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_MedicineAccess` (
  `idS_MedicineAccess` INT NOT NULL AUTO_INCREMENT,
  `Access` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idS_MedicineAccess`, `Community_idCommunity`),
  CONSTRAINT `fk_S_MedicinesAccess_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_MedicinesAccess_Community1_idx` ON `nautiatoolkit`.`S_MedicineAccess` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_RepeaterAntena`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_RepeaterAntena` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_RepeaterAntena` (
  `idS_RepeaterAntena` INT NOT NULL AUTO_INCREMENT,
  `Number` INT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idS_RepeaterAntena`, `Community_idCommunity`),
  CONSTRAINT `fk_S_RepeaterAntena_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_RepeaterAntena_Community1_idx` ON `nautiatoolkit`.`S_RepeaterAntena` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_Tecknowlege_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_Tecknowlege_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_Tecknowlege_has_Community` (
  `idS_Tecknowlege_has_Community` INT NOT NULL AUTO_INCREMENT,
  `S_Tecknowlege_idS_Tecknowlege` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idS_Tecknowlege_has_Community`, `S_Tecknowlege_idS_Tecknowlege`, `Community_idCommunity`),
  CONSTRAINT `fk_S_Tecknowlege_has_Community_S_Tecknowlege1`
    FOREIGN KEY (`S_Tecknowlege_idS_Tecknowlege`)
    REFERENCES `nautiatoolkit`.`S_Tecknowlege` (`idS_Tecknowlege`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_Tecknowlege_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_Tecknowlege_has_Community_Community1_idx` ON `nautiatoolkit`.`S_Tecknowlege_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_Tecknowlege_has_Community_S_Tecknowlege1_idx` ON `nautiatoolkit`.`S_Tecknowlege_has_Community` (`S_Tecknowlege_idS_Tecknowlege` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_HardwareAccesibility_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_HardwareAccesibility_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_HardwareAccesibility_has_Community` (
  `idS_HardwareAccesibility_has_Community` INT NOT NULL AUTO_INCREMENT,
  `S_HardwareAccesibility_idS_HardwareAccesibility` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `OperativeSystem` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_HardwareAccesibility_has_Community`, `S_HardwareAccesibility_idS_HardwareAccesibility`, `Community_idCommunity`),
  CONSTRAINT `fk_S_HardwareAccesibility_has_Community_S_HardwareAccesibility1`
    FOREIGN KEY (`S_HardwareAccesibility_idS_HardwareAccesibility`)
    REFERENCES `nautiatoolkit`.`S_HardwareAccesibility` (`idS_HardwareAccesibility`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_HardwareAccesibility_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_HardwareAccesibility_has_Community_Community1_idx` ON `nautiatoolkit`.`S_HardwareAccesibility_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_HardwareAccesibility_has_Community_S_HardwareAccesibil_idx` ON `nautiatoolkit`.`S_HardwareAccesibility_has_Community` (`S_HardwareAccesibility_idS_HardwareAccesibility` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_ProgramingKnowlege_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_ProgramingKnowlege_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_ProgramingKnowlege_has_Community` (
  `idS_ProgramingKnowlege_has_Community` INT NOT NULL AUTO_INCREMENT,
  `S_ProgramingKnowlege_idS_ProgramingKnowlege` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idS_ProgramingKnowlege_has_Community`, `S_ProgramingKnowlege_idS_ProgramingKnowlege`, `Community_idCommunity`),
  CONSTRAINT `fk_S_ProgramingKnowlege_has_Community_S_ProgramingKnowlege1`
    FOREIGN KEY (`S_ProgramingKnowlege_idS_ProgramingKnowlege`)
    REFERENCES `nautiatoolkit`.`S_ProgramingKnowlege` (`idS_ProgramingKnowlege`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_ProgramingKnowlege_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_ProgramingKnowlege_has_Community_Community1_idx` ON `nautiatoolkit`.`S_ProgramingKnowlege_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_ProgramingKnowlege_has_Community_S_ProgramingKnowlege1_idx` ON `nautiatoolkit`.`S_ProgramingKnowlege_has_Community` (`S_ProgramingKnowlege_idS_ProgramingKnowlege` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_App_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_App_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_App_has_Community` (
  `idS_App_has_Community` INT NOT NULL AUTO_INCREMENT,
  `S_App_idS_App` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Use_Necesity` VARCHAR(45) NULL,
  PRIMARY KEY (`idS_App_has_Community`, `S_App_idS_App`, `Community_idCommunity`),
  CONSTRAINT `fk_S_App_has_Community_S_App1`
    FOREIGN KEY (`S_App_idS_App`)
    REFERENCES `nautiatoolkit`.`S_App` (`idS_App`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_App_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_App_has_Community_Community1_idx` ON `nautiatoolkit`.`S_App_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_App_has_Community_S_App1_idx` ON `nautiatoolkit`.`S_App_has_Community` (`S_App_idS_App` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_FoodAccess_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_FoodAccess_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_FoodAccess_has_Community` (
  `idFS_FoodAccess_has_Community` INT NOT NULL AUTO_INCREMENT,
  `FS_FoodAccess_idFS_FoodAccess` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_FoodAccess_has_Community`, `FS_FoodAccess_idFS_FoodAccess`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_FoodAccess_has_Community_FS_FoodAccess1`
    FOREIGN KEY (`FS_FoodAccess_idFS_FoodAccess`)
    REFERENCES `nautiatoolkit`.`FS_FoodAccess` (`idFS_FoodAccess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FS_FoodAccess_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_FoodAccess_has_Community_Community1_idx` ON `nautiatoolkit`.`FS_FoodAccess_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_FS_FoodAccess_has_Community_FS_FoodAccess1_idx` ON `nautiatoolkit`.`FS_FoodAccess_has_Community` (`FS_FoodAccess_idFS_FoodAccess` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_TypicalPlate_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_TypicalPlate_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_TypicalPlate_has_Community` (
  `idFS_TypicalPlate_has_Community` INT NOT NULL AUTO_INCREMENT,
  `FS_TypicalPlate_idFS_TypicalPlate` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_TypicalPlate_has_Community`, `FS_TypicalPlate_idFS_TypicalPlate`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_TypicalPlate_has_Community_FS_TypicalPlate1`
    FOREIGN KEY (`FS_TypicalPlate_idFS_TypicalPlate`)
    REFERENCES `nautiatoolkit`.`FS_TypicalPlate` (`idFS_TypicalPlate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FS_TypicalPlate_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_TypicalPlate_has_Community_Community1_idx` ON `nautiatoolkit`.`FS_TypicalPlate_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_FS_TypicalPlate_has_Community_FS_TypicalPlate1_idx` ON `nautiatoolkit`.`FS_TypicalPlate_has_Community` (`FS_TypicalPlate_idFS_TypicalPlate` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_FoodSource_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_FoodSource_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_FoodSource_has_Community` (
  `idFS_FoodSource_has_Community` INT NOT NULL AUTO_INCREMENT,
  `FS_FoodSource_idFS_FoodSource` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_FoodSource_has_Community`, `FS_FoodSource_idFS_FoodSource`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_FoodSource_has_Community_FS_FoodSource1`
    FOREIGN KEY (`FS_FoodSource_idFS_FoodSource`)
    REFERENCES `nautiatoolkit`.`FS_FoodSource` (`idFS_FoodSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FS_FoodSource_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_FoodSource_has_Community_Community1_idx` ON `nautiatoolkit`.`FS_FoodSource_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_FS_FoodSource_has_Community_FS_FoodSource1_idx` ON `nautiatoolkit`.`FS_FoodSource_has_Community` (`FS_FoodSource_idFS_FoodSource` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_CultivationSeason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_CultivationSeason` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_CultivationSeason` (
  `idFS_CultivationSeason` INT NOT NULL AUTO_INCREMENT,
  `Month` VARCHAR(45) NULL,
  PRIMARY KEY (`idFS_CultivationSeason`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_CultivationSeason_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_CultivationSeason_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_CultivationSeason_has_Community` (
  `FS_CultivationSeason_idFS_CultivationSeason` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`FS_CultivationSeason_idFS_CultivationSeason`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_CultivationSeason_has_Community_FS_CultivationSeason1`
    FOREIGN KEY (`FS_CultivationSeason_idFS_CultivationSeason`)
    REFERENCES `nautiatoolkit`.`FS_CultivationSeason` (`idFS_CultivationSeason`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FS_CultivationSeason_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_CultivationSeason_has_Community_Community1_idx` ON `nautiatoolkit`.`FS_CultivationSeason_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_FS_CultivationSeason_has_Community_FS_CultivationSeason1_idx` ON `nautiatoolkit`.`FS_CultivationSeason_has_Community` (`FS_CultivationSeason_idFS_CultivationSeason` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_Integration_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_Integration_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_Integration_has_Camp` (
  `Camp_Integration_idCamp_Integration` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`Camp_Integration_idCamp_Integration`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_Integration_has_Camp_Camp_Integration1`
    FOREIGN KEY (`Camp_Integration_idCamp_Integration`)
    REFERENCES `nautiatoolkit`.`Camp_Integration` (`idCamp_Integration`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camp_Integration_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_Integration_has_Camp_Camp1_idx` ON `nautiatoolkit`.`Camp_Integration_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Camp_Integration_has_Camp_Camp_Integration1_idx` ON `nautiatoolkit`.`Camp_Integration_has_Camp` (`Camp_Integration_idCamp_Integration` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Camp_EnergySource_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Camp_EnergySource_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Camp_EnergySource_has_Camp` (
  `Camp_EnergySource_idCamp_EnergySource` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  `Cost` FLOAT NULL,
  PRIMARY KEY (`Camp_EnergySource_idCamp_EnergySource`, `Camp_idCamp`),
  CONSTRAINT `fk_Camp_EnergySource_has_Camp_Camp_EnergySource1`
    FOREIGN KEY (`Camp_EnergySource_idCamp_EnergySource`)
    REFERENCES `nautiatoolkit`.`Camp_EnergySource` (`idCamp_EnergySource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Camp_EnergySource_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Camp_EnergySource_has_Camp_Camp1_idx` ON `nautiatoolkit`.`Camp_EnergySource_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Camp_EnergySource_has_Camp_Camp_EnergySource1_idx` ON `nautiatoolkit`.`Camp_EnergySource_has_Camp` (`Camp_EnergySource_idCamp_EnergySource` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_PotabilizationSystem_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_PotabilizationSystem_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_PotabilizationSystem_has_Community` (
  `INF_PotabilizationSystem_idINF_PotabilizationSystem` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`INF_PotabilizationSystem_idINF_PotabilizationSystem`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_PotabilizationSystem_has_Community_INF_PotabilizationS1`
    FOREIGN KEY (`INF_PotabilizationSystem_idINF_PotabilizationSystem`)
    REFERENCES `nautiatoolkit`.`INF_PotabilizationSystem` (`idINF_PotabilizationSystem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INF_PotabilizationSystem_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_PotabilizationSystem_has_Community_Community1_idx` ON `nautiatoolkit`.`INF_PotabilizationSystem_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_INF_PotabilizationSystem_has_Community_INF_Potabilizatio_idx` ON `nautiatoolkit`.`INF_PotabilizationSystem_has_Community` (`INF_PotabilizationSystem_idINF_PotabilizationSystem` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_Subject_has_S_EducationaCenter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_Subject_has_S_EducationaCenter` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_Subject_has_S_EducationaCenter` (
  `S_Subject_idS_Subject` INT NOT NULL,
  `S_EducationaCenter_idSchool` INT NOT NULL,
  `S_EducationaCenter_Community_idCommunity` INT NOT NULL,
  `SubjectType` VARCHAR(45) NULL,
  PRIMARY KEY (`S_Subject_idS_Subject`, `S_EducationaCenter_idSchool`, `S_EducationaCenter_Community_idCommunity`),
  CONSTRAINT `fk_S_Subject_has_S_EducationaCenter_S_Subject1`
    FOREIGN KEY (`S_Subject_idS_Subject`)
    REFERENCES `nautiatoolkit`.`S_Subject` (`idS_Subject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_Subject_has_S_EducationaCenter_S_EducationaCenter1`
    FOREIGN KEY (`S_EducationaCenter_Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`S_EducationalCenter` (`Community_idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_Subject_has_S_EducationaCenter_S_EducationaCenter1_idx` ON `nautiatoolkit`.`S_Subject_has_S_EducationaCenter` (`S_EducationaCenter_idSchool` ASC, `S_EducationaCenter_Community_idCommunity` ASC);

CREATE INDEX `fk_S_Subject_has_S_EducationaCenter_S_Subject1_idx` ON `nautiatoolkit`.`S_Subject_has_S_EducationaCenter` (`S_Subject_idS_Subject` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_DataAccess_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_DataAccess_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_DataAccess_has_Community` (
  `S_DataAccess_idS_DataAccess` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`S_DataAccess_idS_DataAccess`, `Community_idCommunity`),
  CONSTRAINT `fk_S_DataAccess_has_Community_S_DataAccess1`
    FOREIGN KEY (`S_DataAccess_idS_DataAccess`)
    REFERENCES `nautiatoolkit`.`S_DataAccess` (`idS_DataAccess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_DataAccess_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_DataAccess_has_Community_Community1_idx` ON `nautiatoolkit`.`S_DataAccess_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_DataAccess_has_Community_S_DataAccess1_idx` ON `nautiatoolkit`.`S_DataAccess_has_Community` (`S_DataAccess_idS_DataAccess` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`INF_MobilityWay_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`INF_MobilityWay_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`INF_MobilityWay_has_Community` (
  `idINF_MobilityWay_has_Community` INT NOT NULL AUTO_INCREMENT,
  `INF_MobilityWay_idINF_ExternalMobility` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Internal_External` VARCHAR(45) NULL,
  PRIMARY KEY (`idINF_MobilityWay_has_Community`, `INF_MobilityWay_idINF_ExternalMobility`, `Community_idCommunity`),
  CONSTRAINT `fk_INF_MobilityWay_has_Community_INF_MobilityWay1`
    FOREIGN KEY (`INF_MobilityWay_idINF_ExternalMobility`)
    REFERENCES `nautiatoolkit`.`INF_MobilityWay` (`idINF_ExternalMobility`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INF_MobilityWay_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_INF_MobilityWay_has_Community_Community1_idx` ON `nautiatoolkit`.`INF_MobilityWay_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_INF_MobilityWay_has_Community_INF_MobilityWay1_idx` ON `nautiatoolkit`.`INF_MobilityWay_has_Community` (`INF_MobilityWay_idINF_ExternalMobility` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`S_NoEducationCause_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`S_NoEducationCause_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`S_NoEducationCause_has_Community` (
  `S_NoEducationCause_idS_NoEducationCause` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`S_NoEducationCause_idS_NoEducationCause`, `Community_idCommunity`),
  CONSTRAINT `fk_S_NoEducationCause_has_Community_S_NoEducationCause1`
    FOREIGN KEY (`S_NoEducationCause_idS_NoEducationCause`)
    REFERENCES `nautiatoolkit`.`S_NoEducationCause` (`idS_NoEducationCause`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_S_NoEducationCause_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_S_NoEducationCause_has_Community_Community1_idx` ON `nautiatoolkit`.`S_NoEducationCause_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_S_NoEducationCause_has_Community_S_NoEducationCause1_idx` ON `nautiatoolkit`.`S_NoEducationCause_has_Community` (`S_NoEducationCause_idS_NoEducationCause` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_OwnCultivationFoodType_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_OwnCultivationFoodType_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_OwnCultivationFoodType_has_Community` (
  `FS_OwnCultivationFoodType_idFS_OwnCultivationFoodType` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`FS_OwnCultivationFoodType_idFS_OwnCultivationFoodType`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_OwnCultivationFoodType_has_Community_FS_OwnCultivationF1`
    FOREIGN KEY (`FS_OwnCultivationFoodType_idFS_OwnCultivationFoodType`)
    REFERENCES `nautiatoolkit`.`FS_OwnCultivationFoodType` (`idFS_OwnCultivationFoodType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FS_OwnCultivationFoodType_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_OwnCultivationFoodType_has_Community_Community1_idx` ON `nautiatoolkit`.`FS_OwnCultivationFoodType_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_FS_OwnCultivationFoodType_has_Community_FS_OwnCultivatio_idx` ON `nautiatoolkit`.`FS_OwnCultivationFoodType_has_Community` (`FS_OwnCultivationFoodType_idFS_OwnCultivationFoodType` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_GrainConservation_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_GrainConservation_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_GrainConservation_has_Community` (
  `FS_GrainConservation_idFS_GrainConservation` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`FS_GrainConservation_idFS_GrainConservation`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_GrainConservation_has_Community_FS_GrainConservation1`
    FOREIGN KEY (`FS_GrainConservation_idFS_GrainConservation`)
    REFERENCES `nautiatoolkit`.`FS_GrainConservation` (`idFS_GrainConservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FS_GrainConservation_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_GrainConservation_has_Community_Community1_idx` ON `nautiatoolkit`.`FS_GrainConservation_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_FS_GrainConservation_has_Community_FS_GrainConservation1_idx` ON `nautiatoolkit`.`FS_GrainConservation_has_Community` (`FS_GrainConservation_idFS_GrainConservation` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Comun_Language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Comun_Language` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Comun_Language` (
  `idComun_Laguage` INT NOT NULL AUTO_INCREMENT,
  `Language` VARCHAR(45) NULL,
  PRIMARY KEY (`idComun_Laguage`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Comun_Religion_has_Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Comun_Religion_has_Country` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Comun_Religion_has_Country` (
  `Comun_Religion_idGD_Religion` INT NOT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`Comun_Religion_idGD_Religion`, `Country_idCountry`),
  CONSTRAINT `fk_Comun_Religion_has_Country_Comun_Religion1`
    FOREIGN KEY (`Comun_Religion_idGD_Religion`)
    REFERENCES `nautiatoolkit`.`Comun_Religion` (`idComun_Religion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comun_Religion_has_Country_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Comun_Religion_has_Country_Country1_idx` ON `nautiatoolkit`.`Comun_Religion_has_Country` (`Country_idCountry` ASC);

CREATE INDEX `fk_Comun_Religion_has_Country_Comun_Religion1_idx` ON `nautiatoolkit`.`Comun_Religion_has_Country` (`Comun_Religion_idGD_Religion` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Comun_Language_has_Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Comun_Language_has_Country` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Comun_Language_has_Country` (
  `Comun_Language_idComun_Language` INT NOT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`Comun_Language_idComun_Language`, `Country_idCountry`),
  CONSTRAINT `fk_Comun_Laguage_has_Country_Comun_Laguage1`
    FOREIGN KEY (`Comun_Language_idComun_Language`)
    REFERENCES `nautiatoolkit`.`Comun_Language` (`idComun_Laguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comun_Laguage_has_Country_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `nautiatoolkit`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Comun_Laguage_has_Country_Country1_idx` ON `nautiatoolkit`.`Comun_Language_has_Country` (`Country_idCountry` ASC);

CREATE INDEX `fk_Comun_Laguage_has_Country_Comun_Laguage1_idx` ON `nautiatoolkit`.`Comun_Language_has_Country` (`Comun_Language_idComun_Language` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Comun_Language_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Comun_Language_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Comun_Language_has_Camp` (
  `Comun_Language_idComun_Language` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`Comun_Language_idComun_Language`, `Camp_idCamp`),
  CONSTRAINT `fk_Comun_Laguage_has_Camp_Comun_Laguage1`
    FOREIGN KEY (`Comun_Language_idComun_Language`)
    REFERENCES `nautiatoolkit`.`Comun_Language` (`idComun_Laguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comun_Laguage_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Comun_Laguage_has_Camp_Camp1_idx` ON `nautiatoolkit`.`Comun_Language_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Comun_Laguage_has_Camp_Comun_Laguage1_idx` ON `nautiatoolkit`.`Comun_Language_has_Camp` (`Comun_Language_idComun_Language` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`FS_CropUbication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`FS_CropUbication` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`FS_CropUbication` (
  `idFS_CroplUbication` INT NOT NULL AUTO_INCREMENT,
  `Latitude` VARCHAR(45) NULL,
  `Longitude` VARCHAR(45) NULL,
  `Altitude` INT NULL,
  `Type` VARCHAR(45) NULL,
  `IrrigationSystem` VARCHAR(45) NULL,
  `Community_idCommunity` INT NOT NULL,
  PRIMARY KEY (`idFS_CroplUbication`, `Community_idCommunity`),
  CONSTRAINT `fk_FS_CropUbication_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_FS_CropUbication_Community1_idx` ON `nautiatoolkit`.`FS_CropUbication` (`Community_idCommunity` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`Comun_Religion_has_Camp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`Comun_Religion_has_Camp` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`Comun_Religion_has_Camp` (
  `Comun_Religion_idComun_Religion` INT NOT NULL,
  `Camp_idCamp` INT NOT NULL,
  PRIMARY KEY (`Comun_Religion_idComun_Religion`, `Camp_idCamp`),
  CONSTRAINT `fk_Comun_Religion_has_Camp_Comun_Religion1`
    FOREIGN KEY (`Comun_Religion_idComun_Religion`)
    REFERENCES `nautiatoolkit`.`Comun_Religion` (`idComun_Religion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comun_Religion_has_Camp_Camp1`
    FOREIGN KEY (`Camp_idCamp`)
    REFERENCES `nautiatoolkit`.`Camp` (`idCamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Comun_Religion_has_Camp_Camp1_idx` ON `nautiatoolkit`.`Comun_Religion_has_Camp` (`Camp_idCamp` ASC);

CREATE INDEX `fk_Comun_Religion_has_Camp_Comun_Religion1_idx` ON `nautiatoolkit`.`Comun_Religion_has_Camp` (`Comun_Religion_idComun_Religion` ASC);


-- -----------------------------------------------------
-- Table `nautiatoolkit`.`SE_SafetyPlace_has_Community`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nautiatoolkit`.`SE_SafetyPlace_has_Community` ;

CREATE TABLE IF NOT EXISTS `nautiatoolkit`.`SE_SafetyPlace_has_Community` (
  `idSE_SafetyPlace_has_Community` INT NOT NULL AUTO_INCREMENT,
  `SE_SafetyPlace_idSE_SafetyPlace` INT NOT NULL,
  `Community_idCommunity` INT NOT NULL,
  `Answer` VARCHAR(45) NULL,
  PRIMARY KEY (`idSE_SafetyPlace_has_Community`, `SE_SafetyPlace_idSE_SafetyPlace`, `Community_idCommunity`),
  CONSTRAINT `fk_SE_SafetyPlace_has_Community_SE_SafetyPlace1`
    FOREIGN KEY (`SE_SafetyPlace_idSE_SafetyPlace`)
    REFERENCES `nautiatoolkit`.`SE_SafetyPlace` (`idSE_SafetyPlace`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SE_SafetyPlace_has_Community_Community1`
    FOREIGN KEY (`Community_idCommunity`)
    REFERENCES `nautiatoolkit`.`Community` (`idCommunity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_SE_SafetyPlace_has_Community_Community1_idx` ON `nautiatoolkit`.`SE_SafetyPlace_has_Community` (`Community_idCommunity` ASC);

CREATE INDEX `fk_SE_SafetyPlace_has_Community_SE_SafetyPlace1_idx` ON `nautiatoolkit`.`SE_SafetyPlace_has_Community` (`SE_SafetyPlace_idSE_SafetyPlace` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

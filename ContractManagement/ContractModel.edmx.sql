










































-- -----------------------------------------------------------
-- Entity Designer DDL Script for MySQL Server 4.1 and higher
-- -----------------------------------------------------------
-- Date Created: 08/14/2016 22:20:20

-- Generated from EDMX file: G:\VSWorkspace\ContractManagement\ContractManagement\ContractModel.edmx
-- Target version: 3.0.0.0

-- --------------------------------------------------


DROP DATABASE IF EXISTS `ContractManagement`;
CREATE DATABASE `ContractManagement` DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
USE `ContractManagement`;


-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- NOTE: if the constraint does not exist, an ignorable error will be reported.
-- --------------------------------------------------


--    ALTER TABLE `SubjectObjects` DROP CONSTRAINT `FK_ContractRegistryFormSubjectObject`;

--    ALTER TABLE `Departments` DROP CONSTRAINT `FK_ContractRegistryFormDepartment`;

--    ALTER TABLE `ArchiveMaterials` DROP CONSTRAINT `FK_ContractRegistryFormArchiveMaterial`;

--    ALTER TABLE `payTimes` DROP CONSTRAINT `FK_ContractRegistryFormpayTime`;

--    ALTER TABLE `ReceiveTimes` DROP CONSTRAINT `FK_ContractRegistryFormReceiveTime`;

--    ALTER TABLE `ContractRegistryForms` DROP CONSTRAINT `FK_ContractRegistryFormPreRegisterRecording`;

--    ALTER TABLE `ContractRegistryForms` DROP CONSTRAINT `FK_ContractRegistryFormFormalRegisterRecording`;

--    ALTER TABLE `ReceiveRecordings` DROP CONSTRAINT `FK_ContractRegistryFormReceiveRecording`;

--    ALTER TABLE `PayRecordings` DROP CONSTRAINT `FK_ContractRegistryFormPayRecording`;


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------
SET foreign_key_checks = 0;

    DROP TABLE IF EXISTS `ContractRegistryForms`;

    DROP TABLE IF EXISTS `SubjectObjects`;

    DROP TABLE IF EXISTS `Departments`;

    DROP TABLE IF EXISTS `ArchiveMaterials`;

    DROP TABLE IF EXISTS `payTimes`;

    DROP TABLE IF EXISTS `ReceiveTimes`;

    DROP TABLE IF EXISTS `PreRegisterRecordings`;

    DROP TABLE IF EXISTS `FormalRegisterRecordings`;

    DROP TABLE IF EXISTS `PayRecordings`;

    DROP TABLE IF EXISTS `ReceiveRecordings`;

SET foreign_key_checks = 1;

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------


CREATE TABLE `ContractRegistryForms`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Number` longtext NOT NULL, 
	`Name` longtext NOT NULL, 
	`FinancialFlow` int NOT NULL, 
	`IsForeignContract` bool NOT NULL, 
	`Description` longtext NOT NULL, 
	`SubjectObjectOther` longtext NOT NULL, 
	`FundsType` int NOT NULL, 
	`Operator` longtext NOT NULL, 
	`ProjectNumber` longtext NOT NULL, 
	`BudgetNumber` longtext NOT NULL, 
	`Money` double NOT NULL, 
	`Currency` int NOT NULL, 
	`StartDate` datetime NOT NULL, 
	`EndDate` datetime NOT NULL, 
	`TargetCompanyName` longtext NOT NULL, 
	`ArchiveMaterialOther` longtext NOT NULL, 
	`PreRegisterRecording_Id` int NOT NULL, 
	`FormalRegisterRecording_Id` int NOT NULL);

ALTER TABLE `ContractRegistryForms` ADD PRIMARY KEY (`Id`);





CREATE TABLE `SubjectObjects`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`SubjectObjectNumber` int NOT NULL, 
	`ContractRegistryFormId` int NOT NULL);

ALTER TABLE `SubjectObjects` ADD PRIMARY KEY (`Id`);





CREATE TABLE `Departments`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`DepartmentNumber` int NOT NULL, 
	`ContractRegistryFormId` int NOT NULL);

ALTER TABLE `Departments` ADD PRIMARY KEY (`Id`);





CREATE TABLE `ArchiveMaterials`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`ArchiveMaterialNumber` int NOT NULL, 
	`ContractRegistryFormId` int NOT NULL);

ALTER TABLE `ArchiveMaterials` ADD PRIMARY KEY (`Id`);





CREATE TABLE `payTimes`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Type` int NOT NULL, 
	`ExpectedMoney` double NOT NULL, 
	`ExpectedCurrency` int NOT NULL, 
	`PayCondition` longtext NOT NULL, 
	`PayDate` datetime NOT NULL, 
	`PayCredential` longtext NOT NULL, 
	`ActualMoney` double NOT NULL, 
	`ActualCurrency` int NOT NULL, 
	`PayType` int NOT NULL, 
	`CreatedTime` datetime NOT NULL, 
	`IsCredentialFiled` bool NOT NULL, 
	`Composition` longtext NOT NULL, 
	`ContractRegistryFormId` int NOT NULL);

ALTER TABLE `payTimes` ADD PRIMARY KEY (`Id`);





CREATE TABLE `ReceiveTimes`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Type` int NOT NULL, 
	`ExpectedMoney` double NOT NULL, 
	`ExpectedCurrency` int NOT NULL, 
	`ReceiveCondition` longtext NOT NULL, 
	`ReceiveDate` datetime NOT NULL, 
	`ActualMoney` double NOT NULL, 
	`ActualCurrency` int NOT NULL, 
	`InvoiceState` int NOT NULL, 
	`InvoiceTime` datetime NOT NULL, 
	`ContractRegistryFormId` int NOT NULL);

ALTER TABLE `ReceiveTimes` ADD PRIMARY KEY (`Id`);





CREATE TABLE `PreRegisterRecordings`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`ContractManagerComments` longtext NOT NULL, 
	`ProjectManagerComments` longtext NOT NULL);

ALTER TABLE `PreRegisterRecordings` ADD PRIMARY KEY (`Id`);





CREATE TABLE `FormalRegisterRecordings`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`ContractManagerComments` longtext NOT NULL, 
	`ProjectManagerComments` longtext NOT NULL);

ALTER TABLE `FormalRegisterRecordings` ADD PRIMARY KEY (`Id`);





CREATE TABLE `PayRecordings`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`ContractManagerComments` longtext NOT NULL, 
	`ProjectManagerComments` longtext NOT NULL, 
	`ContractRegistryFormId` int NOT NULL, 
	`ContractRegistryFormId1` int NOT NULL);

ALTER TABLE `PayRecordings` ADD PRIMARY KEY (`Id`);





CREATE TABLE `ReceiveRecordings`(
	`Id` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`ContractManagerComments` longtext NOT NULL, 
	`ProjectManagerComments` longtext NOT NULL, 
	`ContractRegistryFormId` int NOT NULL);

ALTER TABLE `ReceiveRecordings` ADD PRIMARY KEY (`Id`);







-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------


-- Creating foreign key on `ContractRegistryFormId` in table 'SubjectObjects'

ALTER TABLE `SubjectObjects`
ADD CONSTRAINT `FK_ContractRegistryFormSubjectObject`
    FOREIGN KEY (`ContractRegistryFormId`)
    REFERENCES `ContractRegistryForms`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormSubjectObject'

CREATE INDEX `IX_FK_ContractRegistryFormSubjectObject`
    ON `SubjectObjects`
    (`ContractRegistryFormId`);



-- Creating foreign key on `ContractRegistryFormId` in table 'Departments'

ALTER TABLE `Departments`
ADD CONSTRAINT `FK_ContractRegistryFormDepartment`
    FOREIGN KEY (`ContractRegistryFormId`)
    REFERENCES `ContractRegistryForms`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormDepartment'

CREATE INDEX `IX_FK_ContractRegistryFormDepartment`
    ON `Departments`
    (`ContractRegistryFormId`);



-- Creating foreign key on `ContractRegistryFormId` in table 'ArchiveMaterials'

ALTER TABLE `ArchiveMaterials`
ADD CONSTRAINT `FK_ContractRegistryFormArchiveMaterial`
    FOREIGN KEY (`ContractRegistryFormId`)
    REFERENCES `ContractRegistryForms`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormArchiveMaterial'

CREATE INDEX `IX_FK_ContractRegistryFormArchiveMaterial`
    ON `ArchiveMaterials`
    (`ContractRegistryFormId`);



-- Creating foreign key on `ContractRegistryFormId` in table 'payTimes'

ALTER TABLE `payTimes`
ADD CONSTRAINT `FK_ContractRegistryFormpayTime`
    FOREIGN KEY (`ContractRegistryFormId`)
    REFERENCES `ContractRegistryForms`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormpayTime'

CREATE INDEX `IX_FK_ContractRegistryFormpayTime`
    ON `payTimes`
    (`ContractRegistryFormId`);



-- Creating foreign key on `ContractRegistryFormId` in table 'ReceiveTimes'

ALTER TABLE `ReceiveTimes`
ADD CONSTRAINT `FK_ContractRegistryFormReceiveTime`
    FOREIGN KEY (`ContractRegistryFormId`)
    REFERENCES `ContractRegistryForms`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormReceiveTime'

CREATE INDEX `IX_FK_ContractRegistryFormReceiveTime`
    ON `ReceiveTimes`
    (`ContractRegistryFormId`);



-- Creating foreign key on `PreRegisterRecording_Id` in table 'ContractRegistryForms'

ALTER TABLE `ContractRegistryForms`
ADD CONSTRAINT `FK_ContractRegistryFormPreRegisterRecording`
    FOREIGN KEY (`PreRegisterRecording_Id`)
    REFERENCES `PreRegisterRecordings`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormPreRegisterRecording'

CREATE INDEX `IX_FK_ContractRegistryFormPreRegisterRecording`
    ON `ContractRegistryForms`
    (`PreRegisterRecording_Id`);



-- Creating foreign key on `FormalRegisterRecording_Id` in table 'ContractRegistryForms'

ALTER TABLE `ContractRegistryForms`
ADD CONSTRAINT `FK_ContractRegistryFormFormalRegisterRecording`
    FOREIGN KEY (`FormalRegisterRecording_Id`)
    REFERENCES `FormalRegisterRecordings`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormFormalRegisterRecording'

CREATE INDEX `IX_FK_ContractRegistryFormFormalRegisterRecording`
    ON `ContractRegistryForms`
    (`FormalRegisterRecording_Id`);



-- Creating foreign key on `ContractRegistryFormId` in table 'ReceiveRecordings'

ALTER TABLE `ReceiveRecordings`
ADD CONSTRAINT `FK_ContractRegistryFormReceiveRecording`
    FOREIGN KEY (`ContractRegistryFormId`)
    REFERENCES `ContractRegistryForms`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormReceiveRecording'

CREATE INDEX `IX_FK_ContractRegistryFormReceiveRecording`
    ON `ReceiveRecordings`
    (`ContractRegistryFormId`);



-- Creating foreign key on `ContractRegistryFormId1` in table 'PayRecordings'

ALTER TABLE `PayRecordings`
ADD CONSTRAINT `FK_ContractRegistryFormPayRecording`
    FOREIGN KEY (`ContractRegistryFormId1`)
    REFERENCES `ContractRegistryForms`
        (`Id`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_ContractRegistryFormPayRecording'

CREATE INDEX `IX_FK_ContractRegistryFormPayRecording`
    ON `PayRecordings`
    (`ContractRegistryFormId1`);



-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------

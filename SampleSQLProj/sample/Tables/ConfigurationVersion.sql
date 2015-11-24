CREATE TABLE [sample].[ConfigurationVersion] (
    [ConfigurationVersionId]          INT                                             IDENTITY (1, 1) NOT NULL,
    [ConfigurationId]                 INT                                             NOT NULL,
    [ScenarioId]                      INT                                             NOT NULL,
    [ConfigurationVersionDescription] VARCHAR (255)                                   NOT NULL,
    [Config]                          XML(CONTENT [sample].[ConfigurationVersionConfig]) NULL,
    [StartDate]                       DATETIME                                        NOT NULL,
    [EndDate]                         DATETIME                                        NULL,
    [ParentConfigurationVersionId]    INT                                             NULL,
    [VersionNumber]                   INT                                             DEFAULT ((1)) NOT NULL,
    [CreateDate]                      DATETIME                                        DEFAULT (getdate()) NOT NULL,
    [CreateUser]                      VARCHAR (30)                                    DEFAULT (suser_sname()) NOT NULL,
    [ModifyDate]                      DATETIME                                        DEFAULT (getdate()) NOT NULL,
    [ModifyUser]                      VARCHAR (30)                                    DEFAULT (suser_sname()) NOT NULL,
    [ApproveDate]                     DATETIME                                        NULL,
    [ApproveUser]                     VARCHAR (30)                                    NULL,
    [CurrentFlag]                     BIT                                             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKConfigurationVersionId] PRIMARY KEY CLUSTERED ([ConfigurationVersionId] ASC)
);
GO


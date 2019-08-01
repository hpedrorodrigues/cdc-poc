CREATE DATABASE poc;
GO

USE poc;

EXEC sys.sp_cdc_enable_db;

CREATE TABLE demo (
    id      INT NOT NULL,
    message NVARCHAR(MAX)
);

EXEC sys.sp_cdc_enable_table @source_schema = 'dbo', @source_name = 'demo', @role_name = NULL, @supports_net_changes = 0;
GO

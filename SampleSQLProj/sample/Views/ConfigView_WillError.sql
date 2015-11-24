CREATE VIEW [sample].ConfigView_WillError
 (RowSequence,AssetIsinCode, PercentPlaced, PercentPlacedIntraGroup, UserComment)
AS
--
-- $Id: AssetPlacementConfig.sql 114559 2015-11-11 18:31:50Z sharsl $
-- $URL: https://svc-vcs-prd:18080/svn/apps/RCLMReporting/branches/TransformationCash/Src/SQL/Bdl/lookup/Views/AssetPlacementConfig.sql $
--
-- ====================================================================
--
-- Copyright (c) 2000-2015 by Mizuho International plc.
--  All Rights Reserved.
--
-- ====================================================================
--
-- Purpose: View to display Asset Placement Config.
--
-- Author:  Regulatory ISD
-- 
--
--
WITH XMLNAMESPACES ('http://Mizuho/Regulatory/RegSol/AssetPlacement' AS cfg)
SELECT 

[RowSequence] = p.value('(./@RowSequence)[1]', 'int')
FROM sample.ConfigurationVersion cfgv
CROSS apply cfgv.Config.nodes('/cfg:SampleConfig/cfg:Sample') t(p)
GO


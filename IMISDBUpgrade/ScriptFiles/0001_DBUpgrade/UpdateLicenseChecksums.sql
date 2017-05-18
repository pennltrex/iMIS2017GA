DECLARE @userKey uniqueidentifier 
SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'SYSTEM' 
IF (@userKey IS NULL) 
     SELECT @userKey = [UserKey] FROM [dbo].[UserMain] WHERE [UserId] = 'MANAGER' 

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'PBkuzaLZx3EGlVE4m9aHN79eA4gmxrj74DDvRNQMjfOe2H4avKZ6yJ8aO7je8gPsZ51wW9UZ77+0s8znHIQQqAkDz5GLkhfoo1MC7DLcAhDHMleLuKPX5qpw3/BBpvVHinjZ1BfuM4VPdMMxn3XWlp+Rgn/9cTIuoV+ZhI7/UF0=', 
       [UpdatedByUserKey] = @userKey, [UpdatedOn] = GETDATE() 
 WHERE [ParameterName] = 'LicenseMapChecksum' AND [OrganizationKey] = '00000000-0000-0000-0000-000000000000'

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'PBkuzaLZx3EGlVE4m9aHN79eA4gmxrj74DDvRNQMjfOe2H4avKZ6yJ8aO7je8gPsZ51wW9UZ77+0s8znHIQQqAkDz5GLkhfoo1MC7DLcAhDHMleLuKPX5qpw3/BBpvVHinjZ1BfuM4VPdMMxn3XWlp+Rgn/9cTIuoV+ZhI7/UF0=', 
       [UpdatedByUserKey] = @userKey, [UpdatedOn] = GETDATE() 
 WHERE [ParameterName] = 'LicenseMapMasterChecksum' AND [OrganizationKey] = '00000000-0000-0000-0000-000000000000'

UPDATE [dbo].[SystemConfig] 
   SET [ParameterValue] = 'mi0Fj7/a3WrlzfHND4t/cnr/Z8KrgwTHcAzu3bJGM4R/wLxOH99VW+GPJsUYxm5lgGiKHoyfgUz7ufQqfu/C1sQynNLbpEWOZnygAFgNlhlfaD8tpF3MdWWFoPaGL2r9JVvyMgS0xWz7rhyeQ7wvi2yKwlN36E+WCxevsQlCqoY=', 
       [UpdatedByUserKey] = @userKey, [UpdatedOn] = GETDATE() 
 WHERE [ParameterName] = 'LicenseTypeRefChecksum' AND [OrganizationKey] = '00000000-0000-0000-0000-000000000000'


-- Rebuild/refresh indexes and statistics for performance
ALTER INDEX ALL ON DocumentMain REBUILD;
ALTER INDEX ALL ON Hierarchy REBUILD
GO


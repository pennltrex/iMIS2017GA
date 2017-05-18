-- Update Navigation Hierarchy Keys with proper Sort Order
DECLARE @sortStart int

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '6c784340-ed59-47c1-a740-00c6decb8f24'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'ef587bb6-9ee7-4c28-9538-ec8118bf01dd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'ddb8d6e0-a8b4-4c16-9e93-d36a9daf3e97'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'd67059eb-dafb-4455-993e-996521b494f2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = 'd372fefc-9570-4fd1-b56a-13426b76de10'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '206e87b5-8347-4a75-b500-7c5c345c5eec'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '0d1f6d1b-d07e-4cf1-9623-965969a1e20c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '16d78740-7cd2-48fd-8fef-4cc1ec7784f4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'a30d55f8-b1d7-4290-af8e-75261364c969'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = 'abde3606-525e-46e1-b637-e8260f4fdc9e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = '7e5f974d-a63b-4595-9dec-6ce34fefd34f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = 'eda6e403-6132-4bba-9004-741d2a82909c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = 'b5ba2f31-6cdb-421a-95ab-019182040711'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = '11430030-708e-4150-9e67-c8a40df96568'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [HierarchyKey] = '9eb8c8b2-373b-4fea-896c-835b03387233'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd372fefc-9570-4fd1-b56a-13426b76de10'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '4ba3bd09-6742-4768-929a-9e0aff13a557'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'b624f62a-b16d-4f0a-b2dc-315b48083f38'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '3c67b0da-09ac-46ca-9784-2ef17076a178'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'd2343920-4dd9-4512-8257-20ee75e20266'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'd46e3449-6a03-48fb-acb7-13835f2950c5'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '750148e2-ad81-4192-be05-7a4fffbd693d'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '54fc83b0-360e-4bd4-a658-59ec645355ed'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = 'bdc75f4a-0ef8-47c5-bfcd-98166dd19500'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'a8058ff4-5ef8-455c-8bbd-db86865600b6'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'bc6e0c85-f8c1-445d-8d15-a6a1177d5fae'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '84a12ab2-151d-443b-965c-b5624b20d7a4'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'ef619cd1-131a-4a56-9550-579a3f7eba5c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'b5fd3fca-d350-4fcd-9124-20b1e5044d12'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = 'ebdd9207-cfe6-4715-bc69-70c901f5d923'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '78bdddca-089d-46ea-bab2-f8577347aad1'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = 'f29d3cee-7f61-4747-8253-455677980fde'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = 'b231b25f-cad5-481e-b8fb-be986c5350de'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '8452e8d5-fac6-442a-a648-14281edd2e65'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = 'e519f4e8-1f67-4607-81e9-312ddd06c846'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = 'ae5f0fda-f5a6-40f5-b068-8cbc6ba320ba'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '5c7ffe11-cb32-4fc4-bdbf-95f97153d20e'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = '90d26e41-0297-4253-b569-f8dd4d6b0801'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = '9f59179f-2a0e-4b6a-939c-1ba1c6439b0e'

-- Get the parent sort order value
SELECT @sortStart = [SortOrder]
  FROM [dbo].[Hierarchy]
 WHERE [HierarchyKey] = '71e7ebe8-1f90-416a-ae0d-9560a6704f85'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 2
 WHERE [HierarchyKey] = '5ba4f0d3-9880-4812-aef6-da0383097b92'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 4
 WHERE [HierarchyKey] = '211db63e-1af0-4181-b472-1e2a29adf069'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 6
 WHERE [HierarchyKey] = '3c29bc77-fc25-49bd-a951-b9dd3b66bf47'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 8
 WHERE [HierarchyKey] = '8d34e992-65d8-4f9b-814a-8ba74846f418'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 10
 WHERE [HierarchyKey] = '45069794-e264-4d19-a55e-8aa49dee294c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 12
 WHERE [HierarchyKey] = '68df2663-22b5-4419-a61b-12b744efa8cd'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 14
 WHERE [HierarchyKey] = '852cc460-ff22-4813-bfb9-e3a8cfb0fcf2'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 16
 WHERE [HierarchyKey] = 'a0d7c101-7675-406e-a988-29bba911eb3f'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 18
 WHERE [HierarchyKey] = 'd2343920-4dd9-4512-8257-20ee75e20266'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 20
 WHERE [HierarchyKey] = 'f2f9498c-18fb-4195-9c3b-8c5ce7952858'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 22
 WHERE [HierarchyKey] = '8aa16f30-8db5-40e4-8ff0-a82c20c0990c'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 24
 WHERE [HierarchyKey] = 'ebdd9207-cfe6-4715-bc69-70c901f5d923'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 26
 WHERE [HierarchyKey] = 'c3a7b307-03cb-4fb2-9a32-cd6067255eaa'

-- Update Child Sort Order value
UPDATE [dbo].[Hierarchy]
   SET [SortOrder] = @sortStart + 28
 WHERE [HierarchyKey] = '54fc83b0-360e-4bd4-a658-59ec645355ed'


[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "EvoHRPOreGiornaliere_all_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared EvoHRPOreGiornaliere_all = let
  Source = Sql.Database("192.168.1.171", "DATA_WAREHOUSE"),
  #"Navigation 1" = Source{[Schema = "dbo", Item = "EvoHRPOreGiornaliere_all"]}[Data]
in
  #"Navigation 1";
shared EvoHRPOreGiornaliere_all_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "EvoHRPOreGiornaliere_all", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;

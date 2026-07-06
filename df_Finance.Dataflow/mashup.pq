[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared ODataLink = "http://srvbcapp01.nappi.local:7048/BC252/ODataV4/Company('NAPPI')/" meta [IsParameterQuery = true, IsParameterQueryRequired = false, Type = type text];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimensionSetEntries_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared DimensionSetEntries = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[DimensionSetEntries],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Valueentries_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Valueentries = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Valueentries],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimensionSetPBI_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared DimensionSetPBI = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[DimensionSetPBI],
  #"Filtered rows" = Table.SelectRows(Navigation, each ([DimensionSet_DimensionCode] = "AREAGEOGRAFICA" or [DimensionSet_DimensionCode] = "CANALE" or [DimensionSet_DimensionCode] = "CONSUMO" or [DimensionSet_DimensionCode] = "PRODOTTO"))
in
  #"Filtered rows";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimensionValue_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared DimensionValue = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[DimensionValue]
in
  Navigation;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "GLEntryEC_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared GLEntryEC = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[GLEntryEC]
in
  Navigation;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "GLAccountParent_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared GLAccountParent = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[GLAccountParent]
in
  Navigation;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "GLEntry_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared GLEntry = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[GLEntry],
  #"Removed columns" = Table.RemoveColumns(Navigation, {"Job_No_Link"}),
  #"Changed column type" = Table.TransformColumnTypes(#"Removed columns", {{"EOS_Creation_Date_Time", type datetime}})
in
  #"Changed column type";
shared DimensionSetEntries_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "DimensionSetEntries", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Valueentries_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Valueentries", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared DimensionSetPBI_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "DimensionSetPBI", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared DimensionValue_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "DimensionValue", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared GLEntryEC_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "GLEntryEC", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared GLAccountParent_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "GLAccountParent", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared GLEntry_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "GLEntry", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;

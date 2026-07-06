[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared ODataLink = "http://srvbcapp01.nappi.local:7048/BC252/ODataV4/Company('NAPPI')/" meta [IsParameterQuery = true, IsParameterQueryRequired = false, Type = type text];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Ubicazioni_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Ubicazioni = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[LocationCard],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "VendorList_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared VendorList = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[VendorList],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Productorderheader_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Productorderheader = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Productorderheader],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function})),
  #"Changed column type" = Table.TransformColumnTypes(#"Remove columns", {{"Starting_Date_Time", type date}, {"Ending_Date_Time", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ItemLedgerEntry_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared ItemLedgerEntry = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[ItemLedgerEntriesQuery]
in
  Navigation;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Productorderlines_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Productorderlines = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Productorderlines],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function})),
  #"Changed column type" = Table.TransformColumnTypes(#"Remove columns", {{"Ending_Date_Time", type date}, {"Starting_Date_Time", type date}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Purchreceiptlines_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Purchreceiptlines = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Purchreceiptlines],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "PurchaseOrderLines_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared PurchaseOrderLines = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[PurchaseLine],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Itemunitofmeasure_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Itemunitofmeasure = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Itemunitofmeasure],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProductBOMline_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared ProductBOMline = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[ProductBOMline],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Purchreceiptheader_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Purchreceiptheader = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Purchreceiptheader],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ItemList_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared ItemList = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[ItemQuery],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Postedwarehouseheader_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Postedwarehouseheader = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Postedwarehouseheader],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "PurchaseOrderheader_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared PurchaseOrderheader = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[PurchaseOrderheader],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Postedwarehouselines_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Postedwarehouselines = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[Postedwarehouselines],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ProductBOMHeader_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared ProductBOMHeader = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[ProductBOMHeader],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "EOSproductfamily_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared EOSproductfamily = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[EOSproductfamily],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "PurchaseInvoiceheader_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared PurchaseInvoiceheader = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[PurchaseInvoiceheader],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "Purchaseinvoicelines_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared Purchaseinvoicelines = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[PurchInvLineQuery],
  #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function}))
in
  #"Remove columns";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "VendorLedgerEntry_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared VendorLedgerEntry = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[VendorLedgerEntry],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function})),
  #"Changed column type" = Table.TransformColumnTypes(#"Remove columns", {{"SystemCreatedAt", type datetime}, {"SystemModifiedAt", type datetime}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "CustLedgerEntry_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared CustLedgerEntry = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[CustLedgerEntry],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function})),
  #"Changed column type" = Table.TransformColumnTypes(#"Remove columns", {{"SystemCreatedAt", type datetime}, {"SystemModifiedAt", type datetime}})
in
  #"Changed column type";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "PurchRcptLine_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared PurchRcptLine = let
  Source = OData.Feed(ODataLink, null, [Implementation = "2.0"]),
  Navigation = Source[PurchRcptLine],
   #"Remove columns" = Table.RemoveColumns(Navigation, Table.ColumnsOfType(Navigation, {type table, type record, type list, type nullable binary, type binary, type function})),
  #"Changed column type" = Table.TransformColumnTypes(#"Remove columns", {{"SystemCreatedAt", type datetime}, {"SystemModifiedAt", type datetime}})
in
  #"Changed column type";
shared Ubicazioni_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Ubicazioni", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared VendorList_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "VendorList", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Productorderheader_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Productorderheader", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared ItemLedgerEntry_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ItemLedgerEntry", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Productorderlines_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Productorderlines", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Purchreceiptlines_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Purchreceiptlines", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared PurchaseOrderLines_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "PurchaseOrderLines", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Itemunitofmeasure_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Itemunitofmeasure", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared ProductBOMline_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProductBOMline", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Purchreceiptheader_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Purchreceiptheader", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared ItemList_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ItemList", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Postedwarehouseheader_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Postedwarehouseheader", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared PurchaseOrderheader_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "PurchaseOrderheader", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Postedwarehouselines_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Postedwarehouselines", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared ProductBOMHeader_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "ProductBOMHeader", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared EOSproductfamily_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "EOSproductfamily", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared PurchaseInvoiceheader_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "PurchaseInvoiceheader", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Purchaseinvoicelines_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "Purchaseinvoicelines", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared VendorLedgerEntry_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "VendorLedgerEntry", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared CustLedgerEntry_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "CustLedgerEntry", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared PurchRcptLine_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "."]}[Data],
  Navigation_2 = Navigation_1{[lakehouseName = "lh_nappi"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "PurchRcptLine", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;

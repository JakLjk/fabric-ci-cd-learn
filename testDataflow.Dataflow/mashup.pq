[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "products_bikes csv_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"products_bikes csv" = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "9f314650-eae6-4b3e-a178-ea3a561dd3d2"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "3b229454-ced3-4044-8254-decde4592b7f"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 4" = #"Navigation 3"{[Name = "products_bikes.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 4", [Delimiter = ",", Columns = 4, QuoteStyle = QuoteStyle.None])
in
  #"Imported CSV";
shared #"products_bikes csv_DataDestination" = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "9f314650-eae6-4b3e-a178-ea3a561dd3d2"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "3b229454-ced3-4044-8254-decde4592b7f"]}[Data],
  TableNavigation = Navigation_2{[Id = "products_bikes csv", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;

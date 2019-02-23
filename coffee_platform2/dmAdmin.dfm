object dmAdminAccess: TdmAdminAccess
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 515
  Width = 641
  object SQLConnection1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Connected = True
    Left = 32
    Top = 24
    UniqueId = '{7E42381B-F0E4-48CC-B1DD-BAEA44A73F68}'
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 32
    Top = 72
  end
  object ProdQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'ProdQueryProvider'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 208
    object ProdQueryPRD_CODE: TIntegerField
      FieldName = 'PRD_CODE'
      Origin = 'PRD_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProdQueryBIZ_CODE: TIntegerField
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      Required = True
    end
    object ProdQueryTITLE: TWideStringField
      FieldName = 'TITLE'
      Origin = 'TITLE'
      Size = 120
    end
    object ProdQueryCONTENT: TWideStringField
      FieldName = 'CONTENT'
      Origin = 'CONTENT'
      Size = 400
    end
    object ProdQueryIMG: TBlobField
      FieldName = 'IMG'
      Origin = 'IMG'
    end
    object ProdQueryPRICE: TIntegerField
      FieldName = 'PRICE'
      Origin = 'PRICE'
    end
    object ProdQuerySTOCK: TIntegerField
      FieldName = 'STOCK'
      Origin = 'STOCK'
    end
  end
  object BizQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'BizQueryProvider'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 280
    object BizQueryBIZ_CODE: TIntegerField
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BizQuerySTORENM: TWideStringField
      FieldName = 'STORENM'
      Origin = 'STORENM'
      Required = True
      Size = 80
    end
    object BizQueryADDR: TWideStringField
      FieldName = 'ADDR'
      Origin = 'ADDR'
      Required = True
      Size = 200
    end
    object BizQueryTEL: TWideStringField
      FieldName = 'TEL'
      Origin = 'TEL'
      Size = 80
    end
    object BizQueryREG_DATE: TSQLTimeStampField
      FieldName = 'REG_DATE'
      Origin = 'REG_DATE'
    end
    object BizQueryINTRO: TWideStringField
      FieldName = 'INTRO'
      Origin = 'INTRO'
      Size = 400
    end
    object BizQueryAMENITY: TWideStringField
      FieldName = 'AMENITY'
      Origin = 'AMENITY'
      Size = 120
    end
    object BizQueryIMG_SIG: TBlobField
      FieldName = 'IMG_SIG'
      Origin = 'IMG_SIG'
    end
    object BizQueryCONTENT: TWideStringField
      FieldName = 'CONTENT'
      Origin = 'CONTENT'
      Size = 400
    end
    object BizQueryIMG_1: TBlobField
      FieldName = 'IMG_1'
      Origin = 'IMG_1'
    end
    object BizQueryIMG_2: TBlobField
      FieldName = 'IMG_2'
      Origin = 'IMG_2'
    end
    object BizQueryIMG_3: TBlobField
      FieldName = 'IMG_3'
      Origin = 'IMG_3'
    end
    object BizQueryIMG_4: TBlobField
      FieldName = 'IMG_4'
      Origin = 'IMG_4'
    end
    object BizQueryCPNSET: TIntegerField
      FieldName = 'CPNSET'
      Origin = 'CPNSET'
    end
  end
  object ProdQuerySource: TDataSource
    Left = 104
    Top = 208
  end
  object NotiQuerySource: TDataSource
    DataSet = NotiQuery
    Left = 104
    Top = 416
  end
  object ResvWaitQuerySource: TDataSource
    DataSet = ResvWaitQuery
    Left = 104
    Top = 344
  end
  object BizQuerySource: TDataSource
    DataSet = BizQuery
    Left = 104
    Top = 280
  end
  object ResvWaitQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'ResvWaitQueryProvider'
    RemoteServer = DSProviderConnection1
    OnCalcFields = ResvWaitQueryCalcFields
    OnNewRecord = ResvWaitQueryNewRecord
    Left = 32
    Top = 344
    object ResvWaitQueryST_DATE: TSQLTimeStampField
      DisplayLabel = #50696#50557#51068#51088
      DisplayWidth = 25
      FieldName = 'ST_DATE'
      Origin = 'ST_DATE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ResvWaitQueryPRD_CODE: TIntegerField
      DisplayLabel = #49345#54408#53076#46300
      FieldName = 'PRD_CODE'
      Origin = 'PRD_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object ResvWaitQueryPRD_NAME: TStringField
      DisplayLabel = #49345#54408#47749
      DisplayWidth = 9
      FieldKind = fkLookup
      FieldName = 'PRD_NAME'
      LookupDataSet = ProdQuery
      LookupKeyFields = 'PRD_CODE'
      LookupResultField = 'TITLE'
      KeyFields = 'PRD_CODE'
      Lookup = True
    end
    object ResvWaitQueryBIZ_CODE: TIntegerField
      DisplayLabel = #47588#51109#53076#46300
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      Required = True
      Visible = False
    end
    object ResvWaitQueryBIZ_NAME: TStringField
      DisplayLabel = #47588#51109#47749
      DisplayWidth = 13
      FieldKind = fkLookup
      FieldName = 'BIZ_NAME'
      LookupDataSet = BizQuery
      LookupKeyFields = 'BIZ_CODE'
      LookupResultField = 'STORENM'
      KeyFields = 'BIZ_CODE'
      Lookup = True
    end
    object ResvWaitQuerySALESCNT: TIntegerField
      DisplayLabel = #54032#47588#49688#47049
      DisplayWidth = 10
      FieldName = 'SALESCNT'
      Origin = 'SALESCNT'
    end
    object ResvWaitQueryCNT: TIntegerField
      DisplayLabel = #50696#50557#49688#47049
      DisplayWidth = 10
      FieldName = 'CNT'
      Origin = 'CNT'
    end
    object ResvWaitQueryED_DATE: TSQLTimeStampField
      DisplayLabel = #47560#44048#51068#51088
      DisplayWidth = 29
      FieldName = 'ED_DATE'
      Origin = 'ED_DATE'
    end
    object ResvWaitQuerySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 44
    end
    object ResvWaitQueryRESCNT: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RESCNT'
      Calculated = True
    end
  end
  object NotiQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'NotiQueryProvider'
    RemoteServer = DSProviderConnection1
    OnNewRecord = ResvWaitQueryNewRecord
    Left = 32
    Top = 416
  end
  object UserJoin: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'UserJoinProvider'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 144
    object UserJoinUSR_CODE: TIntegerField
      FieldName = 'USR_CODE'
      Origin = 'USR_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object UserJoinEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 120
    end
    object UserJoinPHONE: TWideStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 80
    end
    object UserJoinBIZ_CODE: TIntegerField
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      ProviderFlags = []
      ReadOnly = True
    end
    object UserJoinCHARGE: TIntegerField
      FieldName = 'CHARGE'
      Origin = 'CHARGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object UserJoinCPNCNT: TIntegerField
      FieldName = 'CPNCNT'
      Origin = 'CPNCNT'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end

object dmClientAccess: TdmClientAccess
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 578
  Width = 658
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 32
    Top = 88
  end
  object BizQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'BizQueryProvider'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 160
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
  object ResvWaitQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'ResvWaitQueryProvider'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 224
    object ResvWaitQueryST_DATE: TSQLTimeStampField
      FieldName = 'ST_DATE'
      Origin = 'ST_DATE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ResvWaitQueryPRD_NM: TStringField
      FieldKind = fkLookup
      FieldName = 'PRD_NM'
      LookupDataSet = ProdQuery
      LookupKeyFields = 'PRD_CODE'
      LookupResultField = 'TITLE'
      KeyFields = 'PRD_CODE'
      Lookup = True
    end
    object ResvWaitQueryPRD_CODE: TIntegerField
      FieldName = 'PRD_CODE'
      Origin = 'PRD_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object ResvWaitQueryBIZ_NM: TStringField
      FieldKind = fkLookup
      FieldName = 'BIZ_NM'
      LookupDataSet = BizQuery
      LookupKeyFields = 'BIZ_CODE'
      LookupResultField = 'STORENM'
      KeyFields = 'BIZ_CODE'
      Lookup = True
    end
    object ResvWaitQueryBIZ_CODE: TIntegerField
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      Required = True
      Visible = False
    end
    object ResvWaitQuerySALESCNT: TIntegerField
      FieldName = 'SALESCNT'
      Origin = 'SALESCNT'
    end
    object ResvWaitQueryCNT: TIntegerField
      FieldName = 'CNT'
      Origin = 'CNT'
    end
    object ResvWaitQuerySTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 44
    end
    object ResvWaitQueryED_DATE: TSQLTimeStampField
      FieldName = 'ED_DATE'
      Origin = 'ED_DATE'
    end
    object ResvWaitQueryPRD_CONTENT: TStringField
      FieldKind = fkLookup
      FieldName = 'PRD_CONTENT'
      LookupDataSet = ProdQuery
      LookupKeyFields = 'PRD_CODE'
      LookupResultField = 'CONTENT'
      KeyFields = 'PRD_CODE'
      Size = 0
      Lookup = True
    end
    object ResvWaitQueryPRD_IMG: TStringField
      FieldKind = fkLookup
      FieldName = 'PRD_IMG'
      LookupDataSet = ProdQuery
      LookupKeyFields = 'PRD_CODE'
      LookupResultField = 'IMG'
      KeyFields = 'PRD_CODE'
      Lookup = True
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 472
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 480
  end
  object UserJoin: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'UserJoinProvider'
    RemoteServer = DSProviderConnection1
    Left = 120
    Top = 232
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
    object UserJoinPW: TWideStringField
      FieldName = 'PW'
      Origin = 'PW'
      Required = True
      Size = 120
    end
    object UserJoinPHONE: TWideStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 80
    end
    object UserJoinREG_DATE: TSQLTimeStampField
      FieldName = 'REG_DATE'
      Origin = 'REG_DATE'
    end
    object UserJoinOUT_DATE: TSQLTimeStampField
      FieldName = 'OUT_DATE'
      Origin = 'OUT_DATE'
    end
    object UserJoinUSR_CODE_1: TIntegerField
      FieldName = 'USR_CODE_1'
      Origin = 'USR_CODE'
      ProviderFlags = []
      ReadOnly = True
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
  object NotiQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'NotiQueryProvider'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 352
  end
  object ProdQuery: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'ProdQueryProvider'
    RemoteServer = DSProviderConnection1
    Left = 32
    Top = 288
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
  object ResvWaitJoin: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'ResvWaitJoinProvider'
    RemoteServer = DSProviderConnection1
    Left = 120
    Top = 160
    object ResvWaitJoinST_DATE: TSQLTimeStampField
      FieldName = 'ST_DATE'
      Origin = 'ST_DATE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ResvWaitJoinPRD_CODE: TIntegerField
      FieldName = 'PRD_CODE'
      Origin = 'PRD_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ResvWaitJoinBIZ_CODE: TIntegerField
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      Required = True
    end
    object ResvWaitJoinSALESCNT: TIntegerField
      FieldName = 'SALESCNT'
      Origin = 'SALESCNT'
    end
    object ResvWaitJoinCNT: TIntegerField
      FieldName = 'CNT'
      Origin = 'CNT'
    end
    object ResvWaitJoinSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 44
    end
    object ResvWaitJoinED_DATE: TSQLTimeStampField
      FieldName = 'ED_DATE'
      Origin = 'ED_DATE'
    end
    object ResvWaitJoinTITLE: TWideStringField
      FieldName = 'TITLE'
      Origin = 'TITLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object ResvWaitJoinCONTENT: TWideStringField
      FieldName = 'CONTENT'
      Origin = 'CONTENT'
      ProviderFlags = []
      ReadOnly = True
      Size = 400
    end
    object ResvWaitJoinIMG: TBlobField
      FieldName = 'IMG'
      Origin = 'IMG'
      ProviderFlags = []
      ReadOnly = True
    end
    object ResvWaitJoinPRICE: TIntegerField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      ProviderFlags = []
      ReadOnly = True
    end
    object ResvWaitJoinSTOCK: TIntegerField
      FieldName = 'STOCK'
      Origin = 'STOCK'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object ResvJoin: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'USR_CODE'
        ParamType = ptInput
      end>
    ProviderName = 'ResvJoinProvider'
    RemoteServer = DSProviderConnection1
    Left = 208
    Top = 160
    object ResvJoinRES_DATE: TSQLTimeStampField
      FieldName = 'RES_DATE'
      Origin = 'RES_DATE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ResvJoinBIZ_CODE: TIntegerField
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      Required = True
    end
    object ResvJoinPRD_CODE: TIntegerField
      FieldName = 'PRD_CODE'
      Origin = 'PRD_CODE'
      Required = True
    end
    object ResvJoinUSR_CODE: TIntegerField
      FieldName = 'USR_CODE'
      Origin = 'USR_CODE'
      Required = True
    end
    object ResvJoinCNT: TIntegerField
      FieldName = 'CNT'
      Origin = 'CNT'
    end
    object ResvJoinTITLE: TWideStringField
      FieldName = 'TITLE'
      Origin = 'TITLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object ResvJoinCONTENT: TWideStringField
      FieldName = 'CONTENT'
      Origin = 'CONTENT'
      ProviderFlags = []
      ReadOnly = True
      Size = 400
    end
    object ResvJoinIMG: TBlobField
      FieldName = 'IMG'
      Origin = 'IMG'
      ProviderFlags = []
      ReadOnly = True
    end
    object ResvJoinPRICE: TIntegerField
      FieldName = 'PRICE'
      Origin = 'PRICE'
      ProviderFlags = []
      ReadOnly = True
    end
    object ResvJoinSTOCK: TIntegerField
      FieldName = 'STOCK'
      Origin = 'STOCK'
      ProviderFlags = []
      ReadOnly = True
    end
    object ResvJoinKEY_DATE: TSQLTimeStampField
      FieldName = 'KEY_DATE'
      Origin = 'KEY_DATE'
    end
    object ResvJoinPHONE: TWideStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
  end
  object ChannelManager1: TDSClientCallbackChannelManager
    DSHostname = 'localhost'
    DSPort = '211'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'MemoChannel'
    ManagerId = '333178.122337.605957'
    Left = 544
    Top = 48
  end
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
    UniqueId = '{674498C1-0449-4DF8-877C-D91270E606AF}'
  end
end

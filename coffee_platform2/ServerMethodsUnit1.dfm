object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 689
  Width = 755
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=Coffee')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object ResvQuery: TFDQuery
    Active = True
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_RESV'
      'WHERE USR_CODE = :USR_CODE AND BIZ_CODE = 2')
    Left = 32
    Top = 152
    ParamData = <
      item
        Name = 'USR_CODE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object InsResvWaitQuery: TFDQuery
    CachedUpdates = True
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'INSERT INTO TB_RESV_WAIT '
      '(ST_DATE, PRD_CODE, BIZ_CODE, SALESCNT)'
      'VALUES'
      '(CURRENT_TIMESTAMP, :PRD_CODE, :BIZ_CODE, :SALESCNT)')
    Left = 224
    Top = 88
    ParamData = <
      item
        Name = 'PRD_CODE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BIZ_CODE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SALESCNT'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object SignUpQuery: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'INSERT INTO TB_BIZ '
      '(BIZ_NUM, PW, STORENM, ADDR)'
      'VALUES '
      '(:BIZ_NUM, :PW, :STORENM, :ADDR);')
    Left = 152
    Top = 24
    ParamData = <
      item
        Name = 'BIZ_NUM'
        DataType = ftWideString
        ParamType = ptInput
        Size = 48
        Value = Null
      end
      item
        Name = 'PW'
        DataType = ftWideString
        ParamType = ptInput
        Size = 200
      end
      item
        Name = 'STORENM'
        DataType = ftWideString
        ParamType = ptInput
        Size = 80
      end
      item
        Name = 'ADDR'
        DataType = ftWideString
        ParamType = ptInput
        Size = 200
      end>
  end
  object ResvWaitQuery: TFDQuery
    Active = True
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_RESV_WAIT'
      'WHERE BIZ_CODE = 2 and status is null')
    Left = 32
    Top = 88
  end
  object SignInQuery: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_BIZ'
      'WHERE BIZ_NUM = :BIZ_NUM AND PW = :PW')
    Left = 224
    Top = 24
    ParamData = <
      item
        Name = 'BIZ_NUM'
        DataType = ftWideString
        ParamType = ptInput
        Size = 48
        Value = Null
      end
      item
        Name = 'PW'
        DataType = ftWideString
        ParamType = ptInput
        Size = 200
      end>
  end
  object ResReq1_I: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'INSERT INTO TB_RESV'
      '(RES_DATE, BIZ_CODE, PRD_CODE, USR_CODE, CNT, KEY_DATE)'
      'VALUES'
      
        '(CURRENT_TIMESTAMP, :BIZ_CODE, :PRD_CODE, :USR_CODE, :CNT, :KEY_' +
        'DATE)')
    Left = 480
    Top = 336
    ParamData = <
      item
        Name = 'BIZ_CODE'
        ParamType = ptInput
      end
      item
        Name = 'PRD_CODE'
        ParamType = ptInput
      end
      item
        Name = 'USR_CODE'
        ParamType = ptInput
      end
      item
        Name = 'CNT'
        ParamType = ptInput
      end
      item
        Name = 'KEY_DATE'
        ParamType = ptInput
      end>
  end
  object ResReq2_U: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'UPDATE TB_RESV_WAIT'
      'SET CNT = CNT + :CNT, SALESCNT = SALESCNT - :CNT'
      'WHERE'
      'ST_DATE = :KEY_DATE AND PRD_CODE = :PRD_CODE')
    Left = 552
    Top = 336
    ParamData = <
      item
        Name = 'CNT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'KEY_DATE'
        ParamType = ptInput
      end
      item
        Name = 'PRD_CODE'
        ParamType = ptInput
      end>
  end
  object ResApply1_U: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'UPDATE TB_RESV_WAIT'
      'SET STATUS = '#39'Y'#39
      'WHERE ST_DATE = :ST_DATE AND PRD_CODE = :PRD_CODE')
    Left = 480
    Top = 496
    ParamData = <
      item
        Name = 'ST_DATE'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PRD_CODE'
        ParamType = ptInput
      end>
  end
  object ResCncl1_D: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'DELETE FROM TB_RESV'
      'WHERE RES_DATE = :RES_DATE')
    Left = 480
    Top = 416
    ParamData = <
      item
        Name = 'RES_DATE'
        ParamType = ptInput
      end>
  end
  object ResApply2_I: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'INSERT INTO TB_HIS'
      '(HIS_DATE, BIZ_CODE, USR_CODE, PRD_CODE, CNT)'
      '(SELECT CURRENT_TIMESTAMP, BIZ_CODE, USR_CODE, PRD_CODE, CNT'
      'FROM TB_RESV'
      
        'WHERE BIZ_CODE = 2 AND KEY_DATE = :ST_DATE AND PRD_CODE = :PRD_C' +
        'ODE)')
    Left = 552
    Top = 496
    ParamData = <
      item
        Name = 'ST_DATE'
        ParamType = ptInput
      end
      item
        Name = 'PRD_CODE'
        ParamType = ptInput
      end>
  end
  object ResCncl2_U: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'UPDATE TB_RESV_WAIT'
      'SET CNT = CNT - :CNT, SALESCNT = SALESCNT + :CNT'
      'WHERE'
      'ST_DATE = :KEY_DATE AND PRD_CODE = :PRD_CODE'
      '-- BIZ_CODE = :BIZ_CODE AND PRD_CODE = :PRD_CODE'
      '-- '#50696#50808#49345#54889' '#49373#44033#54644#50556' '#54632'. '#54788#51116' '#50629#45936#51060#53944' '#51473#48373' '#44032#45733#49457' '#51080#51020', '#45824#44592#50676' '#45216#51676' <> '#50696#50557#47532#49828#53944' '#45216#51676
      '-- TB_RESV('#50696#50557#53580#51060#48660#50640' '#45824#44592#50676' '#53412#44050' '#51200#51109' '#54596#46300' '#52628#44032#54616#50668' '#51076#49884' '#54644#44208#54632')'
      ''
      ''
      '')
    Left = 552
    Top = 416
    ParamData = <
      item
        Name = 'CNT'
        ParamType = ptInput
      end
      item
        Name = 'KEY_DATE'
        ParamType = ptInput
      end
      item
        Name = 'PRD_CODE'
        ParamType = ptInput
      end>
  end
  object ResApply3_D: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'DELETE FROM TB_RESV'
      'WHERE KEY_DATE = :ST_DATE AND PRD_CODE = :PRD_CODE')
    Left = 624
    Top = 496
    ParamData = <
      item
        Name = 'ST_DATE'
        ParamType = ptInput
      end
      item
        Name = 'PRD_CODE'
        ParamType = ptInput
      end>
  end
  object ResApply4_U: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'UPDATE TB_PROD'
      'SET STOCK = STOCK - :CNT'
      'WHERE'
      'BIZ_CODE = 2 AND PRD_CODE = :PRD_CODE')
    Left = 696
    Top = 496
    ParamData = <
      item
        Name = 'CNT'
        ParamType = ptInput
      end
      item
        Name = 'PRD_CODE'
        ParamType = ptInput
      end>
  end
  object SignUpUserQuery: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'INSERT INTO TB_USER'
      '(EMAIL, PW, PHONE)'
      'VALUES'
      '(:EMAIL, :PW, :PHONE)')
    Left = 304
    Top = 24
    ParamData = <
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'PW'
        ParamType = ptInput
      end
      item
        Name = 'PHONE'
        ParamType = ptInput
      end>
  end
  object SignInUserQuery: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_USER'
      'WHERE EMAIL = :EMAIL AND PW = :PW')
    Left = 376
    Top = 24
    ParamData = <
      item
        Name = 'EMAIL'
        ParamType = ptInput
      end
      item
        Name = 'PW'
        ParamType = ptInput
      end>
  end
  object SignInQueryProvider: TDataSetProvider
    Left = 448
    Top = 24
  end
  object ProdQueryProvider: TDataSetProvider
    DataSet = ProdQuery
    Left = 104
    Top = 224
  end
  object ProdQuery: TFDQuery
    Active = True
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_PROD'
      'WHERE BIZ_CODE = 2')
    Left = 32
    Top = 224
  end
  object RestWaitProvider: TDataSetProvider
    DataSet = ResvWaitQuery
    Left = 104
    Top = 152
  end
  object BizQueryProvider: TDataSetProvider
    DataSet = BizQuery
    Left = 104
    Top = 296
  end
  object NotiQueryProvider: TDataSetProvider
    DataSet = NotiQuery
    Left = 104
    Top = 440
  end
  object ResvWaitQueryProvider: TDataSetProvider
    DataSet = ResvWaitQuery
    Left = 104
    Top = 88
  end
  object BizQuery: TFDQuery
    Active = True
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_BIZ'
      'WHERE BIZ_CODE = 2'
      '')
    Left = 32
    Top = 296
  end
  object NotiQuery: TFDQuery
    Active = True
    OnNewRecord = NotiQueryNewRecord
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_NOTI'
      'WHERE BIZ_CODE = 2'
      'ORDER BY REG_DATE DESC')
    Left = 32
    Top = 440
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 688
    Top = 16
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 688
    Top = 80
  end
  object UserTable: TFDTable
    Active = True
    IndexFieldNames = 'USR_CODE'
    ConnectionName = 'Coffee'
    UpdateOptions.UpdateTableName = 'TB_USER'
    TableName = 'TB_USER'
    Left = 32
    Top = 376
    object UserTableUSR_CODE: TIntegerField
      FieldName = 'USR_CODE'
      Origin = 'USR_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object UserTableEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 120
    end
    object UserTablePW: TWideStringField
      FieldName = 'PW'
      Origin = 'PW'
      Required = True
      Size = 120
    end
    object UserTablePHONE: TWideStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 80
    end
    object UserTableREG_DATE: TSQLTimeStampField
      FieldName = 'REG_DATE'
      Origin = 'REG_DATE'
    end
    object UserTableOUT_DATE: TSQLTimeStampField
      FieldName = 'OUT_DATE'
      Origin = 'OUT_DATE'
    end
  end
  object ResvWaitJoin: TFDQuery
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'select * from tb_resv_wait as a'
      'inner join tb_prod as b'
      'on a.prd_code = b.prd_code'
      'where a.biz_code = 2 and status is null')
    Left = 200
    Top = 152
  end
  object ResvWaitJoinProvider: TDataSetProvider
    DataSet = ResvWaitJoin
    Left = 296
    Top = 152
  end
  object UserTableProvider: TDataSetProvider
    DataSet = UserTable
    Left = 104
    Top = 376
  end
  object UserJoin: TFDQuery
    Active = True
    ConnectionName = 'Coffee'
    UpdateObject = usUserJoin
    SQL.Strings = (
      'SELECT * FROM TB_USER AS A'
      'LEFT JOIN TB_USER_DETAIL AS B'
      'ON A.USR_CODE = B.USR_CODE'
      'WHERE B.BIZ_CODE = 2'
      'ORDER BY A.REG_DATE')
    Left = 200
    Top = 296
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
      AutoGenerateValue = arDefault
      FieldName = 'USR_CODE_1'
      Origin = 'USR_CODE'
      ProviderFlags = []
      ReadOnly = True
    end
    object UserJoinBIZ_CODE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      ProviderFlags = []
      ReadOnly = True
    end
    object UserJoinCHARGE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CHARGE'
      Origin = 'CHARGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object UserJoinCPNCNT: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CPNCNT'
      Origin = 'CPNCNT'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object UserJoinProvider: TDataSetProvider
    DataSet = UserJoin
    Left = 296
    Top = 296
  end
  object ResvJoin: TFDQuery
    Active = True
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'SELECT * FROM TB_RESV AS A'
      'INNER JOIN TB_PROD AS B'
      'INNER JOIN TB_USER AS C'
      'ON A.PRD_CODE = B.PRD_CODE'
      'ON A.USR_CODE = C.USR_CODE'
      'WHERE USR_CODE = :USR_CODE'
      'ORDER BY A.RES_DATE DESC')
    Left = 200
    Top = 224
    ParamData = <
      item
        Name = 'USR_CODE'
        DataType = ftInteger
        ParamType = ptInput
      end>
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
      AutoGenerateValue = arDefault
      FieldName = 'TITLE'
      Origin = 'TITLE'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object ResvJoinCONTENT: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTENT'
      Origin = 'CONTENT'
      ProviderFlags = []
      ReadOnly = True
      Size = 400
    end
    object ResvJoinIMG: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'IMG'
      Origin = 'IMG'
      ProviderFlags = []
      ReadOnly = True
    end
    object ResvJoinPRICE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE'
      Origin = 'PRICE'
      ProviderFlags = []
      ReadOnly = True
    end
    object ResvJoinSTOCK: TIntegerField
      AutoGenerateValue = arDefault
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
      AutoGenerateValue = arDefault
      FieldName = 'PHONE'
      Origin = 'PHONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
  end
  object ResvJoinProvider: TDataSetProvider
    DataSet = ResvJoin
    Left = 296
    Top = 224
  end
  object FDQuery1: TFDQuery
    IndexFieldNames = 'USR_CODE'
    ConnectionName = 'Coffee'
    SQL.Strings = (
      'INSERT INTO TB_HIS'
      '(HIS_DATE, BIZ_CODE, USR_CODE, PRD_CODE, CNT)'
      '(SELECT CURRENT_TIMESTAMP, BIZ_CODE, USR_CODE, PRD_CODE, CNT'
      'FROM TB_RESV'
      
        'WHERE BIZ_CODE = 2 AND KEY_DATE = :ST_DATE AND PRD_CODE = :PRD_C' +
        'ODE)')
    Left = 496
    Top = 200
    ParamData = <
      item
        Name = 'ST_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 43510.5d
      end
      item
        Name = 'PRD_CODE'
        DataType = ftString
        ParamType = ptInput
        Value = '2'
      end>
    object IntegerField1: TIntegerField
      FieldName = 'USR_CODE'
      Origin = 'USR_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 120
    end
    object WideStringField2: TWideStringField
      FieldName = 'PW'
      Origin = 'PW'
      Required = True
      Size = 120
    end
    object WideStringField3: TWideStringField
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 80
    end
    object SQLTimeStampField1: TSQLTimeStampField
      FieldName = 'REG_DATE'
      Origin = 'REG_DATE'
    end
    object SQLTimeStampField2: TSQLTimeStampField
      FieldName = 'OUT_DATE'
      Origin = 'OUT_DATE'
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'USR_CODE_1'
      Origin = 'USR_CODE'
      ProviderFlags = []
      ReadOnly = True
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'BIZ_CODE'
      Origin = 'BIZ_CODE'
      ProviderFlags = []
      ReadOnly = True
    end
    object IntegerField4: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CHARGE'
      Origin = 'CHARGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object IntegerField5: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CPNCNT'
      Origin = 'CPNCNT'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object usUserJoin: TFDUpdateSQL
    Connection = FDConnection1
    ConnectionName = 'Coffee'
    Left = 376
    Top = 296
  end
  object UserJoinUpdate1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'UPDATE TB_USER_DETAIL'
      'SET CPNCNT = CPNCNT + :CPNCNT '
      'WHERE USR_CODE = :USR_CODE AND BIZ_CODE = :BIZ_CODE')
    Left = 296
    Top = 360
    ParamData = <
      item
        Name = 'CPNCNT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'USR_CODE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BIZ_CODE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UserJoinUpdate2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'UPDATE TB_USER_DETAIL'
      'SET CHARGE = CHARGE + :CHARGE '
      'WHERE USR_CODE = :USR_CODE AND BIZ_CODE = :BIZ_CODE')
    Left = 296
    Top = 424
    ParamData = <
      item
        Name = 'CHARGE'
        ParamType = ptInput
      end
      item
        Name = 'USR_CODE'
        ParamType = ptInput
      end
      item
        Name = 'BIZ_CODE'
        ParamType = ptInput
      end>
  end
end

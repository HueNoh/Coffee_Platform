unit CommonFunctions;

interface

uses
  Data.DB, System.Classes, Vcl.Graphics,
  Vcl.ExtCtrls;

// 이미지 파일경로(AFileName)로 이미지(AImage) 로드
procedure LoadImageFromFile(AImage: TImage; AFileName: string);

// Blob필드에서 이미지(AImage) 로드
procedure LoadImageFromBlobField(AImage: TImage; ABlobField: TBlobField);

// Blob필드로 이미지 저장
procedure SaveImageToBlobField(AImage: TImage; ABlobField: TBlobField);


implementation

uses
  System.IOUtils, System.SysUtils;

procedure LoadImageFromFile(AImage: TImage; AFileName: string);
var
  wic: TWICImage; // Microsoft Windows Imaging Component
                  // 다양한 포맷의 이미지 로드가능
begin
  if not TFile.Exists(AFileName) then
    Exit;

  AImage.Picture.Assign(nil);
  wic := TWICImage.Create;
  try
    wic.LoadFromFile(AFileName);
    AImage.Picture.Assign(wic);
  finally
    wic.Free;
  end;
end;

procedure LoadImageFromBlobField(AImage: TImage; ABlobField: TBlobField);
var
  wic: TWICImage; // Microsoft Windows Imaging Component
  Stream: TMemoryStream;
begin
  AImage.Picture.Assign(nil);

  if ABlobField.BlobSize = 0 then
    Exit;

  Stream := TMemoryStream.Create;
  wic := TWICImage.Create;
  try
    ABlobField.SaveToStream(Stream);
    if Stream.Size > 0 then
    begin
      try
        wic.LoadFromStream(Stream);
        AImage.Picture.Assign(wic);
      except
      end;
    end;
  finally
    Stream.Free;
    wic.Free;
  end;
end;

procedure SaveImageToBlobField(AImage: TImage; ABlobField: TBlobField);
var
  wic: TWICImage; // Microsoft Windows Imaging Component
  Stream: TMemoryStream;
begin
  wic := TWICImage.Create;
  Stream := TMemoryStream.Create;

//      case wic.ImageFormat of
//    wifBmp:
//      begin
//        filter := '비트맵(*.bmp)|*.bmp';
//        Filename := 'image.bmp';
//      end;
//    wifPng:
//      begin
//        filter := 'PNG(*.png)|*.png';
//        Filename := 'image.png';
//      end;
//    wifJpeg:
//      begin
//        filter := 'JPEG(*.jpg)|*.jpg';
//        Filename := 'image.jpg';
//      end;
//    wifGif:
//      begin
//        filter := 'GIF(*.gif)|*.gif';
//        Filename := 'image.gif';
//      end;
//    else
//      begin
//        ShowMessage('지원하지 않는 이미지 포맷입니다');
//        Exit;
//      end;
//    end;

  try
    wic.Assign(AImage.Picture);
    wic.SaveToStream(stream);
    if ABlobField.DataSet.State = dsBrowse then
      if ABlobField.DataSet.RecNo > 0 then
        ABlobField.DataSet.Edit
      else
        ABlobField.DataSet.Append;

    ABlobField.LoadFromStream(Stream);
  finally
    Stream.Free;
    wic.Free;
  end;
end;

end.

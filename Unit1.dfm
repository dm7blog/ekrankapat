object Form1: TForm1
  Left = 560
  Top = 299
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Ekran Kapat'
  ClientHeight = 39
  ClientWidth = 161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 9
    Top = 7
    Width = 146
    Height = 25
    Caption = 'Ekran Kapat '
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object XPManifest1: TXPManifest
    Left = 120
    Top = 8
  end
end

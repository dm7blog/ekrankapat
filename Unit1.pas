unit Unit1;

interface

uses
  Windows, Messages, Classes, Forms, StdCtrls, Controls, ExtCtrls, SysUtils,
  Buttons, XPMan;

type
  TDurum=(drNormal, drBastaKapat, drBastaKapatCik);
  TForm1 = class(TForm)
    BitBtn1:TBitBtn;
    XPManifest1: TXPManifest;
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Yardim;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  bastakapat:Tdurum;
  bastayardim:Boolean;
  Timer1:TTimer;

implementation

{$R *.dfm}

Procedure TForm1.BitBtn1Click(Sender: TObject);
Begin
 SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
End;

Procedure TForm1.Timer1Timer(Sender: TObject);
Begin
 Timer1.Enabled := False; Timer1.Free;
 if (bastakapat <> drNormal) then BitBtn1Click(Sender);
 if bastayardim then Yardim;
 if bastakapat = drBastaKapatCik then Close;
End;

Procedure Tform1.Yardim;
Begin
Application.MessageBox('/bastakapat : Ýlk çalýþmada ekran kapatýlýr'
 + #13#10 + '/bastakapatcik : Ýlk çalýþmada ekran kapatýlýr ve programdan çýkar'
 + #13#10 + '/? : Bu Yardým', 'Program baþlangýç parametreleri', MB_OK + MB_ICONINFORMATION);
End;

Procedure TForm1.FormCreate(Sender: TObject);
Var i: Integer;
Begin
 Timer1 := TTimer.Create(Form1);
 Timer1.Interval := 10;
 Timer1.OnTimer := Timer1Timer;
 bastakapat := drNormal;  bastayardim := False;
 for i := 1 to ParamCount do begin
  if LowerCase(ParamStr(i)) = '/?' then bastayardim := True;
  if LowerCase(ParamStr(i)) = '/bastakapat' then bastakapat := drBastaKapat;
  if LowerCase(ParamStr(i)) = '/bastakapatcik' then bastakapat := drBastaKapatCik;
 End;
End;

End.

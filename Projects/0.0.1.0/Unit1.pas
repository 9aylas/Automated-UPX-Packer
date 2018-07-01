unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, bsSkinData, BusinessSkinForm,
  bsSkinCtrls, Vcl.StdCtrls, Vcl.Mask, bsSkinBoxCtrls, bsSkinShellCtrls,
  ShellApi;

type
  TForm1 = class(TForm)
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    bsSkinButton1: TbsSkinButton;
    exefile: TbsSkinEdit;
    level: TbsSkinRadioGroup;
    packit: TbsSkinButton;
    op: TbsSkinOpenDialog;
    about: TbsSkinButton;
    bsSkinStdLabel1: TbsSkinStdLabel;
    resultpk: TbsSkinEdit;
    procedure aboutClick(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
    procedure packitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  filename: string;

implementation

{$R *.dfm}

procedure TForm1.aboutClick(Sender: TObject);
begin
  with Application do
  begin
    NormalizeTopMosts;
    MessageBox('Author : 9aylas' +#13#10+ 'Version : 0.0.1.0 Release' +#13#10+ 'Greet''s to AX302 & All...', 'Automated UPX Packer', MB_OK);    // [smbOK]
    RestoreTopMosts;
  end;
end;

procedure TForm1.bsSkinButton1Click(Sender: TObject);
begin
  op.Execute;
  filename := op.filename;
  exefile.text := filename;
end;
procedure TForm1.packitClick(Sender: TObject);
begin
  if exefile.text = '' then
  begin
    showmessage(' Error , The executable file was not loaded correctly.');
  end

  else

  begin

    case level.ItemIndex of
      0:
        ShellExecute(0, nil, 'cmd.exe',
          PWideChar('/C upx.exe -1 ' + filename + ' -o ' + resultpk.text),
          nil, SW_HIDE);
      1:
          ShellExecute(0, nil, 'cmd.exe',
          PWideChar('/C upx.exe -5 ' + filename + ' -o ' + resultpk.text),
          nil, SW_HIDE);
      2:
        ShellExecute(0, nil, 'cmd.exe',
          PWideChar('/C upx.exe -9 ' + filename + ' -o ' + resultpk.text),
          nil, SW_HIDE);
      end;

    end;


end;
end.

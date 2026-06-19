unit unit_login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ZConnection,
  ZDataset;

type

  { TFormLogin }

  TFormLogin = class(TForm)
    ButtonEntrar: TButton;
    ButtonCadastrar: TButton;
    EditEmail: TEdit;
    EditSenha: TEdit;
    GroupBoxLogin: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Conn_Biblioteca: TZConnection;
    QueryLogin: TZQuery;
    procedure ButtonCadastrarClick(Sender: TObject);
    procedure ButtonEntrarClick(Sender: TObject);
  private

  public

  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.lfm}

uses unit_leituras, unit_usuarios;

{ TFormLogin }

procedure TFormLogin.ButtonEntrarClick(Sender: TObject);
begin
     QueryLogin.close;
     QueryLogin.ParamByName('email').AsString := EditEmail.Text;
     QueryLogin.ParamByName('senha').AsString := EditSenha.Text;
     QueryLogin.open;

     if not QueryLogin.IsEmpty then
        begin
          messagedlg('Login realizado com sucesso!', mtInformation, [mbOK], 0);

          FormLeituras.Show;
          Self.Hide;
        end
     else
         begin
           messagedlg('Usuário ou senha incorretos!', mtError, [mbOK], 0);

           EditEmail.clear;
           EditSenha.clear;
         end;
end;

procedure TFormLogin.ButtonCadastrarClick(Sender: TObject);
begin
    FormCadastro.Show;
    Self.Hide;
end;

end.


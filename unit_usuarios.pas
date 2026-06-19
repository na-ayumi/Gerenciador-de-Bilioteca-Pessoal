unit unit_usuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ZDataset;

type

  { TFormCadastro }

  TFormCadastro = class(TForm)
    ButtonCancelar: TButton;
    ButtonCadastrar: TButton;
    EditNome: TEdit;
    EditEmailUsuario: TEdit;
    EditSenhaUsuario: TEdit;
    EditConfirmarSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ZQueryInserirUsuario: TZQuery;
    ZQueryVerificarEmail: TZQuery;
    procedure ButtonCadastrarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private

  public

  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.lfm}

uses unit_login;

{ TFormCadastro }

procedure TFormCadastro.ButtonCadastrarClick(Sender: TObject);
begin
     if Trim(EditNome.text) = '' then
        begin
          ShowMessage('Informe o nome.');
          EditNome.SetFocus;
        end;

     if Trim(EditEmailUsuario.text) = '' then
        begin
          ShowMessage('Informe o e-mail.');
          EditEmailUsuario.SetFocus;
        end;

     if Trim(EditSenhaUsuario.text) = '' then
        begin
          ShowMessage('Informe a senha.');
          EditSenhaUsuario.SetFocus;
        end;

     if EditSenhaUsuario.text <> EditConfirmarSenha.text then
        begin
          ShowMessage('As senhas não conferem.');
          EditConfirmarSenha.SetFocus;
        end;

     ZQueryVerificarEmail.Close;
     ZQueryVerificarEmail.ParamByName('email').AsString := EditEmailUsuario.Text;
     ZQueryVerificarEmail.Open;

     if not ZQueryVerificarEmail.IsEmpty then
        begin
           messagedlg('E-mail já cadastrado!', mtError, [mbOK], 0);
        end;

     ZQueryInserirUsuario.Close;
     ZQueryInserirUsuario.ParamByName('nome').AsString := EditNome.Text;
     ZQueryInserirUsuario.ParamByName('email').AsString := EditEmailUsuario.Text;
     ZQueryInserirUsuario.ParamByName('senha').AsString := EditSenhaUsuario.Text;
     ZQueryInserirUsuario.Open;

     ZQueryInserirUsuario.ExecSQL;
     messagedlg('Cadastro realizado com sucesso!', mtInformation, [mbOK], 0);

     FormCadastro.Close;
end;

procedure TFormCadastro.ButtonCancelarClick(Sender: TObject);
begin
  FormCadastro.Close;
  FormLogin.Show;
end;


end.


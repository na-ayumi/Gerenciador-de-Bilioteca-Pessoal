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
  private

  public

  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.lfm}

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
end;

end.


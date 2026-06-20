unit unit_leituras;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TFormLeituras }

  TFormLeituras = class(TForm)
    Adicionar: TButton;
    procedure AdicionarClick(Sender: TObject);
  private

  public

  end;

var
  FormLeituras: TFormLeituras;

implementation

{$R *.lfm}

uses unit_livros;

{ TFormLeituras }

procedure TFormLeituras.AdicionarClick(Sender: TObject);
begin
    FormLivros.Show;
end;

end.


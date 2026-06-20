unit unit_livros;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Iphttpbroker,
  fphttpclient, fpjson, jsonparser, opensslsockets;

type

  { TFormLivros }

  TFormLivros = class(TForm)
    ButtonBuscar: TButton;
    EditBuscar: TEdit;
    ScrollBoxLivros: TScrollBox;
    procedure ButtonBuscarClick(Sender: TObject);
  private

  public

  end;

var
  FormLivros: TFormLivros;

implementation

{$R *.lfm}

{ TFormLivros }

procedure TFormLivros.ButtonBuscarClick(Sender: TObject);
var
   Http: TFPHTTPClient;
   Resposta: String;
begin
   Http := TFPHTTPClient.Create(nil);

   try
     Resposta := Http.get(
     'https://www..googleapis.com/books/v1/volumes?q=' +
      StringReplace(EditBuscar.Text, ' ', '+', [rfReplaceAll]));

     ShowMessage(Copy(Resposta,1,500));

   finally
     Http.Free;
   end;
end;

end.


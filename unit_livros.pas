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

const
  GOOGLE_API_KEY = 'AIzaSyD0ezY95GczE2AGmr78RSna51bVrXUI-YE';

implementation

{$R *.lfm}

{ TFormLivros }

procedure TFormLivros.ButtonBuscarClick(Sender: TObject);
var
   Http: TFPHTTPClient;
   Resposta: String;
   URL: String;
begin
   Http := TFPHTTPClient.Create(nil);

   try
     URL :=(
     'https://www..googleapis.com/books/v1/volumes?q=' +
      StringReplace(EditBuscar.Text, ' ', '+', [rfReplaceAll]) + '&key=' +
      GOOGLE_API_KEY);

     Resposta := Http.Get(URL);

     ShowMessage(Copy(Resposta,1,500));

   finally
     Http.Free;
   end;
end;

end.


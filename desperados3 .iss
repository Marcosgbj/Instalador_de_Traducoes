#define MyAppName "Tradução Desperados 3 v2.0"
#define MyAppVersion "2.0"
#define MyAppPublisher "JUNIORGBJ"
#define MyAppURL "https://github.com/JUNIORGBJ/DESPERADOS_3_PT-BR"
#define SplS "1500"
#define SplR "3000"
#define SplE "1500"

[Setup]
AppId={{EE2317BF-2C30-4780-ADE1-3A5F597C4D31}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=Traduções gBj
AppVerName=Tradução Desperados 3
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=true
LicenseFile=C:\GBJ\Termo de Uso.txt
InfoBeforeFile=C:\GBJ\Créditos dos Tradutores.txt
SetupIconFile=C:\GBJ\Desperados III.ico
DisableDirPage=true

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Files]
Source: "isgsg.dll"; Flags: "DontCopy";
Source: "splash.png"; Flags: "DontCopy";
Source: C:\GBJ\keyboard\*; DestDir: {code:CopyDir}\Desperados III_Data\StreamingAssets\keyboard; Flags: ignoreversion recursesubdirs createallsubdirs
Source: C:\GBJ\loca\*; DestDir: {code:CopyDir}\Desperados III_Data\StreamingAssets\loca; Flags: ignoreversion recursesubdirs createallsubdirs

[Code]
//Layout do Botão Projetos//
var
  Website: TNewButton;

procedure WebsiteClick(Sender: TObject); forward;
procedure RedesignWizardForm;
begin
  Website := TNewButton.Create(WizardForm);
  with Website do
  begin
    Name := 'Projetos';
    Parent := WizardForm;
    Left := ScaleX(10);
    Top := ScaleY(328);
    Width := ScaleX(75);
    Height := ScaleY(23);
    OnClick := @WebsiteClick;
  end;

  Website.TabOrder := 5;
end;

//Clique do Botão Projetos//
procedure WebsiteClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
ShellExecAsOriginalUser('open', 'https://github.com/JUNIORGBJ?tab=repositories', '', '', SW_SHOWNORMAL, ewNoWait,ErrorCode);
end;

//Código do SplashScreen//
procedure ShowSplashScreen(p1:HWND;p2:string;p3,p4,p5,p6,p7:integer;p8:boolean;p9:Cardinal;p10:integer); external 'ShowSplashScreen@files:isgsg.dll stdcall delayload';
procedure RunSplash();
begin
 ExtractTemporaryFile('splash.png');
 ShowSplashScreen(WizardForm.Handle,ExpandConstant('{tmp}')+'\splash.png',{#SplS},{#SplR},{#SplE},0,255,False,$FFFFFF,10);
end;

//Código pasta de Instalação//
var
  CopyDirPage: TInputDirWizardPage;

procedure InitializeWizard;
begin
  RedesignWizardForm;
  CopyDirPage :=
    CreateInputDirPage(wpSelectDir, 'Selecionar local de instalação', '',  '', False, '');
  CopyDirPage.Add('Use a pasta padrão Steam ou procure a pasta onde contém o arquivo "Desperados III.exe"');
  CopyDirPage.Values[0] := ExpandConstant('{pf32}\Steam\steamapps\common\Desperados III');
  begin
  RunSplash();
  end;
end;

//Codigo Sair do Instalador//
procedure ExitProcess(exitCode:integer);
 external 'ExitProcess@kernel32.dll stdcall';

function CopyDir(Params: string): string;
begin
  Result := CopyDirPage.Values[0];
end;

//Mensagem de Arquivo não encontrado//
procedure CurStepChanged(CurStep: TSetupStep);
begin
 if CurStep = ssInstall then
  begin
   if not FileExists(ExpandConstant(CopyDirPage.Values[0] + '\Desperados III.exe')) then
    begin
     MsgBox('O executável Desperados III.exe não foi encontrado nessa pasta. Rode a instalação novamente apontando para a pasta correta.', mbError, MB_OK);
     ExitProcess(7);
    end;
  end;
end;

[Messages]
BeveledLabel=‹Traduções gBj›
WizardLicense=Termos de Uso
LicenseLabel3=Por favor leia o seguinte Termo de Uso. Você deve aceitar os termos de uso antes de continuar com a instalação.
LicenseAccepted=Eu &aceito os termos
LicenseNotAccepted=Eu &não aceito os termos
WizardInfoBefore=Créditos da Tradução
WelcomeLabel1=Bem-vindo ao instalador da Tradução de Desperados 3
WelcomeLabel2=Este assistente guiará você através da instalação da [name/ver] em seu computador. Para continuar, clique em Avançar.
ClickNext=AVISO: É recomendado que você feche o jogo e faça um BACKUP dos arquivos da pasta \Desperados III_Data\StreamingAssets\loca antes de iniciar a Instalação. Isto tornará possível atualizar ou restaurar os arquivos do jogo sem nenhum problema.
ReadyLabel1=O instalador está agora pronto pra começar a instalar a [name] no seu computador.
ReadyLabel2b=AVISO: %nVerifique se o caminho escolhido para a instalação encontra-se o arquivo executável "Desperados III.exe".%n%nClique em Instalar pra concluir a instalação ou clique em Voltar se você quer alterar o caminho da pasta a ser instalada.%n%n
InstallingLabel=Por favor espere enquanto o instalador instala a [name] no seu computador.
FinishedHeadingLabel=A instalação da [name] foi concluída
FinishedLabel=O instalador terminou de instalar a [name] no seu computador. O jogo já pode ser iniciado. Divirta-se.
InfoBeforeClickLabel=Lista dos participantes do projeto
InfoBeforeLabel=Por favor leia as seguintes informações antes de avançar.
ExitSetupMessage=A Instalação não foi concluída. Se você sair agora a Tradução não será instalada.%n%nVocê pode executar o instalador de novo outra hora pra completar a instalação.%n%nSair do instalador?

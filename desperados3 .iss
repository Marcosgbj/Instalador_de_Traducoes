; Script para Tradução de Desperados 3.

#define MyAppName "Tradução Desperados 3"
#define MyAppVersion "2.0"
#define MyAppPublisher "JUNIORGBJ & Contributors"
#define MyAppURL "https://github.com/JUNIORGBJ/DESPERADOS_3_PT-BR"

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
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=true
DisableProgramGroupPage=true
DefaultGroupName={#MyAppName}
AllowNoIcons=true
LicenseFile=C:\GBJ\Termo de Uso.txt
InfoBeforeFile=C:\GBJ\Créditos dos Tradutores.txt
SetupIconFile=C:\GBJ\Desperados III.ico
DisableWelcomePage=no
OutputBaseFilename=Traducao_Desperados_3
Compression=lzma
SolidCompression=true
WizardStyle=modern
WindowShowCaption=false
WindowStartMaximized=false
WindowResizable=false
WindowVisible=false
DisableStartupPrompt=true
Uninstallable=false
CreateAppDir=false

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Code]
var
  CopyDirPage: TInputDirWizardPage;

procedure InitializeWizard();
begin
  CopyDirPage :=
    CreateInputDirPage(wpSelectDir, 'Selecionar local de instalação', '',  '', False, '');
  CopyDirPage.Add('Use a pasta padrão Steam ou procure a pasta onde contém o arquivo "Desperados III.exe"');
  CopyDirPage.Values[0] := ExpandConstant('{pf32}\Steam\steamapps\common\Desperados III');
end;

procedure ExitProcess(exitCode:integer);
 external 'ExitProcess@kernel32.dll stdcall';

function CopyDir(Params: string): string;
begin
  Result := CopyDirPage.Values[0];
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
 if CurStep = ssInstall then
  begin
   if not FileExists(ExpandConstant(CopyDirPage.Values[0] + '\Desperados III.exe')) then begin
     MsgBox('O executável Desperados III.exe não foi encontrado nessa pasta. Rode a instalação novamente apontando para a pasta correta.', mbError, MB_OK);
     ExitProcess(7);
   end;
 end;
end;

[Files]
Source: C:\GBJ\keyboard\*; DestDir: {code:CopyDir}\Desperados III_Data\StreamingAssets\keyboard; Flags: ignoreversion recursesubdirs createallsubdirs
Source: C:\GBJ\loca\*; DestDir: {code:CopyDir}\Desperados III_Data\StreamingAssets\loca; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: {group}\{cm:UninstallProgram,{#MyAppName}}; Filename: {uninstallexe}

[Messages]
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

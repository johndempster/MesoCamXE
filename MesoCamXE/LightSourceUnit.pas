unit LightSourceUnit;
// ========================================================================
// MesoCam: Light Source control module
// (c) J.Dempster, Strathclyde Institute for Pharmacy & Biomedical Sciences
// ========================================================================

interface



uses
  System.SysUtils, System.Classes, LabIOUnit ;

const
  MaxLightSources = 8 ;

type
  TLightSource = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Active : Array [0..MaxLightSources-1] of Boolean ;
    Intensity : Array[0..MaxLightSources-1] of Double ;
    ControlLines : Array[0..MaxLightSources-1] of Integer ;
    Names : Array[0..MaxLightSources-1] of string ;
    MinLevel : Array[0..MaxLightSources-1] of Double ;
    MaxLevel : Array[0..MaxLightSources-1] of Double ;
    List : Array[0..MaxLightSources-1] of Integer ;
    NumList : Integer ;
    ListIndex : Integer ;
    procedure GetTypes( List : TStrings ) ;
    procedure GetControlLineNames( List : TStrings ) ;
    procedure Update ;
  end;

var
    LightSource : TLightSource ;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

procedure TLightSource.GetTypes( List : TStrings ) ;
// -----------------------------------
// Get list of supported light sources
// -----------------------------------
begin
      List.Clear ;
      List.Add('None') ;
      List.Add('LED') ;
      end;

procedure TLightSource.DataModuleCreate(Sender: TObject);
var
  I: Integer;
// --------------------------------
// Initialise light source settings
// --------------------------------
begin
    for I := 0 to High(Names) do begin
        Names[i] := format('LS%d',[i]) ;
        ControlLines[i] := LineDisabled ;
        MinLevel[i] := 0.0 ;
        MaxLevel[i] := 5.0 ;
        end;

    end;

Procedure TLightSource.GetControlLineNames( List : TStrings ) ;
// -----------------------------------
// Get list of available control ports
// -----------------------------------
var
    i : Integer ;
  iDev: Integer;
  s : string ;
begin
     List.Clear ;

    List.AddObject('None',TObject(LineDisabled)) ;
    for i := 0 to LabIO.NumResources-1 do
        begin
        if (LabIO.Resource[i].ResourceType = DACOut) then
           begin
           // Analog outputs
           s := format('Dev%d: AO.%d',
                 [LabIO.Resource[i].Device,
                  LabIO.Resource[i].StartChannel]) ;
                List.AddObject(s,TObject(i))
           end
        else if (LabIO.Resource[i].ResourceType = DIGOut) then
           begin
           // Digital outputs
           s := format('Dev%d: PO.%d',
                 [LabIO.Resource[i].Device,
                  LabIO.Resource[i].StartChannel]) ;
                List.AddObject(s,TObject(i))
           end ;
        end;
     end;


procedure TLightSource.Update ;
// ---------------------------------
// Update light source control lines
// ---------------------------------
var
    V : Single ;
    i,Dev,Chan  : Integer ;
    ResourceType : TResourceType ;
begin
     for i := 0 to High(ControlLines) do if ControlLines[i] < LineDisabled then
        begin
        Dev := LabIO.Resource[ControlLines[i]].Device ;
        Chan := LabIO.Resource[ControlLines[i]].StartChannel ;
        ResourceType := LabIO.Resource[ControlLines[i]].ResourceType ;
        if ResourceType = DACOut then
           begin
           // Analogue outputs
           if Active[i] then V := (MaxLevel[i] - MinLevel[i])*(Intensity[i]/100.0) + MinLevel[i]
                        else V := MinLevel[i] ;
           LabIO.DACOutState[Dev][Chan] := V ;
           LabIO.WriteDAC(Dev,V,Chan);
           end
        else if ResourceType = DIGOut then
           begin
           // Digital outputs
           if Active[i] then LabIO.SetBit(LabIO.DigOutState[Dev],Chan,0)
                        else LabIO.SetBit(LabIO.DigOutState[Dev],Chan,1) ;
           end;
        end;

     // Update digital outputs
     for Dev := 1 to LabIO.NumDevices do LabIO.WriteToDigitalOutPutPort( Dev, LabIO.DigOutState[Dev] ) ;

     end;


end.




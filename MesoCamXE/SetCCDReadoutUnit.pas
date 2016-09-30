unit SetCCDReadoutUnit;
// ---------------------------------------
// Enter coordinates of CCD readout region
// ---------------------------------------
// 20.02.07 Limits of range now set correctly
// 22.05.13 Cancel now closes form rather than hides (avoiding form error)
// 16.09.15 .. JD Form position/size saved by MainFrm.SaveFormPosition() when form closed

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RangeEdit;

type
  TSetCCDReadoutFrm = class(TForm)
    AreaGrp: TGroupBox;
    edXRange: TRangeEdit;
    Label1: TLabel;
    Label2: TLabel;
    edYRange: TRangeEdit;
    bOK: TButton;
    bCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ImagingRestartRequired : Boolean ;
  public
    { Public declarations }
  end;

var
  SetCCDReadoutFrm: TSetCCDReadoutFrm;

implementation

{$R *.dfm}

uses MainUnit;

procedure TSetCCDReadoutFrm.FormShow(Sender: TObject);
// --------------------------------------
// Initialisations when form is displayed
// --------------------------------------
begin

     edXRange.LoValue := MainFrm.CCDRegion.Left ;
     edXRange.HiValue := MainFrm.CCDRegion.Right ;
     edYRange.LoValue := MainFrm.CCDRegion.Top ;
     edYRange.HiValue := MainFrm.CCDRegion.Bottom ;

     ClientWidth := AreaGrp.Left + AreaGrp.Width + 5 ;
     ClientHeight := bOK.Top + bOK.Height + 5 ;

     if not MainFrm.bLiveImage.Enabled then begin

        MainFrm.bStopImage.Click ;
        ImagingRestartRequired := True ;
        end
     else ImagingRestartRequired := False ;

     end;

procedure TSetCCDReadoutFrm.bOKClick(Sender: TObject);
// -----------------
// OK button pressed
// -----------------
begin

    if not MainFrm.bLiveImage.Enabled then MainFrm.StopCamera ;

    MainFrm.CCDRegion.Left := edXRange.LoValue ;
    MainFrm.CCDRegion.Right := edXRange.HiValue ;
    MainFrm.CCDRegion.Top := edYRange.LoValue ;
    if MainFrm.LiveImagingInProgress then MainFrm.CCDRegion.Top := 0.0 ;
    MainFrm.CCDRegion.Bottom := edYRange.HiValue ;

    if ImagingRestartRequired then MainFrm.bLiveImage.Click ;

    close ;

     end;

procedure TSetCCDReadoutFrm.bCancelClick(Sender: TObject);
// ---------------------
// Cancel button pressed
// ---------------------
begin
     Close ;
     end;

procedure TSetCCDReadoutFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
// ---------------------------
// Tidy up when form is closed
// ---------------------------
begin
     Action := caFree ;
     MainFrm.bEnterCCDArea.Enabled := True ;
     end;

end.

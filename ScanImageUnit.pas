unit ScanImageUnit;
// ---------------------------------------------
// MesoScan: Acquire image from selected region
// ---------------------------------------------

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, math,  LabIOUnit, ImageFile ;

type
  TScanImageFrm = class(TForm)
    Image1: TImage;
    ROIPanel: TPanel;
    lbReadout: TLabel;
    bZoomIn: TButton;
    bZoomOut: TButton;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bZoomInClick(Sender: TObject);
    procedure bZoomOutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }

    DisplayMaxWidth : Integer ;
    DisplayMaxHeight : Integer ;
    ZoomFactor : Integer ;
    XLeft : Integer ;
    YTop : Integer ;
    XDown : Integer ;
    YDown : Integer ;
    XStep : Integer ;
  public
    { Public declarations }
    Bitmap : TBitmap ;
    FrameWidth : Integer ;
    FrameHeight : Integer ;
    NumPixelsPerFrame : Integer ;
    FrameWidthMicrons : Double ;
    PDisplayBuf : PIntArray ;
    RawSaved : Boolean ;

    procedure InitialiseImage(
              Width : Integer ;
              Height : Integer ;
              WidthMicrons : Double
              ) ;
    procedure UpdateImage(
              var LUT : Array of Word     // Display look-up table [IN]
              ) ;

    procedure SaveRawImage(
              FileName : String
              ) ;

  end;

var
  ScanImageFrm: TScanImageFrm;

implementation

{$R *.dfm}

uses MainUnit;

procedure TScanImageFrm.bZoomInClick(Sender: TObject);
// ---------------
// Magnify display
// ---------------
begin
    Inc(ZoomFactor) ;
    Resize ;
    UpdateImage(MainFrm.LUT) ;
    end;

procedure TScanImageFrm.bZoomOutClick(Sender: TObject);
// -----------------
// Demagnify display
// -----------------
begin
     ZoomFactor := Max(ZoomFactor-1,0) ;
     Resize ;
     UpdateImage(MainFrm.LUT) ;
     end;

procedure TScanImageFrm.FormCreate(Sender: TObject);
begin
     BitMap := TBitMap.Create ;
     BitMap.Width := Screen.Width ;
     BitMap.Width := Screen.Height ;
     ZoomFactor := 0 ;
     XLeft := 0 ;
     YTop := 0 ;
     XDown := 0 ;
     YDown := 0 ;
     XStep := 1 ;
     end;

procedure TScanImageFrm.FormShow(Sender: TObject);
// -----------------------------------
// Initialisations when form displayed
// -----------------------------------
begin
     Left := MainFrm.Left + 100 ;
     Top := MainFrm.Top + 100 ;
     ClientWidth := (Screen.Width - Left) - (Screen.Width div 6) ;
     ClientHeight := (Screen.Height - Top) - (Screen.Height div 6) ;
     Resize ;
     end;

procedure TScanImageFrm.FormDestroy(Sender: TObject);
begin
    //BitMap.ReleasePalette ;
    BitMap.Free ;
end;

procedure TScanImageFrm.FormResize(Sender: TObject);
// -------------------------------
// Adjust image when form resized
// -------------------------------
begin

     DisplayMaxWidth := ClientWidth - Image1.Left - 5 ;
     DisplayMaxHeight := ClientHeight - Image1.Top - 5 ;

     if ZoomFactor <= 0 then begin
        XStep := Max(Ceil(FrameWidth/DisplayMaxWidth),Ceil(FrameHeight/DisplayMaxHeight)) ;
        BitMap.Width := Min( FrameWidth div XStep, FrameWidth )  ;
        BitMap.Height := Min( FrameHeight div XStep, FrameHeight ) ;
        end
     else begin
        XStep := Ceil(FrameWidth/DisplayMaxWidth) ;
        ZoomFactor := Min(XStep-1,ZoomFactor) ;
        XStep := XStep - ZoomFactor ;
        BitMap.Width := Min(FrameWidth div XStep,DisplayMaxWidth)  ;
        BitMap.Height := Min(FrameHeight div XStep,DisplayMaxHeight)  ;
        end;
     UpdateImage(MainFrm.LUT) ;
     end ;


procedure TScanImageFrm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// -------------------
// Mouse down on image
// -------------------
begin
     screen.Cursor := crHandPoint ;
     XDown := X ;
     YDown := Y ;
     end;

procedure TScanImageFrm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
// ----------------------
// Mouse moved over image
// ----------------------
var
    i : Integer ;
    PixelsToMicrons : Double ;
begin
     i := Y*XStep*FrameWidth + X*XStep ;
     PixelsToMicrons := FrameWidthMicrons/FrameWidth ;
     if (i > 0) and (i < FrameWidth*FrameHeight) then begin
        lbReadout.Caption := format('X=%.5g um, Y=%.5g um, I=%d',
                           [X*XStep*PixelsToMicrons,Y*XStep*PixelsToMicrons,pDisplayBuf[i]]) ;
         end ;

     end;


procedure TScanImageFrm.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// -------------------
// Mouse up on image
// -------------------
var
    XRight,YBottom : Integer ;
begin
     Screen.Cursor := crDefault ;

     XLeft := XLeft - (X - XDown)*XStep ;
     XRight := Min(XLeft + Bitmap.Width*XStep,FrameWidth) ;
     XLeft := Max( XRight - Bitmap.Width*XStep, 0 ) ;
     YTop :=  YTop - (Y - YDown)*XStep ;
     YBottom := Min(YTop + Bitmap.Height*XStep,FrameHeight) ;
     YTop := Max( YBottom - Bitmap.Height*XStep,0) ;

     UpdateImage( MainFrm.LUT) ;
     end;


procedure TScanImageFrm.InitialiseImage(
          Width : Integer ;
          Height : Integer ;
          WidthMicrons : Double
          ) ;
// ------------------------------------------------------
// Initialise size of memory buffers and image bitmaps
// ------------------------------------------------------
var
     i : Integer ;
     MaxBuffers : Integer ;
begin

    // No. of pixels per frame
    FrameWidth := Width ;
    FrameHeight := Height ;
    NumPixelsPerFrame := Width*Height ;
    FrameWidthMicrons := WidthMicrons ;


    // Dispose of existing display buffers and create new ones
    if PDisplayBuf <> Nil then begin
       FreeMem(PDisplayBuf) ;
       PDisplayBuf := Nil ;
       end ;
    GetMem( PDisplayBuf,NumPixelsPerFrame*SizeOf(Integer) ) ;

     // Set intensity range and sliders
     MainFrm.SetDisplayIntensityRange( MainFrm.GreyLo,MainFrm.GreyHi ) ;

     // Update display look up tables
     MainFrm.UpdateLUT( MainFrm.ADCMaxValue );

     resize ;

     MainFrm.SetPalette( BitMap, MainFrm.PaletteType ) ;

     Image1.Width := BitMap.Width ;
     Image1.Height := BitMap.Height ;

     Image1.Canvas.Pen.Color := clWhite ;
     Image1.Canvas.Brush.Style := bsClear ;
     Image1.Canvas.Font.Color := clWhite ;
     Image1.Canvas.TextFlags := 0 ;
     Image1.Canvas.Pen.Mode := pmXOR ;
     Image1.Canvas.Font.Name := 'Arial' ;
     Image1.Canvas.Font.Size := 8 ;
     Image1.Canvas.Font.Color := clBlue ;

     RawSaved := False ;

     end ;


procedure TScanImageFrm.UpdateImage(
          var LUT : Array of Word     // Display look-up table [IN]
          ) ;
// --------------
// Display image
// --------------
var
    Ybm,Yim,Xbm,Xim,i,j,StartOfLine,x,y : Integer ;
    iStep : Integer ;
    iDisplayZoom,iz : Integer ;
    iEnd : Integer ;
    PScanLine1 : PByteArray ;    // Bitmap line buffer pointer
    PScanLine : PByteArray ;    // Bitmap line buffer pointer
    XRight,YBottom : Integer ;
begin

    // Copy reduced image to bitmap

     Image1.Width := BitMap.Width ;
     Image1.Height := BitMap.Height ;

     Ybm := 0 ;
     Yim := YTop ;
     XStep := Max(Ceil(FrameWidth/DisplayMaxWidth),Ceil(FrameHeight/DisplayMaxHeight)) ;
     ZoomFactor := Min(XStep-1,ZoomFactor) ;
     XStep := XStep - ZoomFactor ;

     XRight := Min(XLeft + Bitmap.Width*XStep,FrameWidth) ;
     XLeft := Max( XRight - Bitmap.Width*XStep, 0 ) ;
     YBottom := Min(YTop + Bitmap.Height*XStep,FrameHeight) ;
     YTop := Max( YBottom - Bitmap.Height*XStep,0) ;


    for Ybm := 0 to BitMap.Height-1 do begin

        // Get scan line array pointer
        PScanLine := BitMap.ScanLine[Ybm] ;

        // Copy line to bitmap
        XIm := XLeft ;
        i := (Yim*FrameWidth) + XIm ;
        for xBm := 0 to BitMap.Width-1 do begin
            if (Xim < FrameWidth) and (Yim < FrameHeight) then begin
               PScanLine[Xbm] := LUT[Word(PDisplayBuf^[i])] ;
               end
            else PScanLine[Xbm] := 0 ;
            Xim := Xim + XStep ;
            i := i + XStep ;
            end ;

          Yim := Yim + XStep

          end ;

     Image1.Picture.Assign(BitMap) ;
     Image1.Width := BitMap.Width ;
     Image1.Height := BitMap.Height ;

//     lbReadout.Caption := format('X%d L=%d,T=%d',[ZoomFactor,XLeft,YTop]) ;
    end ;


procedure TScanImageFrm.SaveRawImage(
          FileName : String
          ) ;
// ----------------------
// Save raw image to file
// ----------------------
var
    iBuf16 : PBig16BitArray ;
    FileHandle : THandle ;
    i,NumPixels,iMin,iMax : Integer ;
begin
      NumPixels := FrameWidth*FrameHeight ;
      GetMem( iBuf16, NumPixels*Sizeof(Integer)) ;
      iMin := 32767 ;
      iMax := -32768 ;
      for i := 0 to NumPixels-1 do begin
          iMin := Min(PDisplayBuf^[i],iMin) ;
          iMax := Max(PDisplayBuf^[i],iMax) ;
      end;
      outputdebugstring(pchar(format('%d %d',[iMin,iMax])));
      for i := 0 to NumPixels-1 do iBuf16^[i] := PDisplayBuf^[i] ;

      FileHandle := FileCreate( FileName ) ;
      FileWrite( FileHandle, FrameWidth, Sizeof(FrameWidth)) ;
      FileWrite( FileHandle, FrameHeight, Sizeof(FrameHeight)) ;
      FileWrite( FileHandle, iBuf16^, NumPixels*Sizeof(Integer)) ;
      FileClose(FileHandle) ;
      FreeMem(iBuf16) ;

      RawSaved := True ;

      end;





end.

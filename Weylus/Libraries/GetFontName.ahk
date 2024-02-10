TT_GetFontName( TTF="" ) { ;     By SKAN  ; www.autohotkey.com/forum/viewtopic.php?t=39572
 Static SearchParameters="3-1033-4|1-0-1", StrGet="StrGet" ; CD:07-Oct-2009 LM:25-Oct-2010
 ;Refer : The 'name' table - http://developer.apple.com/fonts/ttrefman/RM06/Chap6name.html
 If ( hFil := DllCall( "_lopen", A_IsUnicode ? "AStr" : "Str",TTF, UInt,0x40 ) ) < 1
   Return
 VarSetCapacity(TTOT,12,0), DllCall( "_lread",Int,hFil,Str,TTOT,UInt,12 ), P := &TTOT
 If ((*(P+0)<<8)+(*(P+1))!=1)||((*(P+2)<<8)+(*(P+3))!=0)||((nTab:=(*(P+4)<<8)+(*(P+5)))<1)
  Return SubStr( DllCall( "_lclose",UInt,hFil ),1,0 )
 VarSetCapacity(TD,nTab*16,0), DllCall("_lread",Int,hFil,Str,TD,UInt,nTab*16), P := &TD-16
 Loop %nTab% {
  If ( NumGet( P+0 ) <> 0x656D616E && P := P+16 )
    Continue
  dOff := (*(P+08)<<24)+(*(P+09)<<16)+(*(P+10)<<8)+(*(P+11))
  dLen := (*(P+12)<<24)+(*(P+13)<<16)+(*(P+14)<<8)+(*(P+15))
  Break
 }
 If (dOff=""||dLen="")
  Return SubStr( DllCall( "_lclose",UInt,hFil ),1,0 )
 sOff := DllCall("_llseek",UInt,hFil,UInt,dOff,Int,0)
 VarSetCapacity(TTNTH,6,0), DllCall( "_lread",Int,hFil,Str,TTNTH,UInt,6 ), P := &TTNTH
 nRec:=(*(P+2)<<8)+(*(P+3)),sOff:=sOff+(*(P+4)<<8)+(*(P+5)),VarSetCapacity(TTNR,12*nRec,0)
 DllCall( "_lread", UInt,hFil, Str,TTNR, UInt,12*nRec )
 Loop, Parse, SearchParameters, |
 {
   P := &TTNR-12,  Ansi := A_Index-1
   StringSplit, Parameter, A_LoopField,-
   Loop, %nRec% {
   uPFID:=(*(P:=P+12)<<8)+(*(P+1)), uLID:=(*(P+4)<<8)+(*(P+5)), uNID:=(*(P+6)<<8)+(*(P+7))
   If ( uPFID=Parameter1 && uLID=Parameter2 && uNID=Parameter3 ) {
    nOff := (*(P+10)<<8)+(*(P+11)), Len:=(*(P+8)<<8)+(*(P+9)),  Break := True
    Break
  }}
 IfEqual,Break,%True%,Break
 }
 If ( nOff="" || Len="" )
  Return SubStr( DllCall("_lclose",UInt,hFil), 1,0 )
 DllCall( "_llseek", UInt,hFil, UInt,nOff+sOff, Int,0 ), VarSetCapacity( FN,Len+2,0 )
 DllCall( "_lread",Int,hFil,Str,FN, UInt,Len ), DllCall( "_lclose", UInt,hFil )
 IfEqual,Ansi,1, Return,A_IsUnicode ? %StrGet%(&FN,"") : FN
 VarSetCapacity(FLE,Len+2,0), LCMAP_BYTEREV:=0x800, N := DllCall( "lstrlenW", str,FN ) + 1
 DllCall( "LCMapStringW", Int,0, UInt,LCMAP_BYTEREV, Str,FN, UInt,N, Str,FLE, UInt,N )
 IfEqual,A_IsUnicode,1, Return,FLE
 VarSetCapacity( Ansi, N+1 )
 DllCall( "WideCharToMultiByte",Int,0,Int,0,Str,FLE,UInt,N,Str,Ansi,UInt,N+1,Int,0,Int,0 )
Return Ansi
}


[color=#808080]#SingleInstance, Force
SetBatchLines -1
RegRead,FontD,HKCU,Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders,Fonts
Loop %FontD%\*.ttf
   FL .= TT_GetFontName(A_LoopFileLongPath) "|"
Gui,Add,ListBox,w250 R25,%FL%
Gui,Show,,%FontD%
Return

GuiEscape:
GuiClose:
 ExitApp[/color]
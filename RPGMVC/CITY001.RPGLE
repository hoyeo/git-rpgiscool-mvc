      *    *****************************************************************
      *    * Program....... City001                                        *
      *    * Description... Display cities in selected state               *
      *    *                                                               *
      *    * Compile....... CrtRPGMod  Module( YourLib/City001 )           *
      *    *                           SrcFile( YourLib/YourSrcFile )      *
      *    *                CrtPgm     Pgm( YourLib/City001 )              *
      *    *****************************************************************
 
      *    =================================================================
      *    = Files                                                         =
      *    =================================================================
 
     FCity001s  CF   E             Workstn SFile( RcdSfl : SflRcdNbr )
     FStates    IF   E           K Disk
     FCities    IF   E           K Disk
 
      *    =================================================================
      *    = Definitions                                                   =
      *    =================================================================
 
     D SflRcdNbr       S              5I 0
 
      *    =================================================================
      *    = Key lists                                                     =
      *    =================================================================
 
      *    -----------------------------------------------------------------
      *    - State key                                                     -
      *    -----------------------------------------------------------------
 
     C     StateKey      KList
     C                   KFld                    StateAbbr
 
      *    =================================================================
      *    = Process selected state until user exits                       =
      *    =================================================================
 
     C                   ExFmt     Dsp01
 
     C                   DoW       Not( *InKC )
 
     C                   Eval      ErrorMsg = *Blank
     C     StateKey      Chain     States
 
     C                   Select
 
     C                   When      %Found( States )
     C                   ExSr      DisplayCities
 
     C                   Other
     C                   Eval      ErrorMsg = 'Invalid State Abbreviation'
 
     C                   EndSl
 
     C                   ExFmt     Dsp01
 
     C                   EndDo
 
     C                   Eval      *InLR = *On
 
      *    =================================================================
      *    = Subroutine.... DisplayCities                                  =
      *    = Description... Display cities in selected state               =
      *    =================================================================
 
     C     DisplayCities BegSr
 
     C                   Eval      *In22 = *On
     C                   Write     RcdSflC
     C                   Eval      *In22 = *Off
 
     C                   Eval      SflRcdNbr = *Zero
 
     C     StateKey      SetLL     Cities
     C     StateKey      ReadE     Cities
 
     C                   DoW       Not( %EOF( Cities ) )
     C                   Eval      SflRcdNbr = SflRcdNbr + 1
     C                   Write     RcdSfl
     C     StateKey      ReadE     Cities
     C                   EndDo
 
     C                   Eval      *In21 = *On
     C                   DoW       Not( *InKL )
     C                   Write     RcdSflC
     C                   Write     Footer
     C                   Read      RcdSflC
     C                   EndDo
     C                   Eval      *In21 = *Off
     C                   Eval      StateAbbr = *Blank
 
     C                   EndSr
 

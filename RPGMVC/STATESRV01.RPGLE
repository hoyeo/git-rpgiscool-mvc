      *    *****************************************************************
      *    * Module........ StateSrv01                                     *
      *    * Description... Get state abbreviation through display file    *
      *    *                                                               *
      *    * Compile....... CrtRPGMod  Module( YourLib/StateSrv01 )        *
      *    *                           SrcFile( YourLib/YourSrcFile )      *
      *    *                CrtSrvPgm  SrvPgm( YourLib/StateSrv01 )        *
      *    *                           Export( *All )                      *
      *    *                           ActGrp( *Caller )                   *
      *    *                           BndDir( YourLib/AppBndDir )         *
      *    *                AddBndDirE BndDir( YourLib/AppBndDir )         *
      *    *                           Obj( ( YourLib/StateSrv01 ) )       *
      *    *****************************************************************
 
      *    *****************************************************************
      *    * Control information                                           *
      *    *****************************************************************
 
     H NoMain
 
      *    =================================================================
      *    = File information                                              =
      *    =================================================================
 
     FStateSrv1dCF   E             Workstn UsrOpn
 
      *    =================================================================
      *    = Procedure prototypes                                          =
      *    =================================================================
 
      *    -----------------------------------------------------------------
      *    - Procedure..... GetStateAbbrInput                              -
      *    - Description... Get state abbreviation input                   -
      *    -----------------------------------------------------------------
 
     D GetStateAbbrInput...
     D                 Pr
     D  ParameterIO                        Like( StateAbbr )
     D  ParameterIn                  79
 
     *    *****************************************************************
     *    * Procedure..... GetStateAbbrInput                              *
     *    * Description... Get state abbreviation input                   *
     *    *****************************************************************
 
     P GetStateAbbrInput...
     P                 B                   Export
 
     D GetStateAbbrInput...
     D                 PI
     D  StateAbbrIO                        Like( StateAbbr )
     D  ErrorMsgIn                   79
 
     /Free
 
 
     //  =================================================================
     //  = Open display file and display first screen                    =
     //  =================================================================
 
        If Not( %Open( StateSrv1d ) ) ;
           Open StateSrv1d ;
        EndIf ;
 
        StateAbbr = StateAbbrIO ;
        ErrorMsg = ErrorMsgIn ;
 
        ExFmt Dsp01 ;
 
     //  =================================================================
     //  = Set state abbreviation to return                              =
     //  =================================================================
 
        Select ;
 
     //  -----------------------------------------------------------------
     //  - User selected exit with F3                                    -
     //  -----------------------------------------------------------------
 
              When *InKC ;
                StateAbbrIO = *AllX'00' ;
 
     //  -----------------------------------------------------------------
     //  - User did not exit with F3                                     -
     //  -----------------------------------------------------------------
 
              Other ;
                StateAbbrIO = StateAbbr ;
 
        EndSl ;
 
        Return ;
 
     /End-Free
 
     P GetStateAbbrInput...
     P                 E
 

/*
 * $Id$
 */

/*
 *    QPM - QAC based Project Manager
 *
 *    Copyright 2011-2016 Fernando Yurisich <fernando.yurisich@gmail.com>
 *    http://qpm.sourceforge.net
 *
 *    Based on QAC - Project Manager for (x)Harbour
 *    Copyright 2006-2011 Carozo de Quilmes <CarozoDeQuilmes@gmail.com>
 *    http://www.CarozoDeQuilmes.com.ar
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "minigui.ch"
#include <QPM.ch>

Function QPM_IsLibrariesNamesOld( cDir, cType )
   Local bReto:=.T.
      do case
         case cType == DefineMiniGui1+DefineBorland+DefineHarbour
            if File( cDir+DEF_SLASH + "BIN" + DEF_SLASH + "HARBOUR.exe" ) .and. File( GetHarbourLibFolder() + DEF_SLASH + "hbrtl.lib" )
               bReto:=.F.
            endif
         case cType == DefineMiniGui3+DefineMinGW+DefineHarbour
            if File( cDir+DEF_SLASH + "BIN" + DEF_SLASH + "HARBOUR.exe" ) .and. File( GetHarbourLibFolder() + DEF_SLASH + "libhbrtl.a" )
               bReto:=.F.
            endif
         case cType == DefineExtended1+DefineBorland+DefineHarbour
            if File( cDir+DEF_SLASH + "BIN" + DEF_SLASH + "HARBOUR.exe" ) .and. File( GetHarbourLibFolder() + DEF_SLASH + "hbrtl.lib" )
               bReto:=.F.
            endif
         case cType == DefineExtended1+DefineMinGW+DefineHarbour
            if File( cDir+DEF_SLASH + "BIN" + DEF_SLASH + "HARBOUR.exe" ) .and. File( GetHarbourLibFolder() + DEF_SLASH + "libhbrtl.a" )
               bReto:=.F.
            endif
         case cType == DefineOohg3+DefineBorland+DefineHarbour
            if File( cDir+DEF_SLASH + "BIN" + DEF_SLASH + "HARBOUR.exe" ) .and. File( GetHarbourLibFolder() + DEF_SLASH + "hbrtl.lib" )
               bReto:=.F.
            endif
         case cType == DefineOohg3+DefineMinGW+DefineHarbour
            if File( cDir+DEF_SLASH + "BIN" + DEF_SLASH + "HARBOUR.exe" ) .and. File( GetHarbourLibFolder() + DEF_SLASH + "libhbrtl.a" )
               bReto:=.F.
            endif
         case cType == DefineOohg3+DefinePelles+DefineHarbour
            if File( cDir+DEF_SLASH + "BIN" + DEF_SLASH + "HARBOUR.exe" ) .and. File( GetHarbourLibFolder() + DEF_SLASH + "hbrtl.lib" )
               bReto:=.F.
            endif
      endcase
Return bReto

Function QPM_CargoLibraries()
   Local bOldNamesLib := QPM_IsLibrariesNamesOld( US_ShortName( GetHarbourFolder() ), GetSuffix() )
   Local cPre := "", cExt := ""

   // HMG 1.x + BorlandC + Harbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'debug'+cExt,      cPre+'hbdebug'+cExt ) )
   else
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'common'+cExt,     cPre+'hbcommon'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'codepage'+cExt,   cPre+'hbcpage'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'hsx'+cExt,        cPre+'hbhsx'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'lang'+cExt,       cPre+'hblang'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'macro'+cExt,      cPre+'hbmacro'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'pp'+cExt,         cPre+'hbpp'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'rdd'+cExt,        cPre+'hbrdd'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'rtl'+cExt,        cPre+'hbrtl'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'hbsix'+cExt,      cPre+'hbsix'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'vm'+cExt,         cPre+'hbvm'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'hbziparc'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'ziparchive'+cExt, cPre+'hbziparch'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'libct'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'libmisc'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'libmysql'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfcdx'+cExt,     cPre+'rddcdx'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfdbt'+cExt,     cPre+'rdddbt'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbffpt'+cExt,     cPre+'rddfpt'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfntx'+cExt,     cPre+'rddntx'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineHarbour ),                                           cPre+'zlib1'+cExt )

   // HMG 1.x + BorlandC + xHarbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'debug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'codepage'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'common'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'dbfcdx'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'dbfdbt'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'dbffpt'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'dbfntx'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'hsx'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'lang'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'libct'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'libmisc'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'libmysql'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'macro'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'pp'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'rdd'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'rtl'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'vm'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui1+DefineBorland+DefineXHarbour ), cPre+'zlib1'+cExt )

   // HMG 3.x + MinGW + Harbour        (sincronizar con 3.0.36)
   cPre := "lib"
   cExt := ".a"
   &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'debug'+cExt,      cPre+'hbdebug'+cExt ) )
   else
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'debugger'+cExt )
   else
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'crypt'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'edit'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'editex'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'graph'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbapollo'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbbmcdx'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbbtree'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbclipsm'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'common'+cExt,     cPre+'hbcommon'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'codepage'+cExt,   cPre+'hbcpage'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbcplr'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'ct'+cExt,         cPre+'hbct'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbcurl'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbfbird'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbgd'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbhpdf'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'hsx'+cExt,        cPre+'hbhsx'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'lang'+cExt,       cPre+'hblang'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'macro'+cExt,      cPre+'hbmacro'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbmainstd'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'misc'+cExt,       cPre+'hbmisc'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'nulsys'+cExt,     cPre+'hbnulsys'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbpcre'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'pp'+cExt,         cPre+'hbpp'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'rdd'+cExt,        cPre+'hbrdd'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'rtl'+cExt,        cPre+'hbrtl'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'hbsix'+cExt,      cPre+'hbsix'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbusrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'vm'+cExt,         cPre+'hbvm'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbw32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbwin'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbxml'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'hbziparc'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'ziparchive'+cExt, cPre+'hbziparch'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'zlib1'+cExt,      cPre+'hbzlib'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'ini'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'libhpdf'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'minizip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'mysqldll'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'png'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbfcdx'+cExt,     cPre+'rddcdx'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbfdbt'+cExt,     cPre+'rdddbt'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbffpt'+cExt,     cPre+'rddfpt'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbfntx'+cExt,     cPre+'rddntx'+cExt ) )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'registry'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'report'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'stdc++'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'ws2_32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineHarbour ),                                           cPre+'xHB'+cExt )

   // HMG 3.x + MinGW + xHarbour
   cPre := "lib"
   cExt := ".a"
   &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'debug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'gtgui'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'debugger'+cExt )
   else
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'codepage'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'common'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'dbfcdx'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'dbfdbt'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'dbffpt'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'dbfntx'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'hsx'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'lang'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'macro'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'mapi32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'mysqldll'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'nulsys'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'pp'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'rdd'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'rtl'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'stdc++'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'usrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'vm'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'ws2_32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'xCrypt'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'xEdit'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'xEditex'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'xGraph'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'xIni'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'xRegistry'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'xReport'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'zlib'+cExt )
   aadd( &( "vLibDefault"+DefineMiniGui3+DefineMinGW+DefineXHarbour ), cPre+'zlib1'+cExt )

// Extended 1.x + BorlandC + Harbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                          cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'debug'+cExt,     cPre+'hbdebug'+cExt ) )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                          cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                          cPre+'gtgui'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                          cPre+'debugger'+cExt )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                          cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'adordd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'calldll'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'cputype'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbaes'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbcomm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'common'+cExt,     cPre+'hbcommon'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'codepage'+cExt,   cPre+'hbcpage'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'ct'+cExt,         cPre+'hbct'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'hsx'+cExt,        cPre+'hbhsx'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'lang'+cExt,       cPre+'hblang'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'macro'+cExt,      cPre+'hbmacro'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbmemio'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbmisc'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbmysql'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbodbc'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbpcre'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbpgsql'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'pp'+cExt,         cPre+'hbpp'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'rdd'+cExt,        cPre+'hbrdd'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'rtl'+cExt,        cPre+'hbrtl'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'hbsix'+cExt,      cPre+'hbsix'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbsqldd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbsqlit3'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'tip'+cExt,        cPre+'hbtip'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbunrar'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbusrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'vm'+cExt,         cPre+'hbvm'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbvpdf'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbwin'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbxml'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbziparc'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hmg_hpdf'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'hmg_qhtm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'iphlpapi'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'libmysql'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'libpq'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'minizip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'odbc32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'propgrid'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'propsheet'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfcdx'+cExt,     cPre+'rddcdx'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbffpt'+cExt,     cPre+'rddfpt'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfntx'+cExt,     cPre+'rddntx'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'shell32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'sqlite3facade'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'tbn'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'tmsagent'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'tsbrowse'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'winreport'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'xHB'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineHarbour ),                                           cPre+'ziparchive'+cExt )

   // Extended 1.x + MinGW + Harbour
   cPre := "lib"
   cExt := ".a"
   &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'debugger'+cExt )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'calldll'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'crypt'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'edit'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'editex'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'graph'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'common'+cExt,     cPre+'hbcommon'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'codepage'+cExt,   cPre+'hbcpage'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'ct'+cExt,         cPre+'hbct'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'debug'+cExt,      cPre+'hbdebug'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'hsx'+cExt,        cPre+'hbhsx'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'lang'+cExt,       cPre+'hblang'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'macro'+cExt,      cPre+'hbmacro'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'nulsys'+cExt,     cPre+'hbnulsys'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbpcre'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'pp'+cExt,         cPre+'hbpp'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'rdd'+cExt,        cPre+'hbrdd'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'rtl'+cExt,        cPre+'hbrtl'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'hbsix'+cExt,      cPre+'hbsix'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbunrar'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbusrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'vm'+cExt,         cPre+'hbvm'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbw32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbwin'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbxml'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbziparc'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'ziparchive'+cExt, cPre+'hbziparch'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'ini'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'iphlpapi'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'minizip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'misc'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'mysqldll'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbfcdx'+cExt,     cPre+'rddcdx'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbfdbt'+cExt,     cPre+'rdddbt'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbffpt'+cExt,     cPre+'rddfpt'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ), if( bOldNamesLib, cPre+'dbfntx'+cExt,     cPre+'rddntx'+cExt ) )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'registry'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'report'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'stdc++'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'tsbrowse'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'unrar'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'ws2_32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'xHB'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineHarbour ),                                           cPre+'zlib1'+cExt )

   // Extended 1.x + BorlandC + xHarbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'debug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'gtgui'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'debugger'+cExt )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'adordd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'calldll'+cExt )        // xlib
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'codepage'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'common'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'cputype'+cExt )        // xlib
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'dbfcdx'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'dbffpt'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'dbfntx'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'dll'+cExt )            // xlib
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbcomm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'filemem'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbunrar'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbvpdf'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbxml'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hmg_hpdf'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hmg_qhtm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'hsx'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'iphlpapi'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'lang'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'libmisc'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'macro'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'pp'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'propgrid'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'propsheet'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'rdd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'rtl'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'shell32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'sqlite3facade'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'tbn'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'tmsagent'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'tsbrowse'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'usrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'vm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'winreport'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'xhbsqlite3'+cExt )     // xlib
   aadd( &( "vLibDefault"+DefineExtended1+DefineBorland+DefineXHarbour ), cPre+'zlib'+cExt )

   // Extended 1.x MinGW + xHarbour
   cPre := "lib"
   cExt := ".a"
   &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'debug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'gtgui'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'debugger'+cExt )
   else
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'codepage'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'common'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'dbfcdx'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'dbfdbt'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'dbffpt'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'dbfntx'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'hsx'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'iphlpapi'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'lang'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'macro'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'mapi32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'mysqldll'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'nulsys'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'pp'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'rdd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'rtl'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'stdc++'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'tsbrowse'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'usrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'vm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'ws2_32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'xCrypt'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'xEdit'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'xEditex'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'xGraph'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'xIni'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'xRegistry'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'xReport'+cExt )
   aadd( &( "vLibDefault"+DefineExtended1+DefineMinGW+DefineXHarbour ), cPre+'zlib1'+cExt )

   // OOHG + BorlandC + Harbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'debug'+cExt,      cPre+'hbdebug'+cExt ) )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'common'+cExt,     cPre+'hbcommon'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'codepage'+cExt,   cPre+'hbcpage'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'ct'+cExt,         cPre+'hbct'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'hsx'+cExt,        cPre+'hbhsx'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'lang'+cExt,       cPre+'hblang'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'macro'+cExt,      cPre+'hbmacro'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'pcrepos'+cExt,    cPre+'hbpcre'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'pp'+cExt,         cPre+'hbpp'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'rdd'+cExt,        cPre+'hbrdd'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'rtl'+cExt,        cPre+'hbrtl'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'hbsix'+cExt,      cPre+'hbsix'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'tip'+cExt,        cPre+'hbtip'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbusrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'vm'+cExt,         cPre+'hbvm'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbw32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'hbziparc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'ziparchive'+cExt, cPre+'hbziparch'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'zlib1'+cExt,      cPre+'hbzlib'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'libct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'libmisc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'libmysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'minizip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfcdx'+cExt,     cPre+'rddcdx'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfdbt'+cExt,     cPre+'rdddbt'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbffpt'+cExt,     cPre+'rddfpt'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ), if( bOldNamesLib, cPre+'dbfntx'+cExt,     cPre+'rddntx'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineHarbour ),                                           cPre+'xHB'+cExt )

   // OOHG + BorlandC + xHarbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'debug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'codepage'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'common'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'dbfcdx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'dbfdbt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'dbffpt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'dbfntx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'hsx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'lang'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'libct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'libmisc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'libmysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'macro'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'pp'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'rdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'rtl'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'usrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'vm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineBorland+DefineXHarbour ), cPre+'zlib1'+cExt )

   // OOHG + MinGW + Harbour
   cPre := "lib"
   cExt := ".a"
   &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbdebug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbcommon'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbcpage'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbcplr'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbextern'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbhsx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hblang'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbmacro'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbmemio'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbmisc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbmysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbodbc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbpcre'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbpp'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbrdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbrtl'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbtip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbuddall'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbusrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbvm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbziparc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'iphlpapi'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'minizip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'odbc32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'rddcdx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'rddfpt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'rddnsx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'rddntx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'rddsql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'sddodbc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'ws2_32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineHarbour ), cPre+'xhb'+cExt )

   // OOHG + MinGW + xHarbour
   cPre := "lib"
   cExt := ".a"
   &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'debug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'codepage'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'common'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'dbfcdx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'dbfdbt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'dbffpt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'dbfntx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'hsx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'lang'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'macro'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'mapi32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'mysqldll'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'nulsys'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'pp'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'rdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'rtl'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'stdc++'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'usrrdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'vm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'ws2_32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'xCrypt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'xEdit'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'xEditex'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'xGraph'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'xIni'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'xRegistry'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'xReport'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefineMinGW+DefineXHarbour ), cPre+'zlib1'+cExt )

   // OOHG + Pelles C + Harbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'debug'+cExt,      cPre+'hbdebug'+cExt ) )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'advapi32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'crt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'common'+cExt,     cPre+'hbcommon'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'codepage'+cExt,   cPre+'hbcpage'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'ct'+cExt,         cPre+'hbct'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'hsx'+cExt,        cPre+'hbhsx'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'lang'+cExt,       cPre+'hblang'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'macro'+cExt,      cPre+'hbmacro'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbpcre'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'pp'+cExt,         cPre+'hbpp'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'rdd'+cExt,        cPre+'hbrdd'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'rtl'+cExt,        cPre+'hbrtl'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'hbsix'+cExt,      cPre+'hbsix'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'vm'+cExt,         cPre+'hbvm'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbw32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbziparc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'ziparchive'+cExt, cPre+'hbziparch'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'kernel32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'libct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'libmisc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'libmysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'minizip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'mpr'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'olepro32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'dbfcdx'+cExt,     cPre+'rddcdx'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'dbfdbt'+cExt,     cPre+'rdddbt'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'dbffpt'+cExt,     cPre+'rddfpt'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ), if( bOldNamesLib, cPre+'dbfntx'+cExt,     cPre+'rddntx'+cExt ) )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'shell32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'xHB'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineHarbour ),                                           cPre+'zlib1'+cExt )

   // OOHG + Pelles C + xHarbour
   cPre := ""
   cExt := ".lib"
   &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ) := {}
   if bConsole
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'gtwin'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'debug'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'gtwin'+cExt )
   endif
   else
   if PUB_bDebugActive
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'gtgui'+cExt )
   else
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'gtgui'+cExt )
   endif
   endif

   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'ace32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'bostaurus'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'advapi32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'codepage'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'comctl32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'comdlg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'common'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'crt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'ct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'dbfcdx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'dbfdbt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'dbffpt'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'dbfntx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'dll'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'gdi32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'hbmzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'hbole'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'hbprinter'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'hbsix'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'hbzip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'hbzlib'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'hsx'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'kernel32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'lang'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'libct'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'libmisc'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'libmysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'macro'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'miniprint'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'mpr'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'msimg32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'mysql'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'ole32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'oleaut32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'olepro32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'pcrepos'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'pp'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'rdd'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'rddads'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'rtl'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'shell32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'socket'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'tip'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'user32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'uuid'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'vfw32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'vm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'winmm'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'winspool'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'wsock32'+cExt )
   aadd( &( "vLibDefault"+DefineOohg3+DefinePelles+DefineXHarbour ), cPre+'zlib1'+cExt )

Return .T.

/* eof */

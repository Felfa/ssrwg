'****************************************************************************
'**                                                                        **
'**                              PALGEN.BAS                                **
'**                           îîîîîîîîîîîîîîîî                             **
'**              The Simple and Stupid Random Word Generator               **
'**                                                                        **
'**                                 O R                                    **
'**                                                                        **
'**                  "Generador de palabras aleatorias"                    **
'**                                                                        **
'**                           îîîîîîîîîîîîîîîî                             **
'** This program was initially released in 2004 from a 286 IBM PC computer **
'** by MicroBasic and re-released in 2011 using QB45 and QB64.             **
'**                                                                        **
'** The program can be run by typing SSRWG on BIN dir from DOS 3.0 or later**
'** and/or Microsoft Windows with x86 architecture. For x86_64 users run   **
'** the x86 version in dir X86WIN (compiled from QB64).                    **
'****************************************************************************

DECLARE SUB GeneraLetras ()
RANDOMIZE TIMER
DIM X AS INTEGER
DIM Num AS INTEGER
DIM Resul AS STRING
DIM SHARED Letra(26) AS STRING

DO
  Resul$ = ""
  CLS
  DO
    INPUT "¨Cu ntas letras tendr  tu palabra? ", Num
    IF Num > 25 THEN PRINT "Muy largo, ¨no crees?"
    IF Num < 1 THEN PRINT "No sab¡a que hab¡a palabras de esa longitud"
  LOOP WHILE Num > 25 OR Num < 1
  SCREEN 0, , 2

  CLS 2
  FOR X = 1 TO Num
    DO
      IF Num > 0 THEN
        GeneraLetras
        LOCATE 1, 1: INPUT "¨Vocal o Consonante? ¨O prefieres salir? (V/C/S): ", Vocons$
      END IF
    LOOP UNTIL UCASE$(Vocons$) = "V" OR UCASE$(Vocons$) = "C" OR UCASE$(Vocons$) = "S"
 
    IF UCASE$(Vocons$) = "V" THEN Resul$ = Resul$ + Letra$(INT((25 - 21 + 1) * RND + 21))
    IF UCASE$(Vocons$) = "C" THEN Resul$ = Resul$ + Letra$(INT(RND * 20))

    LOCATE 3, 1: PRINT "Restante:"; Num - X
    LOCATE 5, 1: PRINT Resul$

  NEXT X

  OPEN "LETRITAS.RES" FOR APPEND AS #1
  PRINT #1, Resul$
  CLOSE #1

  DO
    LOCATE 7, 1: INPUT "¨M s? (S/N): ", SN$
  LOOP UNTIL UCASE$(SN$) = "S" OR UCASE$(SN$) = "N"
LOOP WHILE UCASE$(SN$) = "S"

END

SUB GeneraLetras
Letra$(0) = "B"
Letra$(1) = "C"
Letra$(2) = "D"
Letra$(3) = "F"
Letra$(4) = "G"
Letra$(5) = "H"
Letra$(6) = "J"
Letra$(7) = "K"
Letra$(8) = "L"
Letra$(9) = "M"
Letra$(10) = "N"
Letra$(11) = "P"
Letra$(12) = "Q"
Letra$(13) = "R"
Letra$(14) = "S"
Letra$(15) = "T"
Letra$(16) = "V"
Letra$(17) = "W"
Letra$(18) = "X"
Letra$(19) = "Y"
Letra$(20) = "Z"
Letra$(21) = "A"
Letra$(22) = "E"
Letra$(23) = "I"
Letra$(24) = "O"
Letra$(25) = "U"
END SUB


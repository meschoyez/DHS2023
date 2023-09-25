grammar compiladores;

fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

PA : '(' ;
PC : ')' ;

NUMERO : DIGITO+ ;

WS : [ \t\r\n] -> skip ;
OTRO : . ;

ID : (LETRA | '_')(LETRA | DIGITO | '_')+ ;

// HORAPAR : ([01][02468] | '2'[02])':'[0-5]DIGITO ;

// FECHAPAR : ('0'[1-9] | [12] DIGITO | '30') '/' ('0'[2468] | '1'[02])
//                '/' DIGITO DIGITO DIGITO DIGITO ;

// s : ID     {print("ID ->" + $ID.text + "<--") }         s
//   | NUMERO {print("NUMERO ->" + $NUMERO.text + "<--") } s
//   | OTRO   {print("Otro ->" + $OTRO.text + "<--") }     s
//   | HORAPAR {print("Hora par ->" + $HORAPAR.text + "<--") }  s
//   | FECHAPAR {print("Mes par ->" + $FECHAPAR.text + "<--") }  s
//   | EOF
//   ;

si : s EOF ;

s : PA s PC s
  |
  ;


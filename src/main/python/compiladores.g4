grammar compiladores;

fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

EQ : '=' ;
PA : '(' ;
PC : ')' ;
LLA : '{' ;
LLC : '}' ;
PYC : ';' ;
COMA : ',' ;

NUMERO : DIGITO+ ;

TDATO : 'int' | 'double' ;
WHILE : 'while' ;

ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

WS : [ \t\r\n] -> skip ;
OTRO : . ;

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

// si : s EOF ;

// s : PA s PC s
//   |
//   ;

programa : instrucciones EOF ;

instrucciones : instruccion instrucciones
              |
              ;

instruccion : declaracion
            // | asignacion
            // | retornar
            // | if_stmt
            // | for_stmt
            | while_stmt
            | bloque
            ;

declaracion : TDATO ID definicion lista_var PYC ;

definicion : EQ NUMERO
           |
           ;

bloque : LLA instrucciones LLC ;

lista_var : COMA ID definicion lista_var
          |
          ;

while_stmt : WHILE PA opal PC instruccion ;

opal : ID ;

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
MAS : '+' ;
MENOS : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;

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
            | asignacion PYC
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

asignacion : ID EQ opal ;

opal : expresion ;

expresion : termino exp ;

exp : MAS   termino exp
    | MENOS termino exp
    |
    ;

termino : factor term ;

term : MULT factor term
     | DIV  factor term
     | MOD  factor term
     |
     ;

factor : NUMERO
       | ID
       | MENOS NUMERO
       | MENOS ID
       | funcion
       | PA expresion PC
       ;

funcion : ID PA ID PC ;

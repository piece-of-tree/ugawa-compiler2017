// antlr4 -package parser -o antlr-generated  -no-listener parser/TinyPiE.g4
grammar TinyPiE;

expr: orExpr
    ;

orExpr: orExpr OROP andExpr
	| andExpr
    ;

andExpr: andExpr ANDOP addExpr
	| addExpr
    ;

addExpr: addExpr (ADDOP|SUBOP) mulExpr
	| mulExpr
	;

mulExpr: mulExpr MULOP unaryExpr
	| unaryExpr
	;

unaryExpr: VALUE			# literalExpr
	| IDENTIFIER			# varExpr
	| '(' expr ')'		# parenExpr
	| SUBOP unaryExpr		# negativeExpr
	| NOT unaryExpr		# notExpr
	;

OROP: '|';
ANDOP: '&';
ADDOP: '+';
SUBOP: '-';
MULOP: '*'|'/';

NEGATIVE: '-';
NOT: '~';
IDENTIFIER: 'x'|'y'|'z';
VALUE: ([1-9] [0-9]*)| '0';
WS: [ \t\r\n] -> skip;
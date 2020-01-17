default:build check
build:
	flex src/Lexical.l
	gcc -o lexical lex.yy.c -lfl
	bison -d src/parsing.y
	flex src/parsing.l
	gcc -o parsing parsing.tab.c lex.yy.c -lfl
	dot -Tpdf src/grap.gv -o test2.pdf
check:
	./lexical < test/testcase.pl0
	./parsing < test/testcase.pl0
.PHONY:default build check
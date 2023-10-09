import sys
from antlr4 import *
from compiladoresLexer  import compiladoresLexer
from compiladoresParser import compiladoresParser
from miListener import miListener

def main(argv):
    archivo = "input/decl.c"
    if len(argv) > 1 :
        archivo = argv[1]
    input = FileStream(archivo)
    lexer = compiladoresLexer(input)
    stream = CommonTokenStream(lexer)
    parser = compiladoresParser(stream)
    listener = miListener()
    parser.addParseListener(listener)
    tree = parser.programa()
    # print(tree.toStringTree(recog=parser))

if __name__ == '__main__':
    main(sys.argv)
from antlr4 import *
from compiladoresListener import compiladoresListener
from compiladoresParser   import compiladoresParser

class miListener(compiladoresListener) :

    # Enter a parse tree produced by compiladoresParser#programa.
    def enterPrograma(self, ctx:compiladoresParser.ProgramaContext):
        print("Comenzando la compilacion")
        print("\t" + ctx.getText())

    # Exit a parse tree produced by compiladoresParser#programa.
    def exitPrograma(self, ctx:compiladoresParser.ProgramaContext):
        print("FIN de la compilacion")
        print("\t" + ctx.getText())
 
     # Enter a parse tree produced by compiladoresParser#bloque.
    def enterBloque(self, ctx:compiladoresParser.BloqueContext):
        print("Inicio bloque")

    # Exit a parse tree produced by compiladoresParser#bloque.
    def exitBloque(self, ctx:compiladoresParser.BloqueContext):
        # print("\tBloque con " + str(ctx.getChildCount()) + " hijos" )
        # print("\t --> " + ctx.getText())
        print("FIN bloque")

    def exitDeclaracion(self, ctx:compiladoresParser.DeclaracionContext):
        print("\tTipo dato : " + str(ctx.getChild(0)))
        print("\tnombre var: " + str(ctx.getChild(1)))

    # def enterEveryRule(self, ctx: ParserRuleContext):
    #     return super().enterEveryRule(ctx)
    
    # def visitTerminal(self, node: TerminalNode):
    #     print(" ---> Hoja --> " + str(node))
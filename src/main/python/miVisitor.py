from compiladoresParser import compiladoresParser
from compiladoresVisitor import compiladoresVisitor

class miVisitor(compiladoresVisitor) :
    def visitPrograma(self, ctx: compiladoresParser.ProgramaContext):
        print("Visitando arbol")
        return self.visitChildren(ctx)
    
    def visitDeclaracion(self, ctx:compiladoresParser.DeclaracionContext):
        print("   -> Visitando declaracion -> " + ctx.getText())
        return self.visitLista_var(ctx)

    def visitLista_var(self, ctx:compiladoresParser.Lista_varContext):
        print("  -->  --> lista var - " + ctx.getText())
        return self.visitChildren(ctx)


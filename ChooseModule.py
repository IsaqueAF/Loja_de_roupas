class Question:
    
    def __init__(self, statement="Make a Question"):
        
        self.statement = statement
        self.options = []
        
    def AddOption (self, question="this is a option", function=print):
        
        self.options.append([question, function])
        
    def Show (self):
        
        print("\n",self.statement,"\n")
        
        for option in self.options:
            print(self.options.index(option) + 1, " - ", option[0])
        print()
        
        while True:
            try:
                choose = int(input("> Escolha: "))
                
                return self.options[choose - 1][1]()
            except:
                print("\nNúmero ou caractere inválido\n")

question = Question("Pergunta")
question.AddOption("a")
question.AddOption("b")
question.AddOption("c")

question.Show()
import uuid

class PartRepository:
    def __init__(self):
        self.parts = []

    def add_part(self, part):
        self.parts.append(part)
    
    def get_list(self):
        parts_dictionary = []
        for part in self.parts:
            parts_dictionary.append(part.show())
        return parts_dictionary
    
    def get_part(self, code):
        for part in self.parts:
            print(type(part.code), type(code))
            if part.code == code:
                print("!!!", part)
                return part.show()
        return {}

    @staticmethod
    def mock_data():
        partRepository = PartRepository()

        part1 = Part(str(uuid.uuid4()), "Audi A3", "Sedan", [
            Subcomponent(4, Part(str(uuid.uuid4()), "Pneu", "Pirelli", [])),
            Subcomponent(4, Part(str(uuid.uuid4()), "Porta", "Leve", [])),
            Subcomponent(7, Part(str(uuid.uuid4()), "Luz", "LED", []))
        ])

        part2 = Part(str(uuid.uuid4()), "Kawasaki Vulcan", "Moto personalizada", [
            Subcomponent(2, Part(str(uuid.uuid4()), "Pneu", "Continental", [])),
            Subcomponent(2, Part(str(uuid.uuid4()), "Espelho", "Anti-glare", [])),
            Subcomponent(1, Part(str(uuid.uuid4()),"Escapamento", "Esportivo", []))
        ])

        part3 = Part(str(uuid.uuid4()), "Lamborghini Gallardo", "Modelo esportivo da Lamborghini", [
            Subcomponent(4, Part(str(uuid.uuid4()), "Pneu", "Pirelli", [])),
            Subcomponent(1, Part(str(uuid.uuid4()), "Cor", "Brilhante", [])),
            Subcomponent(2, Part(str(uuid.uuid4()), "Porta", "Baixa", []))
        ])

        partRepository.add_part(part1)
        partRepository.add_part(part2)
        partRepository.add_part(part3)
        
        return partRepository

class Part:
    def __init__(self, code, name, description, subcomponents):
        self.code = code
        self.name = name
        self.description = description
        self.subcomponents = subcomponents

    def show(self):
        part = {
            "code": self.code,
            "name": self.name,
            "description": self.description,
            "subcomponents": self.subcomponents_to_dictionary()
        }
        return part
    
    def subcomponents_to_dictionary(self):
        subcomponents = []
        for subcomponent in self.subcomponents:
            subcomponents.append(subcomponent.to_dictionary())
        return subcomponents

class Subcomponent:
    def __init__(self, amount, part):
        self.amount = amount
        self.part = part

    def to_dictionary(self):
        subcomponent = {"amount": self.amount, "part": self.part.show()}
        return subcomponent

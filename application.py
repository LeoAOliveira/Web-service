from flask import Flask, jsonify, request
import uuid
app = Flask(__name__)

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
    def __init__(self, part, amount):
        self.part = part
        self.amount = amount

    def to_dictionary(self):
        subcomponent = {"amount": self.amount, "part": self.part.show()}
        return subcomponent

partRepository = PartRepository()

@app.route("/addPart", methods=["POST"])
def addPart():
    json = request.get_json()
    subcomponents = []
    for subcomponent in json["subcomponents"]:
        part = Part(str(uuid.uuid4()), subcomponent["part"]["name"], subcomponent["part"]["description"], subcomponent["part"]["subcomponents"])
        sub = Subcomponent(part, subcomponent["amount"])
        subcomponents.append(sub)
    part = Part(str(uuid.uuid4()), json["name"], json["description"], subcomponents)
    partRepository.add_part(part)
    return "Success"

@app.route("/getList")
def getList():
    parts = partRepository.get_list()
    return jsonify(parts)

@app.route("/getPart/<code>")
def getPart(code):
    part = partRepository.get_part(code)
    return jsonify(part)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)

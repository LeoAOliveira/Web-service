from flask import Flask, jsonify, request
import uuid
from model import *
app = Flask(__name__)

partRepository = PartRepository.mock_data()

@app.route("/addPart", methods=["POST"])
def addPart():
    json = request.get_json()
    subcomponents = []
    for subcomponent in json["subcomponents"]:
        part = Part(str(uuid.uuid4()), subcomponent["part"]["name"], subcomponent["part"]["description"], subcomponent["part"]["subcomponents"])
        sub = Subcomponent(subcomponent["amount"], part)
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

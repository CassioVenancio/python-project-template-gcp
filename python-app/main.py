from flask import Flask, jsonify

# Inicializa o Flask
app = Flask(__name__)

@app.route("/")
def home():
    return jsonify(message="Hello, World!")

@app.route("/error")
def trigger_error():
    return jsonify(error="Simulated error"), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

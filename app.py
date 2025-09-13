# This is a sample Python/Flask script.
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello, Mahmood! 🚀 Your Flask API is enjoying on Render..."

if __name__ == "__main__":
    import os
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
from flask import Flask, jsonify

import google.cloud.logging
import google.cloud.error_reporting

# Initialize Flask app
app = Flask(__name__)

# Initialize Google Cloud Logging
client = google.cloud.logging.Client()
client.setup_logging()

# Initialize Google Cloud Error Reporting
error_client = google.cloud.error_reporting.Client()

@app.route('/')
def home():
    app.logger.info('Home endpoint was reached')
    return jsonify(message="Hello, World!")

@app.route('/error')
def trigger_error():
    try:
        raise ValueError("This is a test error")
    except Exception as e:
        error_client.report_exception()
        app.logger.error('An error occurred: %s', e)
        return jsonify(error=str(e)), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
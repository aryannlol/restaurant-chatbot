require('dotenv').config();
const express = require('express');
const https = require('https');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

const BASE_URL = 'https://api.langflow.astra.datastax.com';
const APPLICATION_TOKEN = process.env.APPLICATION_TOKEN;
const FLOW_ID = process.env.FLOW_ID;
const LANGFLOW_ID = process.env.LANGFLOW_ID;

app.use(cors());
app.use(bodyParser.json());

app.post('/chat', async (req, res) => {
  const { message } = req.body;

  if (!message || typeof message !== 'string' || message.trim() === '') {
    return res.status(400).send({ error: 'Invalid input. Please provide a valid message.' });
  }

  const endpoint = `/lf/${LANGFLOW_ID}/api/v1/run/${FLOW_ID}?stream=false`;
  const options = {
    hostname: 'api.langflow.astra.datastax.com',
    path: endpoint,
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${APPLICATION_TOKEN}`,
    },
  };

  const body = JSON.stringify({
    input_value: message,
    input_type: 'chat',
    output_type: 'chat',
    tweaks: {},
  });

  console.log('Sending request to external API:', { endpoint, body });

  const runFlow = () =>
    new Promise((resolve, reject) => {
      const req = https.request(options, (res) => {
        let data = '';
        res.on('data', (chunk) => {
          data += chunk;
        });
        res.on('end', () => {
          console.log('API response:', { statusCode: res.statusCode, data });
          try {
            if (res.statusCode === 200) {
              const result = JSON.parse(data);
              const outputData = result.outputs?.[0]?.outputs?.[0];
              resolve(outputData?.results?.message?.text || 'Error: No response from API.');
            } else if (res.statusCode === 405) {
              reject('Method Not Allowed: Check the HTTP method (POST, GET, etc.).');
            } else {
              reject(`Error: Unexpected status code ${res.statusCode}`);
            }
          } catch (error) {
            reject(`Error parsing response: ${error.message}`);
          }
        });
      });

      req.on('error', (error) => {
        reject(`Request error: ${error.message}`);
      });

      req.write(body);
      req.end();
    });

  try {
    const response = await runFlow();
    res.status(200).send({ response });
  } catch (error) {
    console.error('Error in runFlow:', error);
    let errorMessage = error;

    if (error.includes('Unauthorized')) {
      errorMessage += ' Please check your API token.';
    } else if (error.includes('Request error')) {
      errorMessage += ' Please verify your network connection.';
    }

    res.status(500).send({ error: errorMessage });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
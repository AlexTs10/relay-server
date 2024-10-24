import { RealtimeRelay } from './lib/relay.js';
import dotenv from 'dotenv';
dotenv.config({ override: true });

// Get API key from command line argument first, fallback to environment variable
const OPENAI_API_KEY = process.argv[2] || process.env.OPENAI_API_KEY;

if (!OPENAI_API_KEY) {
  console.error(
    `OpenAI API key is required.\n` +
    `Please provide it as a command line argument: node index.js YOUR_API_KEY\n` +
    `Or set OPENAI_API_KEY in your .env file.`
  );
  process.exit(1);
}

const PORT = parseInt(process.env.PORT) || 8081;

const relay = new RealtimeRelay(OPENAI_API_KEY);
relay.listen(PORT);

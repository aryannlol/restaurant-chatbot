const chatBox = document.getElementById('chat-box');
const userInput = document.getElementById('user-input');
const sendButton = document.getElementById('send-button');
const loader = document.getElementById('loader');

const addMessage = (text, sender) => {
  const messageWrapper = document.createElement('div');
  messageWrapper.className = `chat-message ${sender}`;

  const avatar = document.createElement('div');
  avatar.className = `chat-avatar ${sender}`;
  avatar.textContent = sender === 'user' ? 'U' : 'B';

  const bubble = document.createElement('div');
  bubble.className = `chat-bubble ${sender}`;
  bubble.textContent = text;

  messageWrapper.appendChild(avatar);
  messageWrapper.appendChild(bubble);

  chatBox.appendChild(messageWrapper);
  chatBox.scrollTop = chatBox.scrollHeight; // Scroll to the bottom
};

const sendMessage = async () => {
  const message = userInput.value.trim();
  if (!message) return;

  addMessage(message, 'user');
  userInput.value = '';

  // Show loader
  loader.style.display = 'flex';

  try {
    const response = await fetch('http://localhost:3000/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ message }),
    });

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.error || 'Failed to fetch response');
    }

    const data = await response.json();
    addMessage(data.response, 'bot');
  } catch (error) {
    console.error('Error:', error);
    addMessage(`Error: ${error.message}`, 'bot');
  } finally {
    // Hide loader
    loader.style.display = 'none';
  }
};
sendButton.addEventListener('click', sendMessage);
userInput.addEventListener('keypress', (e) => {
  if (e.key === 'Enter') sendMessage();
});
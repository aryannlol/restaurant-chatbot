:root {
    --primary-color: #6366f1;
    --secondary-color: #4f46e5;
    --bg-light: #f5f5fa;
    --text-dark: #1f2937;
    --text-light: #ffffff;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Inter', sans-serif;
    background-color: var(--bg-light);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: linear-gradient(135deg, #e0e7ff 0%, #f3f4f6 100%);
}

.chatbot-container {
    width: 420px;
    background-color: white;
    border-radius: 16px;
    box-shadow: 
        0 25px 50px -12px rgba(0, 0, 0, 0.08),
        0 10px 15px -3px rgba(0, 0, 0, 0.06);
    overflow: hidden;
    border: 1px solid rgba(229, 231, 235, 0.5);
}

.chat-header {
    background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
    color: var(--text-light);
    padding: 15px;
    text-align: center;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.chat-header h2 {
    font-weight: 600;
}

.chat-header .status {
    font-size: 12px;
    opacity: 0.7;
}

.chat-box {
    height: 500px;
    overflow-y: auto;
    padding: 15px;
    background-color: var(--bg-light);
    display: flex;
    flex-direction: column;
    gap: 12px;
    scrollbar-width: thin;
    scrollbar-color: var(--primary-color) transparent;
}

.chat-box::-webkit-scrollbar {
    width: 6px;
}

.chat-box::-webkit-scrollbar-thumb {
    background-color: var(--primary-color);
    border-radius: 3px;
}

.chat-message {
    display: flex;
    align-items: flex-end;
    gap: 10px;
    max-width: 85%;
    margin-bottom: 12px; /* Add spacing between messages */
}
/* User message on the LEFT */
.chat-message.user {
    justify-content: flex-start; /* Align user messages to the left */
    margin-right: auto; /* Push user messages to the left */
}
/* Bot message on the RIGHT */
.chat-message.bot {
    justify-content: flex-end; /* Align bot messages to the right */
    margin-left: auto; /* Push bot messages to the right */
}

.chat-avatar {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 14px;
    flex-shrink: 0;
}

.chat-avatar.user {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: var(--text-light);
}

.chat-avatar.bot {
    background-color: #e5e7eb;
    color: var(--text-dark);
}

.chat-bubble {
    max-width: calc(100% - 56px);
    padding: 12px 16px; /* Adjust padding for better spacing */
    border-radius: 12px;
    word-wrap: break-word;
    font-size: 14px; /* Ensure consistent font size */
    line-height: 1.5; /* Improve readability */
}

/* User chat bubble */
.chat-bubble.user {
    background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
    color: var(--text-light);
    border-bottom-left-radius: 4px; /* Adjust bubble corner */
    border-bottom-right-radius: 12px; /* Adjust bubble corner */
}
/* Bot chat bubble */
.chat-bubble.bot {
    background-color: white;
    color: var(--text-dark);
    border: 1px solid #e5e7eb;
    border-bottom-left-radius: 12px; /* Adjust bubble corner */
    border-bottom-right-radius: 4px; /* Adjust bubble corner */
}
.input-container {
    display: flex;
    padding: 15px;
    background-color: white;
    border-top: 1px solid #e5e7eb;
    gap: 10px;
}

#user-input {
    flex-grow: 1;
    padding: 12px 15px;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    outline: none;
    font-family: 'Inter', sans-serif;
    font-size: 14px;
    transition: border-color 0.3s;
}

#user-input:focus {
    border-color: var(--primary-color);
}

#send-button {
    background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
    border: none;
    color: white;
    padding: 10px 15px;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: transform 0.2s;
}

#send-button:hover {
    transform: scale(1.05);
}

/* Typing indicator */
.loader {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    padding: 10px;
    margin: 10px 0;
    width: fit-content;
}

.typing-indicator {
    display: flex;
    align-items: center;
    background-color: white; /* Match the chatbot's message bubble */
    padding: 10px 15px;
    border-radius: 12px;
    border: 1px solid #e5e7eb; /* Match the chatbot's message border */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05); /* Subtle shadow for depth */
}

.typing-indicator span {
    height: 8px;
    width: 8px;
    margin: 0 2px;
    background-color: #9ca3af; /* Dot color */
    border-radius: 50%;
    display: inline-block;
    animation: typing 1.4s infinite ease-in-out;
}

.typing-indicator span:nth-child(2) {
    animation-delay: 0.2s;
}

.typing-indicator span:nth-child(3) {
    animation-delay: 0.4s;
}

@keyframes typing {
    0%, 60%, 100% {
        transform: translateY(0);
    }
    30% {
        transform: translateY(-6px);
    }
}
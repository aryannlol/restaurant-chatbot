# 🍽️ Restaurant Chatbot  

Welcome to the **Restaurant Chatbot**! This AI-powered chatbot is built using **Langflow** and **Google Gemini** to provide users with real-time assistance for restaurant-related queries. It helps with menu details, reservations, operating hours, and much more!  

## 🚀 Features  

✅ **AI-Powered** – Uses Google Gemini for intelligent responses.  
✅ **Menu Assistance** – Provides dish details and recommendations.  
✅ **Reservation System** – Helps users book tables.  
✅ **Operating Hours Info** – Shares restaurant timings.  
✅ **Location Guidance** – Offers directions to the restaurant.  

---

## 🛠️ Installation  

Follow these steps to set up and run the chatbot locally:  

### **1️⃣ Clone the Repository**  
```bash
git clone https://github.com/aryannlol/restaurant-chatbot.git
cd restaurant-chatbot
```
### **2️⃣ Install Dependencies**  
Ensure **Node.js** is installed, then run:  
```bash
npm install
```

### **3️⃣ Set Up API Keys**  
- **Google Gemini API Key** – Obtain it from [Google AI Studio]([https://ai.google.dev/](https://aistudio.google.com/prompts/new_chat)).  

Create a `.env` file in the root folder and add:  
```env
GEMINI_API_KEY=your_google_gemini_api_key
GOOGLE_MAPS_API_KEY=your_google_maps_api_key
```

### **4️⃣ Run the Chatbot**  
```bash
node app.js
```
Open `index.html` in a browser and start chatting! 🎉  

---

## 🎮 How to Use  

Simply open the chatbot and ask questions like:  
- "Show me today's specials."  
- "Can I book a table for 2 at 8 PM?"  
- "What are your opening hours on weekends?"  

---

## 📁 Project Structure  

```
restaurant-chatbot/
├── app.js             # Backend logic
├── index.html         # Frontend interface
├── script.js          # Chatbot JavaScript
├── style.css          # Chat UI styling
├── package.json       # Project metadata
├── .env               # API keys (not to be committed)
└── README.md          # Project documentation
```

---

## 📌 Contributing  

Want to improve this chatbot? Follow these steps:  

1. **Fork the repo**  
2. **Create a new branch**  
   ```bash
   git checkout -b feature-name
   ```
3. **Commit your changes**  
   ```bash
   git commit -m "Added new feature"
   ```
4. **Push and create a Pull Request**  


---

## 🛠️ Langflow Component Flow  

The Langflow architecture:  

![langflow component flow](https://github.com/user-attachments/assets/280e3378-b7d6-4f93-b9d5-0271371781a8)

### UI
![image](https://github.com/user-attachments/assets/899d8382-e251-4e36-a4fb-d9340d3d9d8a)



# Simple Greeting JavaScript App

A simple console-based greeting application built with vanilla JavaScript.

## Features

- 🌟 **Multiple Greeting Messages**: 8 different greeting options
- ⏰ **Time-based Greetings**: Automatically selects appropriate greeting based on time of day
- 👤 **Personalized Greetings**: Greet users by name
- 🕐 **Current Time Display**: Shows current date and time
- 🎲 **Random Greetings**: Get random greeting messages
- 📋 **Available Functions**: Multiple utility functions for different use cases

## How to Use

### Run the App
```bash
node src/app.js
```

### Available Functions

1. **`greetUser(name)`** - Get a personalized greeting
   ```javascript
   greetUser("John"); // Outputs: "Hello! John!" with current time
   ```

2. **`showAllGreetings()`** - Display all available greeting messages
   ```javascript
   showAllGreetings(); // Lists all 8 greeting options
   ```

3. **`getTimeBasedGreeting()`** - Get greeting based on current time
   ```javascript
   getTimeBasedGreeting(); // Returns "Good morning!", "Good afternoon!", or "Good evening!"
   ```

4. **`getCurrentTime()`** - Get current date and time
   ```javascript
   getCurrentTime(); // Returns formatted current date and time
   ```

5. **`getRandomGreeting()`** - Get a random greeting message
   ```javascript
   getRandomGreeting(); // Returns one of the 8 greeting messages randomly
   ```

## Greeting Messages

1. Hello!
2. Good morning!
3. Good afternoon!
4. Good evening!
5. Welcome!
6. Hi there!
7. Greetings!
8. Hey!

## Example Output

When you run the app, you'll see:
```
=== Simple Greeting App ===
Welcome to the Simple Greeting App!
Type 'help' for available commands.

Example usage:
Hello! John!
Current time: 12/15/2023, 2:30:45 PM
Have a wonderful day!

Time-based greeting:
Good afternoon! It's 12/15/2023, 2:30:45 PM

Available commands:
- greet('YourName') - Get a personalized greeting
- showAllGreetings() - See all available greetings
- getTimeBasedGreeting() - Get greeting based on time of day
- getCurrentTime() - Get current date and time
- getRandomGreeting() - Get a random greeting message
```

## File Structure

```
GH-workflows/
├── src/
│   └── app.js         # Main JavaScript application
└── README.md          # This file
```

## Requirements

- Node.js (to run the JavaScript file)
- No additional dependencies required

## Usage in Other Scripts

The app exports all functions, so you can also use it as a module:

```javascript
const greetingApp = require('./src/app.js');

greetingApp.greetUser("Alice");
greetingApp.showAllGreetings();
```

## Customization

You can easily customize the app by:
- Adding new greeting messages to the `greetings` array
- Modifying the time-based greeting logic
- Adding new utility functions
- Changing the output format

Enjoy your simple greeting app! 🌟 
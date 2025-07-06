// Simple Greeting JavaScript App
console.log("=== Simple Greeting App ===");

// Array of greeting messages
const greetings = [
    "Hello!",
    "Good morning!",
    "Good afternoon!",
    "Good evening!",
    "Welcome!",
    "Hi there!",
    "Greetings!",
    "Hey!"
];

// Function to get current time
function getCurrentTime() {
    const now = new Date();
    return now.toLocaleString();
}

// Function to get a random greeting
function getRandomGreeting() {
    const randomIndex = Math.floor(Math.random() * greetings.length);
    return greetings[randomIndex];
}

// Function to greet user
function greetUser(name) {
    if (!name || name.trim() === "") {
        console.log("Please provide a name!");
        return;
    }
    
    const greeting = getRandomGreeting();
    const time = getCurrentTime();
    
    console.log(`\n${greeting} ${name}!`);
    console.log(`Current time: ${time}`);
    console.log("Have a wonderful day!\n");
}

// Function to show all available greetings
function showAllGreetings() {
    console.log("\nAvailable greetings:");
    greetings.forEach((greeting, index) => {
        console.log(`${index + 1}. ${greeting}`);
    });
    console.log("");
}

// Function to get time-based greeting
function getTimeBasedGreeting() {
    const hour = new Date().getHours();
    
    if (hour < 12) {
        return "Good morning!";
    } else if (hour < 17) {
        return "Good afternoon!";
    } else {
        return "Good evening!";
    }
}

// Main app function
function runGreetingApp() {
    console.log("Welcome to the Simple Greeting App!");
    console.log("Type 'help' for available commands.\n");
    
    // Example usage
    console.log("Example usage:");
    greetUser("John");
    
    console.log("Time-based greeting:");
    console.log(`${getTimeBasedGreeting()} It's ${getCurrentTime()}\n`);
    
    console.log("Available commands:");
    console.log("- greet('YourName') - Get a personalized greeting");
    console.log("- showAllGreetings() - See all available greetings");
    console.log("- getTimeBasedGreeting() - Get greeting based on time of day");
    console.log("- getCurrentTime() - Get current date and time");
    console.log("- getRandomGreeting() - Get a random greeting message\n");
}

// Run the app
runGreetingApp();

// Export functions for use in other scripts (if needed)
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        greetUser,
        showAllGreetings,
        getTimeBasedGreeting,
        getCurrentTime,
        getRandomGreeting,
        greetings
    };
}

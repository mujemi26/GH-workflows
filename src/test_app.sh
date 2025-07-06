#!/bin/bash

# Simple Greeting App Test Script
echo "=== Testing Simple Greeting App ==="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test counter
TESTS_PASSED=0
TESTS_FAILED=0

# Function to run test
run_test() {
    local test_name="$1"
    local command="$2"
    local expected_pattern="$3"
    
    echo -e "${YELLOW}Running test: $test_name${NC}"
    
    # Run the command and capture output
    local output=$(eval "$command" 2>&1)
    local exit_code=$?
    
    # Check if command executed successfully
    if [ $exit_code -eq 0 ]; then
        # Check if output contains expected pattern
        if echo "$output" | grep -q "$expected_pattern"; then
            echo -e "${GREEN}✓ PASS: $test_name${NC}"
            ((TESTS_PASSED++))
        else
            echo -e "${RED}✗ FAIL: $test_name${NC}"
            echo "Expected pattern: $expected_pattern"
            echo "Actual output: $output"
            ((TESTS_FAILED++))
        fi
    else
        echo -e "${RED}✗ FAIL: $test_name (Command failed with exit code $exit_code)${NC}"
        echo "Output: $output"
        ((TESTS_FAILED++))
    fi
    echo ""
}

# Test 1: Check if app.js exists and is executable
run_test "File existence check" "test -f src/app.js" ""

# Test 2: Check if app runs without errors
run_test "Basic app execution" "node src/app.js" "=== Simple Greeting App ==="

# Test 3: Check if app shows welcome message
run_test "Welcome message" "node src/app.js" "Welcome to the Simple Greeting App"

# Test 4: Check if app shows available commands
run_test "Available commands display" "node src/app.js" "Available commands:"

# Test 5: Check if app shows example usage
run_test "Example usage display" "node src/app.js" "Example usage:"

# Test 6: Check if app shows time-based greeting
run_test "Time-based greeting" "node src/app.js" "Time-based greeting:"

# Test 7: Check if app shows current time
run_test "Current time display" "node src/app.js" "Current time:"

# Test 8: Test greetUser function (using Node.js interactive mode)
run_test "greetUser function" "echo 'const app = require(\"./src/app.js\"); app.greetUser(\"TestUser\");' | node" "TestUser"

# Test 9: Test showAllGreetings function
run_test "showAllGreetings function" "echo 'const app = require(\"./src/app.js\"); app.showAllGreetings();' | node" "Available greetings:"

# Test 10: Test getTimeBasedGreeting function
run_test "getTimeBasedGreeting function" "echo 'const app = require(\"./src/app.js\"); console.log(app.getTimeBasedGreeting());' | node" "Good"

# Test 11: Test getCurrentTime function
run_test "getCurrentTime function" "echo 'const app = require(\"./src/app.js\"); console.log(app.getCurrentTime());' | node" "202"

# Test 12: Test getRandomGreeting function
run_test "getRandomGreeting function" "echo 'const app = require(\"./src/app.js\"); console.log(app.getRandomGreeting());' | node" "!"

# Test 13: Check if app exports functions correctly
run_test "Module exports" "echo 'const app = require(\"./src/app.js\"); console.log(typeof app.greetUser);' | node" "function"

# Test 14: Test error handling for empty name
run_test "Empty name handling" "echo 'const app = require(\"./src/app.js\"); app.greetUser(\"\");' | node" "Please provide a name"

# Test 15: Test error handling for null name
run_test "Null name handling" "echo 'const app = require(\"./src/app.js\"); app.greetUser();' | node" "Please provide a name"

echo "=== Test Summary ==="
echo -e "${GREEN}Tests passed: $TESTS_PASSED${NC}"
echo -e "${RED}Tests failed: $TESTS_FAILED${NC}"
echo "Total tests: $((TESTS_PASSED + TESTS_FAILED))"

if [ $TESTS_FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}❌ Some tests failed!${NC}"
    exit 1
fi 
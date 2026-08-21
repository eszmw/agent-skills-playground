%% Assessment: The function displays the greeting.
studentDisplay = string(evalc("greetUser(name);"));
expectedGreeting = string(referenceVariables.greeting);
assert(contains(studentDisplay, expectedGreeting), ...
    "The function must display the greeting it returns.")

%% Test 1: Create the primary welcome message
expectedMessage = "Welcome, " + studentName + "! Your student ID is " + string(studentId) + ".";
assessVariableEqual('welcomeMessage', expectedMessage);

%% Test 2: Create the alternate welcome message
expectedMessage = "Welcome, " + alternateStudentName + "! Your student ID is " + string(alternateStudentId) + ".";
assessVariableEqual('alternateWelcomeMessage', expectedMessage);

%% Test 3: Use the alternate identifier range correctly
expectedMessage = "Welcome, " + alternateStudentName + "! Your student ID is " + string(alternateStudentId) + ".";
assessVariableEqual('alternateWelcomeMessage', expectedMessage);

%% Test 4: Store the primary message as a string
assessVariableEqual('class(welcomeMessage)', 'string');

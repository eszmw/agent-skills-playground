% Given student information
studentName = "Avery Nguyen";
studentId = randi([1000, 9999]);
alternateStudentName = "Jordan Patel";
alternateStudentId = randi([100000, 999999]);

% Create readable welcome messages
welcomeMessage = "Welcome, " + studentName + "! Your student ID is " + string(studentId) + ".";
alternateWelcomeMessage = "Welcome, " + alternateStudentName + "! Your student ID is " + string(alternateStudentId) + ".";

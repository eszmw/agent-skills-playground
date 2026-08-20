%% Test 1: Create the primary multi-line notice
expectedNotice = eventTitle + newline + "Day: " + string(eventDay) + newline + "Location: " + eventRoom;
assessVariableEqual('eventNotice', expectedNotice);

%% Test 2: Create the alternate multi-line notice
expectedNotice = alternateEventTitle + newline + "Day: " + string(alternateEventDay) + newline + "Location: " + alternateEventRoom;
assessVariableEqual('alternateEventNotice', expectedNotice);

%% Test 3: Use the alternate day range correctly
expectedNotice = alternateEventTitle + newline + "Day: " + string(alternateEventDay) + newline + "Location: " + alternateEventRoom;
assessVariableEqual('alternateEventNotice', expectedNotice);

%% Test 4: Store the primary notice as a string
assessVariableEqual('class(eventNotice)', 'string');

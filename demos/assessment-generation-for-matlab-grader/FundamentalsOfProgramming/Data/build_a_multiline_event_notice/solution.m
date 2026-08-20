% Given event details
eventTitle = "Research Expo";
eventDay = randi([1, 31]);
eventRoom = "Engineering Hall";
alternateEventTitle = "Design Showcase";
alternateEventDay = randi([100, 999]);
alternateEventRoom = "Innovation Center";

% Create multi-line event notices
eventNotice = eventTitle + newline + "Day: " + string(eventDay) + newline + "Location: " + eventRoom;
alternateEventNotice = alternateEventTitle + newline + "Day: " + string(alternateEventDay) + newline + "Location: " + alternateEventRoom;

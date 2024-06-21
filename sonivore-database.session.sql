
-- @block (CREATE Users Table)
CREATE TABLE Users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    bio TEXT
);

-- @block (CREATE Events Table)
CREATE TABLE Events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    date DATE NOT NULL,
    time TIME NOT NULL,
    venue_name VARCHAR(255) NOT NULL,
    venue_address VARCHAR(255) NOT NULL,
    poster_img VARCHAR(255)
);

-- @block (CREATE USERS <-> EVENTS)
-- Create a table to link Users and Events (many-to-many relationship)
CREATE TABLE UserEvents (
    user_id INT,
    event_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (event_id) REFERENCES Events(id),
    PRIMARY KEY (user_id, event_id)
);

-- @block (Insert into Users Table)
INSERT INTO Users (email, bio)
VALUES
    ('hello@world.com', 'I love pineapples on pizza!'),
    ('anotheruser@example.com', 'I prefer my pizza without pineapples.');

-- @block
INSERT INTO Events (name, description, date, start_time, venue_name, venue_address)
VALUES
    ('Everything Black', 
        "Everything Black is a live performance showcase of Black art's influence in society, featuring artists from across the central and southern coast of California. With a focus on music, poetry, photography and orated words of Black liberation, it creates an immersive environment that honors the diverse, historic and modern contributions of Black artists and culture bearers.",
    '2024-06-21', '20:00:00', 
    'Sonivore Music Studios', '1305 Fair Ave, Santa Cruz, CA 95060, USA');

-- @block
INSERT INTO Events (name, description, date, start_time, venue_name, venue_address)
VALUES
    ('Free The Sound', 
        "Free the Sound is a music-led event series addressing the city's need for a network of inclusive third places where people feel open to consciously relate to themselves and others and facilitate social evolution through a meaningful art experience. It's a series which utilizes the power of music and art as tools for bringing people together to rectify systemic issues.",
    '2024-07-14', '20:00:00', 
    '418 Project', '155 River St S, Santa Cruz, CA 95060');

-- @block (SELECT ALL USERS)
SELECT email, id FROM Users
ORDER BY id ASC;

-- @block
SELECT * from Events;

-- @block
-- Update a user's bio
UPDATE Users
SET bio = 'I have changed my mind about pineapples on pizza.'
WHERE email = 'hello@world.com';

-- @block
-- Delete a user
DELETE FROM Users
WHERE email = 'anotheruser@example.com';

-- @block
-- Select all events with their venue name
SELECT name, venue_name FROM Events;

-- @block
-- Join Users and Events to get the list of users attending each event
SELECT Users.email, Events.name
FROM Users
JOIN UserEvents ON Users.id = UserEvents.user_id
JOIN Events ON Events.id = UserEvents.event_id;

-- @block
-- Count the number of users attending each event
SELECT Events.name, COUNT(UserEvents.user_id) AS attendee_count
FROM Events
JOIN UserEvents ON Events.id = UserEvents.event_id
GROUP BY Events.name;

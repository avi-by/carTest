CREATE TABLE customer
(
  customerId INT NOT NULL,
  customer_Membership INT NOT NULL,
  registration_date INT NOT NULL,
  phone_number INT,
  email INT NOT NULL,
  PRIMARY KEY (customerId)
);

CREATE TABLE orders
(
  orderId INT NOT NULL,
  orderDate INT NOT NULL,
  orderDiscount INT,
  customerId INT NOT NULL,
  PRIMARY KEY (orderId),
  FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE movies
(
  movieID INT NOT NULL,
   removalDate DATE NOT NULL,
  movieName VARCHAR(40) NOT NULL,
  genre VARCHAR(10) NOT NULL,
  rating FLOAT NOT NULL,
  releaseDate DATE NOT NULL,
  releaseYear INT NOT NULL,
  PRIMARY KEY (movieID)
);

CREATE TABLE tickets
(
  ticketLine INT NOT NULL,
  ticketId INT NOT NULL,
  ticketStatus VARCHAR(10) NOT NULL,
  movieName INT NOT NULL,
  ticketChair INT NOT NULL,
  ticketCost FLOAT NOT NULL,
  theaterId INT NOT NULL,
  orderId INT NOT NULL,
  movieID INT NOT NULL,
  PRIMARY KEY (ticketId),
  FOREIGN KEY (orderId) REFERENCES orders(orderId),
  FOREIGN KEY (movieID) REFERENCES movies(movieID)
);

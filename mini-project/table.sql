CREATE TABLE customer
(
  customerId INT NOT NULL,
  customer_Membership VARCHAR(20) NOT NULL,
  customer_Registration_Date DATE NOT NULL,
  customerPhoneNumber  VARCHAR(20) NOT NULL,
  customerEmail VARCHAR(30) NOT NULL,
  PRIMARY KEY (customerId)
);

CREATE TABLE orders
(
  orderId INT NOT NULL,
  orderDate DATE NOT NULL,
  orderDiscount FLOAT NOT NULL,
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
  ticketChair INT NOT NULL,
  ticketCost FLOAT NOT NULL,
  ticketDate DATE NOT NULL,
  orderId INT NOT NULL,
  movieID INT NOT NULL,
  PRIMARY KEY (ticketId),
  FOREIGN KEY (orderId) REFERENCES orders(orderId),
  FOREIGN KEY (movieID) REFERENCES movies(movieID)
);

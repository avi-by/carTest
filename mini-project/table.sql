CREATE TABLE customer
(
  customerId INT NOT NULL,
  Subscription_Type INT NOT NULL,
  registration_date INT NOT NULL,
  phone_number INT,
  email INT NOT NULL,
  PRIMARY KEY (customerId)
);

CREATE TABLE order
(
  orderId INT NOT NULL,
  date INT NOT NULL,
  discount INT,
  customerId INT NOT NULL,
  PRIMARY KEY (orderId),
  FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE ticket
(
  line INT NOT NULL,
  ticketId INT NOT NULL,
  status INT NOT NULL,
  movieName INT NOT NULL,
  movieId INT NOT NULL,
  chair INT NOT NULL,
  theaterId INT NOT NULL,
  orderId INT NOT NULL,
  PRIMARY KEY (ticketId),
  FOREIGN KEY (orderId) REFERENCES order(orderId),
  UNIQUE (movieId)
);
CREATE TABLE coustumer
(
  id INT NOT NULL,
  Subscription_Type INT NOT NULL,
  registration_date INT NOT NULL,
  phone_number INT,
  email INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE order
(
  id INT NOT NULL,
  date INT NOT NULL,
  discount INT,
  id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES coustumer(id)
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
  id INT NOT NULL,
  PRIMARY KEY (ticketId),
  FOREIGN KEY (id) REFERENCES order(id),
  UNIQUE (movieId)
);
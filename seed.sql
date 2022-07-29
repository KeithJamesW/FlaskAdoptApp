DROP DATABASE IF EXISTS  adopt;

CREATE DATABASE adopt;

\c adopt

CREATE TABLE pets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  species TEXT NOT NULL,
  photo_url TEXT,
  age INT,
  notes TEXT,
  available BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO pets
  (name, species, photo_url, age, notes, available)
VALUES
  ('Bosco', 'cat', 'https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2018/06/cat-217679.jpg?h=c4ed616d&itok=3qHaqQ56', 4, 'Loves people and other cats.', 't'),
  ('Zelda', 'cat', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjbPdsMTCNZcwI9y_ebV7jyf3ImNDqNYUOdg&usqp=CAU', 6, 'Must be in a single-pet home!', 't'),
  ('Clover', 'dog', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Labrador_on_Quantock_%282175262184%29.jpg/1200px-Labrador_on_Quantock_%282175262184%29.jpg', 9, 'Loves wide open spaces!', 't'),
  ('Snow', 'rabbit', 'https://i.guim.co.uk/img/media/891e0c9fb79e98c560b2f2008ebd8fafcf470468/0_0_2592_1555/master/2592.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=10aee7cdb068e7481fd56a4a6093e2ed', 2, null, 't');


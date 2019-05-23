ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT (60);

UPDATE pokemon SET hp = 59 WHERE name = 'Pikachu';

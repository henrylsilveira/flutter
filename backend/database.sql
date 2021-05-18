CREATE TABLE "animal" (
  "id" SERIAL PRIMARY KEY,
  "nome" text NOT NULL,
  "raca" text NOT NULL,
  "user_id" int NOT NULL
);

CREATE TABLE "vacinas" (
  "id" SERIAL PRIMARY KEY,
  "tipo" text NOT NULL,
  "motivo" text NOT NULL,
  "data" timestamp DEFAULT (now()),
  "animal_id" int NOT NULL
);

CREATE TABLE "consultas" (
  "id" SERIAL PRIMARY KEY,
  "causa" text NOT NULL,
  "observacacao" text NOT NULL,
  "data" timestamp DEFAULT (now()),
  "animal_id" int NOT NULL
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "nome" text NOT NULL,
  "email" text UNIQUE NOT NULL,
  "password" text NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

-- Foreign key
ALTER TABLE "animal" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "vacinas" ADD FOREIGN KEY ("animal_id") REFERENCES "animal" ("id");
ALTER TABLE "consultas" ADD FOREIGN KEY ("animal_id") REFERENCES "animal" ("id");

INSERT INTO vacinas(tipo,motivo,data,animal_id) VALUES ('antirábica','doente','12/02/2021',8);
INSERT INTO vacinas(tipo,motivo,data,animal_id) VALUES ('anti','doente','18/02/2021',8);
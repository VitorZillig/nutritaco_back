/*
  Warnings:

  - Added the required column `sodio` to the `alimentos` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_alimentos" (
    "num" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "umidade" REAL NOT NULL,
    "kcal" REAL NOT NULL,
    "proteina" REAL NOT NULL,
    "lipideo" REAL NOT NULL,
    "colesterol" REAL NOT NULL,
    "carboidrato" REAL NOT NULL,
    "fibra_alimentar" REAL NOT NULL,
    "calcio" REAL NOT NULL,
    "magnesio" REAL NOT NULL,
    "manganes" REAL NOT NULL,
    "fosforo" REAL NOT NULL,
    "ferro" REAL NOT NULL,
    "sodio" REAL NOT NULL,
    "potassio" REAL NOT NULL,
    "cobre" REAL NOT NULL,
    "zinco" REAL NOT NULL,
    "retinol" REAL NOT NULL,
    "tiamina" REAL NOT NULL,
    "riboflavina" REAL NOT NULL,
    "piridoxina" REAL NOT NULL,
    "niacina" REAL NOT NULL,
    "vitamina_c" REAL NOT NULL
);
INSERT INTO "new_alimentos" ("calcio", "carboidrato", "category", "cobre", "colesterol", "ferro", "fibra_alimentar", "fosforo", "kcal", "lipideo", "magnesio", "manganes", "name", "niacina", "num", "piridoxina", "potassio", "proteina", "retinol", "riboflavina", "tiamina", "umidade", "vitamina_c", "zinco") SELECT "calcio", "carboidrato", "category", "cobre", "colesterol", "ferro", "fibra_alimentar", "fosforo", "kcal", "lipideo", "magnesio", "manganes", "name", "niacina", "num", "piridoxina", "potassio", "proteina", "retinol", "riboflavina", "tiamina", "umidade", "vitamina_c", "zinco" FROM "alimentos";
DROP TABLE "alimentos";
ALTER TABLE "new_alimentos" RENAME TO "alimentos";
CREATE UNIQUE INDEX "alimentos_name_key" ON "alimentos"("name");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

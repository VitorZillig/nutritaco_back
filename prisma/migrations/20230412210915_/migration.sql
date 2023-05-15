/*
  Warnings:

  - The primary key for the `alimentos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `num` on the `alimentos` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `dieta_alimento` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `alimento_id` on the `dieta_alimento` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_alimentos" (
    "num" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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
INSERT INTO "new_alimentos" ("calcio", "carboidrato", "category", "cobre", "colesterol", "ferro", "fibra_alimentar", "fosforo", "kcal", "lipideo", "magnesio", "manganes", "name", "niacina", "num", "piridoxina", "potassio", "proteina", "retinol", "riboflavina", "sodio", "tiamina", "umidade", "vitamina_c", "zinco") SELECT "calcio", "carboidrato", "category", "cobre", "colesterol", "ferro", "fibra_alimentar", "fosforo", "kcal", "lipideo", "magnesio", "manganes", "name", "niacina", "num", "piridoxina", "potassio", "proteina", "retinol", "riboflavina", "sodio", "tiamina", "umidade", "vitamina_c", "zinco" FROM "alimentos";
DROP TABLE "alimentos";
ALTER TABLE "new_alimentos" RENAME TO "alimentos";
CREATE UNIQUE INDEX "alimentos_name_key" ON "alimentos"("name");
CREATE TABLE "new_dieta_alimento" (
    "alimento_id" INTEGER NOT NULL,
    "dieta_id" TEXT NOT NULL,

    PRIMARY KEY ("alimento_id", "dieta_id"),
    CONSTRAINT "dieta_alimento_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "alimentos" ("num") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "dieta_alimento_dieta_id_fkey" FOREIGN KEY ("dieta_id") REFERENCES "dietas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_dieta_alimento" ("alimento_id", "dieta_id") SELECT "alimento_id", "dieta_id" FROM "dieta_alimento";
DROP TABLE "dieta_alimento";
ALTER TABLE "new_dieta_alimento" RENAME TO "dieta_alimento";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_dietas" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "id_user" TEXT NOT NULL,
    CONSTRAINT "dietas_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "usuarios" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_dietas" ("id", "id_user", "name") SELECT "id", "id_user", "name" FROM "dietas";
DROP TABLE "dietas";
ALTER TABLE "new_dietas" RENAME TO "dietas";
CREATE UNIQUE INDEX "dietas_name_key" ON "dietas"("name");
CREATE TABLE "new_dieta_alimento" (
    "alimento_id" INTEGER NOT NULL,
    "dieta_id" TEXT NOT NULL,
    "quant" REAL NOT NULL DEFAULT 100,

    PRIMARY KEY ("alimento_id", "dieta_id"),
    CONSTRAINT "dieta_alimento_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "alimentos" ("num") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "dieta_alimento_dieta_id_fkey" FOREIGN KEY ("dieta_id") REFERENCES "dietas" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_dieta_alimento" ("alimento_id", "dieta_id", "quant") SELECT "alimento_id", "dieta_id", "quant" FROM "dieta_alimento";
DROP TABLE "dieta_alimento";
ALTER TABLE "new_dieta_alimento" RENAME TO "dieta_alimento";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

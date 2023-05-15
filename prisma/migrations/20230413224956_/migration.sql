-- CreateTable
CREATE TABLE "AlimentoQuant" (
    "alimento_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quant" REAL NOT NULL,
    CONSTRAINT "AlimentoQuant_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "alimentos" ("num") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_dieta_alimento" (
    "alimento_id" INTEGER NOT NULL,
    "dieta_id" TEXT NOT NULL,

    PRIMARY KEY ("alimento_id", "dieta_id"),
    CONSTRAINT "dieta_alimento_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "AlimentoQuant" ("alimento_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "dieta_alimento_dieta_id_fkey" FOREIGN KEY ("dieta_id") REFERENCES "dietas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_dieta_alimento" ("alimento_id", "dieta_id") SELECT "alimento_id", "dieta_id" FROM "dieta_alimento";
DROP TABLE "dieta_alimento";
ALTER TABLE "new_dieta_alimento" RENAME TO "dieta_alimento";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

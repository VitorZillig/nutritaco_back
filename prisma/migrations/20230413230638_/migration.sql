-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_alimento_quant" (
    "alimento_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quant" REAL NOT NULL DEFAULT 100,
    CONSTRAINT "alimento_quant_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "alimentos" ("num") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_alimento_quant" ("alimento_id", "quant") SELECT "alimento_id", "quant" FROM "alimento_quant";
DROP TABLE "alimento_quant";
ALTER TABLE "new_alimento_quant" RENAME TO "alimento_quant";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

/*
  Warnings:

  - You are about to drop the `DietaAlimento` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "DietaAlimento";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "dieta_alimento" (
    "alimento_id" TEXT NOT NULL,
    "dieta_id" TEXT NOT NULL,

    PRIMARY KEY ("alimento_id", "dieta_id"),
    CONSTRAINT "dieta_alimento_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "alimentos" ("num") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "dieta_alimento_dieta_id_fkey" FOREIGN KEY ("dieta_id") REFERENCES "dietas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

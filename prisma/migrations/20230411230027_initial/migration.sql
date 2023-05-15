-- CreateTable
CREATE TABLE "usuarios" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "dietas" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "id_user" TEXT NOT NULL,
    CONSTRAINT "dietas_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "alimentos" (
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

-- CreateTable
CREATE TABLE "DietaAlimento" (
    "alimento_id" TEXT NOT NULL,
    "dieta_id" TEXT NOT NULL,

    PRIMARY KEY ("alimento_id", "dieta_id"),
    CONSTRAINT "DietaAlimento_alimento_id_fkey" FOREIGN KEY ("alimento_id") REFERENCES "alimentos" ("num") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "DietaAlimento_dieta_id_fkey" FOREIGN KEY ("dieta_id") REFERENCES "dietas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "dietas_name_key" ON "dietas"("name");

-- CreateIndex
CREATE UNIQUE INDEX "alimentos_name_key" ON "alimentos"("name");

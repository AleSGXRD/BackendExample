-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Client" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "ci" TEXT NOT NULL,
    "email" TEXT,
    "phoneNumber" TEXT,
    "machineId" INTEGER NOT NULL
);
INSERT INTO "new_Client" ("ci", "email", "id", "machineId", "name", "phoneNumber") SELECT "ci", "email", "id", "machineId", "name", "phoneNumber" FROM "Client";
DROP TABLE "Client";
ALTER TABLE "new_Client" RENAME TO "Client";
CREATE UNIQUE INDEX "Client_name_key" ON "Client"("name");
CREATE UNIQUE INDEX "Client_ci_key" ON "Client"("ci");
CREATE TABLE "new_Machine" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL,
    "brand" TEXT,
    "motherBoard" TEXT,
    "CPU" TEXT,
    "powerSupply" TEXT,
    "GPU" TEXT,
    "HDD" TEXT,
    "RAM" TEXT,
    "others" TEXT,
    "description" TEXT,
    "price" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Machine" ("CPU", "GPU", "HDD", "RAM", "brand", "createdAt", "description", "id", "motherBoard", "others", "powerSupply", "price", "type") SELECT "CPU", "GPU", "HDD", "RAM", "brand", "createdAt", "description", "id", "motherBoard", "others", "powerSupply", "price", "type" FROM "Machine";
DROP TABLE "Machine";
ALTER TABLE "new_Machine" RENAME TO "Machine";
CREATE UNIQUE INDEX "Machine_type_key" ON "Machine"("type");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

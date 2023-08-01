/*
  Warnings:

  - You are about to drop the column `machineId` on the `Client` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Machine" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "kind" TEXT,
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
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "clientId" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "Machine_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Machine" ("CPU", "GPU", "HDD", "RAM", "brand", "createdAt", "description", "id", "kind", "motherBoard", "others", "powerSupply", "price") SELECT "CPU", "GPU", "HDD", "RAM", "brand", "createdAt", "description", "id", "kind", "motherBoard", "others", "powerSupply", "price" FROM "Machine";
DROP TABLE "Machine";
ALTER TABLE "new_Machine" RENAME TO "Machine";
CREATE TABLE "new_Client" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "ci" TEXT,
    "email" TEXT,
    "phoneNumber" TEXT
);
INSERT INTO "new_Client" ("ci", "email", "id", "name", "phoneNumber") SELECT "ci", "email", "id", "name", "phoneNumber" FROM "Client";
DROP TABLE "Client";
ALTER TABLE "new_Client" RENAME TO "Client";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

/*
  Warnings:

  - You are about to drop the column `type` on the `Machine` table. All the data in the column will be lost.

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
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Machine" ("CPU", "GPU", "HDD", "RAM", "brand", "createdAt", "description", "id", "motherBoard", "others", "powerSupply", "price") SELECT "CPU", "GPU", "HDD", "RAM", "brand", "createdAt", "description", "id", "motherBoard", "others", "powerSupply", "price" FROM "Machine";
DROP TABLE "Machine";
ALTER TABLE "new_Machine" RENAME TO "Machine";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

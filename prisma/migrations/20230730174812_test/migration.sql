-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_OrderFinished" (
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
    "completed" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL,
    "finishedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "clientId" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "OrderFinished_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_OrderFinished" ("CPU", "GPU", "HDD", "RAM", "brand", "clientId", "completed", "createdAt", "description", "id", "kind", "motherBoard", "others", "powerSupply", "price") SELECT "CPU", "GPU", "HDD", "RAM", "brand", "clientId", "completed", "createdAt", "description", "id", "kind", "motherBoard", "others", "powerSupply", "price" FROM "OrderFinished";
DROP TABLE "OrderFinished";
ALTER TABLE "new_OrderFinished" RENAME TO "OrderFinished";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

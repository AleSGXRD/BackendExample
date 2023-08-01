/*
  Warnings:

  - You are about to drop the `Machine` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Machine";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Order" (
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
    CONSTRAINT "Order_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "OrderFinished" (
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
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "clientId" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "OrderFinished_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

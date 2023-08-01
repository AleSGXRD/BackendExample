-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Client" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "ci" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "machineId" INTEGER NOT NULL
);
INSERT INTO "new_Client" ("ci", "email", "id", "machineId", "name", "phoneNumber") SELECT "ci", "email", "id", "machineId", "name", "phoneNumber" FROM "Client";
DROP TABLE "Client";
ALTER TABLE "new_Client" RENAME TO "Client";
CREATE UNIQUE INDEX "Client_name_key" ON "Client"("name");
CREATE UNIQUE INDEX "Client_ci_key" ON "Client"("ci");
CREATE UNIQUE INDEX "Client_email_key" ON "Client"("email");
CREATE UNIQUE INDEX "Client_phoneNumber_key" ON "Client"("phoneNumber");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Client" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "ci" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "machineId" INTEGER NOT NULL,
    CONSTRAINT "Client_machineId_fkey" FOREIGN KEY ("machineId") REFERENCES "Machine" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Machine" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type" TEXT NOT NULL,
    "brand" TEXT NOT NULL,
    "motherBoard" TEXT NOT NULL,
    "CPU" TEXT NOT NULL,
    "powerSupply" TEXT NOT NULL,
    "GPU" TEXT NOT NULL,
    "HDD" TEXT NOT NULL,
    "RAM" TEXT NOT NULL,
    "others" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "User_name_key" ON "User"("name");

-- CreateIndex
CREATE UNIQUE INDEX "User_password_key" ON "User"("password");

-- CreateIndex
CREATE UNIQUE INDEX "Client_name_key" ON "Client"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Client_ci_key" ON "Client"("ci");

-- CreateIndex
CREATE UNIQUE INDEX "Client_email_key" ON "Client"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Client_phoneNumber_key" ON "Client"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_type_key" ON "Machine"("type");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_brand_key" ON "Machine"("brand");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_motherBoard_key" ON "Machine"("motherBoard");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_CPU_key" ON "Machine"("CPU");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_powerSupply_key" ON "Machine"("powerSupply");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_GPU_key" ON "Machine"("GPU");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_HDD_key" ON "Machine"("HDD");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_RAM_key" ON "Machine"("RAM");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_others_key" ON "Machine"("others");

-- CreateIndex
CREATE UNIQUE INDEX "Machine_description_key" ON "Machine"("description");

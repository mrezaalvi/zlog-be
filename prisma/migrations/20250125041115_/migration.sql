/*
  Warnings:

  - A unique constraint covering the columns `[kode]` on the table `Project` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Project_kode_key` ON `Project`(`kode`);

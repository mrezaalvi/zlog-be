/*
  Warnings:

  - Made the column `namaPekerja` on table `Bppb` required. This step will fail if there are existing NULL values in that column.
  - Made the column `lokasi` on table `Bppb` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `Bppb` MODIFY `namaPekerja` VARCHAR(191) NOT NULL,
    MODIFY `lokasi` VARCHAR(191) NOT NULL;

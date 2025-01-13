/*
  Warnings:

  - You are about to drop the column `namaPekerja` on the `DetailBppb` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Bppb` ADD COLUMN `accStatus` ENUM('APPROVED', 'NOT_APPROVED', 'WAITING') NOT NULL DEFAULT 'WAITING',
    ADD COLUMN `namaPekerja` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `DetailBppb` DROP COLUMN `namaPekerja`;

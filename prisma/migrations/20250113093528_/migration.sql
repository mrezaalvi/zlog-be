/*
  Warnings:

  - You are about to drop the column `lokasi` on the `DetailBppb` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Bppb` ADD COLUMN `lokasi` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `DetailBppb` DROP COLUMN `lokasi`;

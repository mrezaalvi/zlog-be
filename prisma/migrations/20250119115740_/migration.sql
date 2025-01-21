/*
  Warnings:

  - You are about to drop the column `lokasi` on the `Bppb` table. All the data in the column will be lost.
  - Added the required column `lokasi` to the `DetailBppb` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Bppb` DROP COLUMN `lokasi`;

-- AlterTable
ALTER TABLE `DetailBppb` ADD COLUMN `lokasi` VARCHAR(191) NOT NULL;

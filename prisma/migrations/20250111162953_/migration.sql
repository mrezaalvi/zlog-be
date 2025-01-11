/*
  Warnings:

  - You are about to drop the column `sppStatus` on the `Bppb` table. All the data in the column will be lost.
  - You are about to drop the column `bppbId` on the `DetailSpp` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `DetailSpp` DROP FOREIGN KEY `DetailSpp_bppbId_fkey`;

-- DropIndex
DROP INDEX `DetailSpp_bppbId_fkey` ON `DetailSpp`;

-- AlterTable
ALTER TABLE `Bppb` DROP COLUMN `sppStatus`,
    ADD COLUMN `bppbStatus` ENUM('APPROVED', 'NOT_APPROVED', 'WAITING') NOT NULL DEFAULT 'WAITING';

-- AlterTable
ALTER TABLE `DetailSpp` DROP COLUMN `bppbId`;

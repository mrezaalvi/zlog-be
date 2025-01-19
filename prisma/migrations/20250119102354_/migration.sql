/*
  Warnings:

  - You are about to drop the column `accFinalStatus` on the `DataSpp` table. All the data in the column will be lost.
  - You are about to drop the column `sppAccFinalId` on the `Project` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `Project` DROP FOREIGN KEY `Project_sppAccFinalId_fkey`;

-- DropIndex
DROP INDEX `Project_sppAccFinalId_fkey` ON `Project`;

-- AlterTable
ALTER TABLE `DataSpp` DROP COLUMN `accFinalStatus`;

-- AlterTable
ALTER TABLE `Project` DROP COLUMN `sppAccFinalId`;

-- AddForeignKey
ALTER TABLE `PicProject` ADD CONSTRAINT `PicProject_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

/*
  Warnings:

  - You are about to drop the column `acc1At` on the `DataSpp` table. All the data in the column will be lost.
  - You are about to drop the column `acc1ByUserId` on the `DataSpp` table. All the data in the column will be lost.
  - You are about to drop the column `acc2At` on the `DataSpp` table. All the data in the column will be lost.
  - You are about to drop the column `acc2ByUserId` on the `DataSpp` table. All the data in the column will be lost.
  - You are about to drop the column `accFinalAt` on the `DataSpp` table. All the data in the column will be lost.
  - You are about to drop the column `accFinalByUserId` on the `DataSpp` table. All the data in the column will be lost.
  - Added the required column `sppStatus` to the `DataSpp` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sppAcc1Id` to the `Project` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sppAcc2Id` to the `Project` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sppAccFinalId` to the `Project` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_acc1ByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_acc2ByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_accFinalByUserId_fkey`;

-- DropIndex
DROP INDEX `DataSpp_acc1ByUserId_fkey` ON `DataSpp`;

-- DropIndex
DROP INDEX `DataSpp_acc2ByUserId_fkey` ON `DataSpp`;

-- DropIndex
DROP INDEX `DataSpp_accFinalByUserId_fkey` ON `DataSpp`;

-- AlterTable
ALTER TABLE `DataSpp` DROP COLUMN `acc1At`,
    DROP COLUMN `acc1ByUserId`,
    DROP COLUMN `acc2At`,
    DROP COLUMN `acc2ByUserId`,
    DROP COLUMN `accFinalAt`,
    DROP COLUMN `accFinalByUserId`,
    ADD COLUMN `sppStatus` ENUM('APPROVED', 'NOT_APPROVED', 'WAITING') NOT NULL;

-- AlterTable
ALTER TABLE `Project` ADD COLUMN `sppAcc1Id` INTEGER NOT NULL,
    ADD COLUMN `sppAcc2Id` INTEGER NOT NULL,
    ADD COLUMN `sppAccFinalId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_sppAcc1Id_fkey` FOREIGN KEY (`sppAcc1Id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_sppAcc2Id_fkey` FOREIGN KEY (`sppAcc2Id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_sppAccFinalId_fkey` FOREIGN KEY (`sppAccFinalId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

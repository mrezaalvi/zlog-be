-- DropForeignKey
ALTER TABLE `Project` DROP FOREIGN KEY `Project_sppAcc1Id_fkey`;

-- DropForeignKey
ALTER TABLE `Project` DROP FOREIGN KEY `Project_sppAcc2Id_fkey`;

-- DropIndex
DROP INDEX `Project_sppAcc1Id_fkey` ON `Project`;

-- DropIndex
DROP INDEX `Project_sppAcc2Id_fkey` ON `Project`;

-- AlterTable
ALTER TABLE `Project` MODIFY `sppAcc1Id` INTEGER NULL,
    MODIFY `sppAcc2Id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_sppAcc1Id_fkey` FOREIGN KEY (`sppAcc1Id`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_sppAcc2Id_fkey` FOREIGN KEY (`sppAcc2Id`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

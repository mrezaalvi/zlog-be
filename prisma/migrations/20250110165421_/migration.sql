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
ALTER TABLE `DataSpp` MODIFY `acc1At` DATETIME(3) NULL,
    MODIFY `acc1ByUserId` INTEGER NULL,
    MODIFY `acc2At` DATETIME(3) NULL,
    MODIFY `acc2ByUserId` INTEGER NULL,
    MODIFY `accFinalAt` DATETIME(3) NULL,
    MODIFY `accFinalByUserId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_acc1ByUserId_fkey` FOREIGN KEY (`acc1ByUserId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_acc2ByUserId_fkey` FOREIGN KEY (`acc2ByUserId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_accFinalByUserId_fkey` FOREIGN KEY (`accFinalByUserId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

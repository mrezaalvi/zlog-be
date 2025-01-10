/*
  Warnings:

  - You are about to drop the `Spp` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `Spp`;

-- CreateTable
CREATE TABLE `DetailSpp` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `material` VARCHAR(191) NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `volume` VARCHAR(191) NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `lokasi` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DataSpp` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `projectId` INTEGER NOT NULL,
    `kode` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdByUserId` INTEGER NOT NULL,
    `acc1At` DATETIME(3) NOT NULL,
    `acc1ByUserId` INTEGER NOT NULL,
    `acc2At` DATETIME(3) NOT NULL,
    `acc2ByUserId` INTEGER NOT NULL,
    `accFinalAt` DATETIME(3) NOT NULL,
    `accFinalByUserId` INTEGER NOT NULL,

    UNIQUE INDEX `DataSpp_kode_key`(`kode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_createdByUserId_fkey` FOREIGN KEY (`createdByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_acc1ByUserId_fkey` FOREIGN KEY (`acc1ByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_acc2ByUserId_fkey` FOREIGN KEY (`acc2ByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_accFinalByUserId_fkey` FOREIGN KEY (`accFinalByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

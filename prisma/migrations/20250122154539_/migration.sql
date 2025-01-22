/*
  Warnings:

  - You are about to drop the `Material` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `Material`;

-- CreateTable
CREATE TABLE `DataMaterial` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `projectId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MaterialDetail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `volume` VARCHAR(191) NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `dataMaterialId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DataMaterial` ADD CONSTRAINT `DataMaterial_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MaterialDetail` ADD CONSTRAINT `MaterialDetail_dataMaterialId_fkey` FOREIGN KEY (`dataMaterialId`) REFERENCES `DataMaterial`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

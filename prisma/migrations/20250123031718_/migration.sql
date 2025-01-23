/*
  Warnings:

  - You are about to drop the `DataMaterial` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MaterialDetail` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `DataMaterial` DROP FOREIGN KEY `DataMaterial_projectId_fkey`;

-- DropForeignKey
ALTER TABLE `MaterialDetail` DROP FOREIGN KEY `MaterialDetail_dataMaterialId_fkey`;

-- DropTable
DROP TABLE `DataMaterial`;

-- DropTable
DROP TABLE `MaterialDetail`;

-- CreateTable
CREATE TABLE `Material` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `volume` VARCHAR(191) NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `projectId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Material` ADD CONSTRAINT `Material_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

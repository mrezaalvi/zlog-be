/*
  Warnings:

  - You are about to drop the `DataBppb` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DataGoodsIssue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DataGoodsReceipt` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DataSpp` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DetailBppb` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DetailSpp` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Material` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_DetailSppToMaterial` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `DataBppb` DROP FOREIGN KEY `DataBppb_approve1ByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataBppb` DROP FOREIGN KEY `DataBppb_approve2ByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataBppb` DROP FOREIGN KEY `DataBppb_approve3ByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataBppb` DROP FOREIGN KEY `DataBppb_createdByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataBppb` DROP FOREIGN KEY `DataBppb_projectId_fkey`;

-- DropForeignKey
ALTER TABLE `DataGoodsIssue` DROP FOREIGN KEY `DataGoodsIssue_materialId_fkey`;

-- DropForeignKey
ALTER TABLE `DataGoodsReceipt` DROP FOREIGN KEY `DataGoodsReceipt_materialId_fkey`;

-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_acc1ByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_acc2ByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_accFinalByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_createdByUserId_fkey`;

-- DropForeignKey
ALTER TABLE `DataSpp` DROP FOREIGN KEY `DataSpp_projectId_fkey`;

-- DropForeignKey
ALTER TABLE `DetailBppb` DROP FOREIGN KEY `DetailBppb_bppbId_fkey`;

-- DropForeignKey
ALTER TABLE `DetailBppb` DROP FOREIGN KEY `DetailBppb_materialId_fkey`;

-- DropForeignKey
ALTER TABLE `DetailSpp` DROP FOREIGN KEY `DetailSpp_sppId_fkey`;

-- DropForeignKey
ALTER TABLE `_DetailSppToMaterial` DROP FOREIGN KEY `_DetailSppToMaterial_A_fkey`;

-- DropForeignKey
ALTER TABLE `_DetailSppToMaterial` DROP FOREIGN KEY `_DetailSppToMaterial_B_fkey`;

-- DropTable
DROP TABLE `DataBppb`;

-- DropTable
DROP TABLE `DataGoodsIssue`;

-- DropTable
DROP TABLE `DataGoodsReceipt`;

-- DropTable
DROP TABLE `DataSpp`;

-- DropTable
DROP TABLE `DetailBppb`;

-- DropTable
DROP TABLE `DetailSpp`;

-- DropTable
DROP TABLE `Material`;

-- DropTable
DROP TABLE `_DetailSppToMaterial`;

-- CreateTable
CREATE TABLE `Spp` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `material` VARCHAR(191) NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `volume` VARCHAR(191) NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `lokasi` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

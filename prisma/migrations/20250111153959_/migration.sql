/*
  Warnings:

  - You are about to drop the column `material` on the `GoodsReceipt` table. All the data in the column will be lost.
  - You are about to drop the column `satuan` on the `GoodsReceipt` table. All the data in the column will be lost.
  - You are about to drop the column `spesifikasi` on the `GoodsReceipt` table. All the data in the column will be lost.
  - You are about to drop the column `volume` on the `GoodsReceipt` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `GoodsReceipt` DROP COLUMN `material`,
    DROP COLUMN `satuan`,
    DROP COLUMN `spesifikasi`,
    DROP COLUMN `volume`;

-- CreateTable
CREATE TABLE `GoodsReceiptDetail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `goodsReceiptId` INTEGER NOT NULL,
    `material` VARCHAR(191) NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `volume` INTEGER NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `GoodsReceiptDetail` ADD CONSTRAINT `GoodsReceiptDetail_goodsReceiptId_fkey` FOREIGN KEY (`goodsReceiptId`) REFERENCES `GoodsReceipt`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

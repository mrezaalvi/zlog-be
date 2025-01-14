-- DropForeignKey
ALTER TABLE `PicProject` DROP FOREIGN KEY `PicProject_userId_fkey`;

-- DropIndex
DROP INDEX `PicProject_userId_key` ON `PicProject`;

-- AddForeignKey
ALTER TABLE `GoodsReceiptDetail` ADD CONSTRAINT `GoodsReceiptDetail_goodsReceiptId_fkey` FOREIGN KEY (`goodsReceiptId`) REFERENCES `GoodsReceipt`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

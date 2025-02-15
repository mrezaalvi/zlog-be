/*
  Warnings:

  - A unique constraint covering the columns `[projectId,userId]` on the table `PicProject` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `PicProject` DROP FOREIGN KEY `PicProject_userId_fkey`;

-- DropIndex
DROP INDEX `PicProject_userId_key` ON `PicProject`;

-- CreateIndex
CREATE UNIQUE INDEX `PicProject_projectId_userId_key` ON `PicProject`(`projectId`, `userId`);

-- -- AddForeignKey
-- ALTER TABLE `GoodsReceiptDetail` ADD CONSTRAINT `GoodsReceiptDetail_goodsReceiptId_fkey` FOREIGN KEY (`goodsReceiptId`) REFERENCES `GoodsReceipt`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

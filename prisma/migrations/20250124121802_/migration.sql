-- AlterTable
ALTER TABLE `GoodsReceipt` ADD COLUMN `projectId` INTEGER NOT NULL DEFAULT 1;

-- AddForeignKey
ALTER TABLE `GoodsReceipt` ADD CONSTRAINT `GoodsReceipt_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

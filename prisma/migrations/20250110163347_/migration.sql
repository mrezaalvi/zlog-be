/*
  Warnings:

  - Added the required column `dataSppId` to the `DetailSpp` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `DetailSpp` ADD COLUMN `dataSppId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `DetailSpp` ADD CONSTRAINT `DetailSpp_dataSppId_fkey` FOREIGN KEY (`dataSppId`) REFERENCES `DataSpp`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

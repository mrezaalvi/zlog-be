/*
  Warnings:

  - You are about to drop the column `materialId` on the `DetailSpp` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `DetailSpp` DROP FOREIGN KEY `DetailSpp_materialId_fkey`;

-- DropIndex
DROP INDEX `DetailSpp_materialId_fkey` ON `DetailSpp`;

-- AlterTable
ALTER TABLE `DetailSpp` DROP COLUMN `materialId`;

-- CreateTable
CREATE TABLE `_DetailSppToMaterial` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_DetailSppToMaterial_AB_unique`(`A`, `B`),
    INDEX `_DetailSppToMaterial_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_DetailSppToMaterial` ADD CONSTRAINT `_DetailSppToMaterial_A_fkey` FOREIGN KEY (`A`) REFERENCES `DetailSpp`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_DetailSppToMaterial` ADD CONSTRAINT `_DetailSppToMaterial_B_fkey` FOREIGN KEY (`B`) REFERENCES `Material`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

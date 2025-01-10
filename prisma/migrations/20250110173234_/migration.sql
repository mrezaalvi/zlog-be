/*
  Warnings:

  - You are about to drop the column `userId` on the `PicProject` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `PicProject` DROP FOREIGN KEY `PicProject_userId_fkey`;

-- DropIndex
DROP INDEX `PicProject_userId_fkey` ON `PicProject`;

-- AlterTable
ALTER TABLE `PicProject` DROP COLUMN `userId`;

-- CreateTable
CREATE TABLE `_PicProjectToUser` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_PicProjectToUser_AB_unique`(`A`, `B`),
    INDEX `_PicProjectToUser_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_PicProjectToUser` ADD CONSTRAINT `_PicProjectToUser_A_fkey` FOREIGN KEY (`A`) REFERENCES `PicProject`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PicProjectToUser` ADD CONSTRAINT `_PicProjectToUser_B_fkey` FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

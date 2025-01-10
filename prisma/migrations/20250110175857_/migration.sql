/*
  Warnings:

  - You are about to drop the `PicProject` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PicProjectToUser` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `Project` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `Project` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `PicProject` DROP FOREIGN KEY `PicProject_projectId_fkey`;

-- DropForeignKey
ALTER TABLE `_PicProjectToUser` DROP FOREIGN KEY `_PicProjectToUser_A_fkey`;

-- DropForeignKey
ALTER TABLE `_PicProjectToUser` DROP FOREIGN KEY `_PicProjectToUser_B_fkey`;

-- AlterTable
ALTER TABLE `Project` ADD COLUMN `userId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `PicProject`;

-- DropTable
DROP TABLE `_PicProjectToUser`;

-- CreateIndex
CREATE UNIQUE INDEX `Project_userId_key` ON `Project`(`userId`);

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

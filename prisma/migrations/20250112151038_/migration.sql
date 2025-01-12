/*
  Warnings:

  - You are about to drop the column `acc1Status` on the `Bppb` table. All the data in the column will be lost.
  - You are about to drop the column `acc2Status` on the `Bppb` table. All the data in the column will be lost.
  - You are about to drop the column `accFinalStatus` on the `Bppb` table. All the data in the column will be lost.
  - You are about to drop the column `bppbStatus` on the `Bppb` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Bppb` DROP COLUMN `acc1Status`,
    DROP COLUMN `acc2Status`,
    DROP COLUMN `accFinalStatus`,
    DROP COLUMN `bppbStatus`;

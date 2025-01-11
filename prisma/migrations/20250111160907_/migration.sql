/*
  Warnings:

  - You are about to drop the column `lokasiPekerjaan` on the `DetailBppb` table. All the data in the column will be lost.
  - Added the required column `lokasi` to the `DetailBppb` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `DetailBppb` DROP COLUMN `lokasiPekerjaan`,
    ADD COLUMN `lokasi` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `nomorHp` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `jabatan` ENUM('PM', 'SEM', 'POP', 'LOGISTIK', 'PENBAR', 'SOM', 'GSP', 'SP', 'ARK', 'QCO', 'HSEO', 'SAK', 'SE') NOT NULL,

    UNIQUE INDEX `User_nomorHp_key`(`nomorHp`),
    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Project` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `kode` INTEGER NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `lokasi` VARCHAR(191) NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Project_kode_key`(`kode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Material` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `ukuran` VARCHAR(191) NOT NULL,
    `jenisPekerjaan` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DataSpp` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `projectId` INTEGER NOT NULL,
    `kode` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdByUserId` INTEGER NOT NULL,
    `acc1At` DATETIME(3) NOT NULL,
    `acc1ByUserId` INTEGER NOT NULL,
    `acc2At` DATETIME(3) NOT NULL,
    `acc2ByUserId` INTEGER NOT NULL,
    `accFinalAt` DATETIME(3) NOT NULL,
    `accFinalByUserId` INTEGER NOT NULL,

    UNIQUE INDEX `DataSpp_kode_key`(`kode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetailSpp` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sppId` INTEGER NOT NULL,
    `materialId` INTEGER NOT NULL,
    `volume` INTEGER NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `ukuran` VARCHAR(191) NOT NULL,
    `jenisPekerjaan` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `DetailSpp_sppId_key`(`sppId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DataBppb` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `kode` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createdByUserId` INTEGER NOT NULL,
    `projectId` INTEGER NOT NULL,
    `approve1At` DATETIME(3) NOT NULL,
    `approve1ByUserId` INTEGER NOT NULL,
    `approve2At` DATETIME(3) NOT NULL,
    `approve2ByUserId` INTEGER NOT NULL,
    `approve3At` DATETIME(3) NOT NULL,
    `approve3ByUserId` INTEGER NOT NULL,

    UNIQUE INDEX `DataBppb_kode_key`(`kode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetailBppb` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bppbId` INTEGER NOT NULL,
    `materialId` INTEGER NOT NULL,
    `volume` INTEGER NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `elemenWbs` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `DetailBppb_bppbId_key`(`bppbId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DataGoodsReceipt` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `noMaterialMasuk` INTEGER NOT NULL,
    `noSuratJalan` INTEGER NOT NULL,
    `vendor` VARCHAR(191) NOT NULL,
    `materialId` INTEGER NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `volumenIn` INTEGER NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DataGoodsIssue` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `materialId` INTEGER NOT NULL,
    `volumeStock` INTEGER NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `volumenOut` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Project` ADD CONSTRAINT `Project_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_createdByUserId_fkey` FOREIGN KEY (`createdByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_acc1ByUserId_fkey` FOREIGN KEY (`acc1ByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_acc2ByUserId_fkey` FOREIGN KEY (`acc2ByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataSpp` ADD CONSTRAINT `DataSpp_accFinalByUserId_fkey` FOREIGN KEY (`accFinalByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailSpp` ADD CONSTRAINT `DetailSpp_sppId_fkey` FOREIGN KEY (`sppId`) REFERENCES `DataSpp`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailSpp` ADD CONSTRAINT `DetailSpp_materialId_fkey` FOREIGN KEY (`materialId`) REFERENCES `Material`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataBppb` ADD CONSTRAINT `DataBppb_createdByUserId_fkey` FOREIGN KEY (`createdByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataBppb` ADD CONSTRAINT `DataBppb_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataBppb` ADD CONSTRAINT `DataBppb_approve1ByUserId_fkey` FOREIGN KEY (`approve1ByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataBppb` ADD CONSTRAINT `DataBppb_approve2ByUserId_fkey` FOREIGN KEY (`approve2ByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataBppb` ADD CONSTRAINT `DataBppb_approve3ByUserId_fkey` FOREIGN KEY (`approve3ByUserId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailBppb` ADD CONSTRAINT `DetailBppb_bppbId_fkey` FOREIGN KEY (`bppbId`) REFERENCES `DataBppb`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailBppb` ADD CONSTRAINT `DetailBppb_materialId_fkey` FOREIGN KEY (`materialId`) REFERENCES `Material`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataGoodsReceipt` ADD CONSTRAINT `DataGoodsReceipt_materialId_fkey` FOREIGN KEY (`materialId`) REFERENCES `Material`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DataGoodsIssue` ADD CONSTRAINT `DataGoodsIssue_materialId_fkey` FOREIGN KEY (`materialId`) REFERENCES `Material`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

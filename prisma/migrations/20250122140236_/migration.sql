-- CreateTable
CREATE TABLE `DataGoodsIssue` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `projectId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetailGoodsIssue` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `material` VARCHAR(191) NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `volume` INTEGER NOT NULL,
    `volumeOut` INTEGER NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `DataGoodsIssueId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DataGoodsIssue` ADD CONSTRAINT `DataGoodsIssue_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailGoodsIssue` ADD CONSTRAINT `DetailGoodsIssue_DataGoodsIssueId_fkey` FOREIGN KEY (`DataGoodsIssueId`) REFERENCES `DataGoodsIssue`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

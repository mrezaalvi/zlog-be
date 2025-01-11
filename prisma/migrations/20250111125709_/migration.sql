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
CREATE TABLE `GoodsReceipt` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `noMaterialMasuk` INTEGER NOT NULL,
    `noSuratJalan` VARCHAR(191) NOT NULL,
    `tanggalMasuk` DATETIME(3) NOT NULL,
    `vendor` VARCHAR(191) NOT NULL,
    `namaPengantar` VARCHAR(191) NOT NULL,
    `material` VARCHAR(191) NOT NULL,
    `spesifikasi` VARCHAR(191) NOT NULL,
    `volume` INTEGER NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

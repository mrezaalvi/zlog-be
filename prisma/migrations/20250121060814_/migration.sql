-- AddForeignKey
ALTER TABLE `PicProject` ADD CONSTRAINT `PicProject_projectId_fkey` FOREIGN KEY (`projectId`) REFERENCES `Project`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

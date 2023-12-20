-- CreateTable
CREATE TABLE `categoria` (
    `id_categoria` INTEGER NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(100) NOT NULL,
    `descricao` VARCHAR(255) NULL,

    PRIMARY KEY (`id_categoria`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `eventos` (
    `id_evento` INTEGER NOT NULL AUTO_INCREMENT,
    `nome_evento` VARCHAR(100) NOT NULL,
    `endereco_evento` VARCHAR(255) NOT NULL,
    `descricao` VARCHAR(255) NULL,
    `status_evento` INTEGER NOT NULL,
    `data_evento` DATE NOT NULL,
    `curtida` INTEGER NULL,
    `imagem_evento` VARCHAR(255) NULL,
    `id_usuario` INTEGER NULL,
    `id_categoria` INTEGER NULL,

    INDEX `id_categoria`(`id_categoria`),
    INDEX `id_usuario`(`id_usuario`),
    PRIMARY KEY (`id_evento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `id_usuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(30) NOT NULL,
    `user_img` VARCHAR(255) NULL,
    `sobrenome` VARCHAR(50) NOT NULL,
    `data_nasc` DATE NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `senha` VARCHAR(50) NOT NULL,
    `nivel_usuario` INTEGER NOT NULL,

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`id_usuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `eventos` ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario`(`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `eventos` ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria`(`id_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT;

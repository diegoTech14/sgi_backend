-- DropIndex
DROP INDEX `T_Bitacora_Cambio_Estado_ct_cedula_usuario_fkey` ON `t_bitacora_cambio_estado`;

-- DropIndex
DROP INDEX `T_Bitacora_Cambio_Estado_ct_codigo_incidencia_fkey` ON `t_bitacora_cambio_estado`;

-- DropIndex
DROP INDEX `T_Diagnostico_cn_id_usuario_fkey` ON `t_diagnostico`;

-- DropIndex
DROP INDEX `T_Diagnostico_ct_codigo_incidencia_fkey` ON `t_diagnostico`;

-- DropIndex
DROP INDEX `T_Imagenes_cn_id_diagnostico_fkey` ON `t_imagenes`;

-- DropIndex
DROP INDEX `T_Imagenes_cn_id_incidencia_fkey` ON `t_imagenes`;

-- DropIndex
DROP INDEX `T_Incidencias_cn_id_afectacion_fkey` ON `t_incidencias`;

-- DropIndex
DROP INDEX `T_Incidencias_cn_id_categoria_fkey` ON `t_incidencias`;

-- DropIndex
DROP INDEX `T_Incidencias_cn_id_estado_fkey` ON `t_incidencias`;

-- DropIndex
DROP INDEX `T_Incidencias_cn_id_prioridad_fkey` ON `t_incidencias`;

-- DropIndex
DROP INDEX `T_Incidencias_cn_id_riesgo_fkey` ON `t_incidencias`;

-- DropIndex
DROP INDEX `T_Incidencias_cn_id_usuario_fkey` ON `t_incidencias`;

-- DropIndex
DROP INDEX `T_Usuario_X_Incidencia_ct_cedula_usuario_fkey` ON `t_usuario_x_incidencia`;

-- DropIndex
DROP INDEX `T_Usuario_X_Incidencia_ct_codigo_incidencia_fkey` ON `t_usuario_x_incidencia`;

-- DropIndex
DROP INDEX `t_usuarios_x_rol_cn_id_rol_fkey` ON `t_usuarios_x_rol`;

-- CreateTable
CREATE TABLE `T_Bitacora_General` (
    `cn_codigo` INTEGER NOT NULL AUTO_INCREMENT,
    `ct_sistema` VARCHAR(191) NOT NULL,
    `ct_referencia` VARCHAR(191) NOT NULL,
    `cn_id_usuario` VARCHAR(11) NOT NULL,
    `ct_codigo_pantalla` INTEGER NOT NULL,

    UNIQUE INDEX `T_Bitacora_General_cn_codigo_key`(`cn_codigo`),
    PRIMARY KEY (`cn_codigo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `T_Pantalla` (
    `cn_codio_pantalla` INTEGER NOT NULL AUTO_INCREMENT,
    `ct_nombre_pantalla` VARCHAR(191) NOT NULL,
    `ct_descripcion_pantalla` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `T_Pantalla_cn_codio_pantalla_key`(`cn_codio_pantalla`),
    PRIMARY KEY (`cn_codio_pantalla`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `T_Imagenes` ADD CONSTRAINT `T_Imagenes_cn_id_incidencia_fkey` FOREIGN KEY (`cn_id_incidencia`) REFERENCES `T_Incidencias`(`ct_codigo_incidencia`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Imagenes` ADD CONSTRAINT `T_Imagenes_cn_id_diagnostico_fkey` FOREIGN KEY (`cn_id_diagnostico`) REFERENCES `T_Diagnostico`(`cn_id_diagnostico`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Bitacora_General` ADD CONSTRAINT `T_Bitacora_General_cn_id_usuario_fkey` FOREIGN KEY (`cn_id_usuario`) REFERENCES `T_usuarios`(`ct_cedula`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Bitacora_General` ADD CONSTRAINT `T_Bitacora_General_ct_codigo_pantalla_fkey` FOREIGN KEY (`ct_codigo_pantalla`) REFERENCES `T_Pantalla`(`cn_codio_pantalla`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Usuario_X_Incidencia` ADD CONSTRAINT `T_Usuario_X_Incidencia_ct_cedula_usuario_fkey` FOREIGN KEY (`ct_cedula_usuario`) REFERENCES `T_usuarios`(`ct_cedula`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Usuario_X_Incidencia` ADD CONSTRAINT `T_Usuario_X_Incidencia_ct_codigo_incidencia_fkey` FOREIGN KEY (`ct_codigo_incidencia`) REFERENCES `T_Incidencias`(`ct_codigo_incidencia`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Bitacora_Cambio_Estado` ADD CONSTRAINT `T_Bitacora_Cambio_Estado_ct_codigo_incidencia_fkey` FOREIGN KEY (`ct_codigo_incidencia`) REFERENCES `T_Incidencias`(`ct_codigo_incidencia`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Bitacora_Cambio_Estado` ADD CONSTRAINT `T_Bitacora_Cambio_Estado_ct_cedula_usuario_fkey` FOREIGN KEY (`ct_cedula_usuario`) REFERENCES `T_usuarios`(`ct_cedula`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_usuarios_x_rol` ADD CONSTRAINT `t_usuarios_x_rol_ct_cedula_fkey` FOREIGN KEY (`ct_cedula`) REFERENCES `T_usuarios`(`ct_cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `t_usuarios_x_rol` ADD CONSTRAINT `t_usuarios_x_rol_cn_id_rol_fkey` FOREIGN KEY (`cn_id_rol`) REFERENCES `T_Roles`(`cn_id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Incidencias` ADD CONSTRAINT `T_Incidencias_cn_id_usuario_fkey` FOREIGN KEY (`cn_id_usuario`) REFERENCES `T_usuarios`(`ct_cedula`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Incidencias` ADD CONSTRAINT `T_Incidencias_cn_id_afectacion_fkey` FOREIGN KEY (`cn_id_afectacion`) REFERENCES `T_Afectaciones`(`cn_id_afectacion`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Incidencias` ADD CONSTRAINT `T_Incidencias_cn_id_riesgo_fkey` FOREIGN KEY (`cn_id_riesgo`) REFERENCES `T_Riesgos`(`cn_id_riesgo`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Incidencias` ADD CONSTRAINT `T_Incidencias_cn_id_categoria_fkey` FOREIGN KEY (`cn_id_categoria`) REFERENCES `T_Categorias`(`cn_id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Incidencias` ADD CONSTRAINT `T_Incidencias_cn_id_prioridad_fkey` FOREIGN KEY (`cn_id_prioridad`) REFERENCES `T_Prioridades`(`cn_id_prioridad`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Incidencias` ADD CONSTRAINT `T_Incidencias_cn_id_estado_fkey` FOREIGN KEY (`cn_id_estado`) REFERENCES `T_Estados`(`cn_id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Diagnostico` ADD CONSTRAINT `T_Diagnostico_cn_id_usuario_fkey` FOREIGN KEY (`cn_id_usuario`) REFERENCES `T_usuarios`(`ct_cedula`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `T_Diagnostico` ADD CONSTRAINT `T_Diagnostico_ct_codigo_incidencia_fkey` FOREIGN KEY (`ct_codigo_incidencia`) REFERENCES `T_Incidencias`(`ct_codigo_incidencia`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_T_Usuarios_x_Rol` ADD CONSTRAINT `_T_Usuarios_x_Rol_A_fkey` FOREIGN KEY (`A`) REFERENCES `T_Roles`(`cn_id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_T_Usuarios_x_Rol` ADD CONSTRAINT `_T_Usuarios_x_Rol_B_fkey` FOREIGN KEY (`B`) REFERENCES `T_usuarios`(`ct_cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

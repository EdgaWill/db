/*
  Warnings:

  - You are about to drop the `documento_identificacion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `documentos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `historial_descargas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `persona_inversionista` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `producto_subcategoria` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `productos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tipo_documento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tipos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `usuarios` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "documentos" DROP CONSTRAINT "documentos_persona_inversionistaId_fkey";

-- DropForeignKey
ALTER TABLE "documentos" DROP CONSTRAINT "documentos_producto_subcategoriaId_fkey";

-- DropForeignKey
ALTER TABLE "documentos" DROP CONSTRAINT "documentos_productosId_fkey";

-- DropForeignKey
ALTER TABLE "documentos" DROP CONSTRAINT "documentos_tipo_documentoId_fkey";

-- DropForeignKey
ALTER TABLE "documentos" DROP CONSTRAINT "documentos_usuariosId_fkey";

-- DropForeignKey
ALTER TABLE "historial_descargas" DROP CONSTRAINT "historial_descargas_documentosId_fkey";

-- DropForeignKey
ALTER TABLE "historial_descargas" DROP CONSTRAINT "historial_descargas_usuariosId_fkey";

-- DropForeignKey
ALTER TABLE "persona_inversionista" DROP CONSTRAINT "persona_inversionista_documento_identificacionId_fkey";

-- DropForeignKey
ALTER TABLE "producto_subcategoria" DROP CONSTRAINT "producto_subcategoria_productosId_fkey";

-- DropForeignKey
ALTER TABLE "productos" DROP CONSTRAINT "productos_tiposId_fkey";

-- DropTable
DROP TABLE "documento_identificacion";

-- DropTable
DROP TABLE "documentos";

-- DropTable
DROP TABLE "historial_descargas";

-- DropTable
DROP TABLE "persona_inversionista";

-- DropTable
DROP TABLE "producto_subcategoria";

-- DropTable
DROP TABLE "productos";

-- DropTable
DROP TABLE "tipo_documento";

-- DropTable
DROP TABLE "tipos";

-- DropTable
DROP TABLE "usuarios";

-- CreateTable
CREATE TABLE "tablaInversionista" (
    "id" SERIAL NOT NULL,
    "nombres" TEXT NOT NULL,
    "apPat" TEXT NOT NULL,
    "apMat" TEXT NOT NULL,
    "nroIdentificacion" TEXT NOT NULL,
    "pEP" BOOLEAN NOT NULL,
    "tipoIdentificacionId" INTEGER NOT NULL,

    CONSTRAINT "tablaInversionista_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipoIdentificacion" (
    "id" SERIAL NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "tipoIdentificacion_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "tablaInversionista" ADD CONSTRAINT "tablaInversionista_tipoIdentificacionId_fkey" FOREIGN KEY ("tipoIdentificacionId") REFERENCES "tipoIdentificacion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

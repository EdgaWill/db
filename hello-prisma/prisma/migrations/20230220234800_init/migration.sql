/*
  Warnings:

  - You are about to drop the `tablacategoria` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `tablaCategoriaId` to the `tablaDocumento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tablaInversionistaId` to the `tablaDocumento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tablaProductoId` to the `tablaDocumento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipoDocumentoId` to the `tablaDocumento` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "tablacategoria" DROP CONSTRAINT "tablacategoria_tablaDocumentoId_fkey";

-- AlterTable
ALTER TABLE "tablaDocumento" ADD COLUMN     "tablaCategoriaId" INTEGER NOT NULL,
ADD COLUMN     "tablaInversionistaId" TEXT NOT NULL,
ADD COLUMN     "tablaProductoId" INTEGER NOT NULL,
ADD COLUMN     "tipoDocumentoId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "tablacategoria";

-- CreateTable
CREATE TABLE "tablaCategoria" (
    "id" SERIAL NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "tablaCategoria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipoDocumento" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "tipoDocumento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tablaDescarga" (
    "id" SERIAL NOT NULL,
    "tablaUsuariosId" INTEGER NOT NULL,
    "tablaDocumentoId" INTEGER NOT NULL,
    "fecha_download" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tablaDescarga_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tablaUsuarios" (
    "id" SERIAL NOT NULL,
    "tablaRolId" INTEGER NOT NULL,
    "userNombre" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contrasena" TEXT NOT NULL,
    "activo_desactivo" BOOLEAN NOT NULL,

    CONSTRAINT "tablaUsuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tablaRol" (
    "id" SERIAL NOT NULL,
    "rolNombre" TEXT NOT NULL,
    "rolPermiso" TEXT NOT NULL,

    CONSTRAINT "tablaRol_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "tablaDocumento" ADD CONSTRAINT "tablaDocumento_tablaCategoriaId_fkey" FOREIGN KEY ("tablaCategoriaId") REFERENCES "tablaCategoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tablaDocumento" ADD CONSTRAINT "tablaDocumento_tablaProductoId_fkey" FOREIGN KEY ("tablaProductoId") REFERENCES "tablaProducto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tablaDocumento" ADD CONSTRAINT "tablaDocumento_tablaInversionistaId_fkey" FOREIGN KEY ("tablaInversionistaId") REFERENCES "tablaInversionista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tablaDocumento" ADD CONSTRAINT "tablaDocumento_tipoDocumentoId_fkey" FOREIGN KEY ("tipoDocumentoId") REFERENCES "tipoDocumento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tablaDescarga" ADD CONSTRAINT "tablaDescarga_tablaUsuariosId_fkey" FOREIGN KEY ("tablaUsuariosId") REFERENCES "tablaUsuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tablaDescarga" ADD CONSTRAINT "tablaDescarga_tablaDocumentoId_fkey" FOREIGN KEY ("tablaDocumentoId") REFERENCES "tablaDocumento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tablaUsuarios" ADD CONSTRAINT "tablaUsuarios_tablaRolId_fkey" FOREIGN KEY ("tablaRolId") REFERENCES "tablaRol"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

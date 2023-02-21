/*
  Warnings:

  - The primary key for the `tablaInversionista` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "tablaInversionista" DROP CONSTRAINT "tablaInversionista_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "tablaInversionista_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "tablaInversionista_id_seq";

-- CreateTable
CREATE TABLE "relProdInver" (
    "id" TEXT NOT NULL,
    "tablaProductoId" INTEGER NOT NULL,
    "tablaInversionistaId" TEXT NOT NULL,

    CONSTRAINT "relProdInver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tablaProducto" (
    "id" SERIAL NOT NULL,
    "codProducto" TEXT NOT NULL,
    "nombreProducto" TEXT NOT NULL,

    CONSTRAINT "tablaProducto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tablaDocumento" (
    "id" SERIAL NOT NULL,
    "nombreFile" TEXT NOT NULL,
    "userSubida" TEXT NOT NULL,
    "userActualiza" TEXT NOT NULL,
    "userDelete" TEXT NOT NULL,
    "fechaSubida" TIMESTAMP(3) NOT NULL,
    "fechaActualiza" TIMESTAMP(3) NOT NULL,
    "fechaDelete" TIMESTAMP(3) NOT NULL,
    "uuidAws" TEXT NOT NULL,
    "codAwsUrl" TEXT NOT NULL,

    CONSTRAINT "tablaDocumento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tablacategoria" (
    "id" SERIAL NOT NULL,
    "descripcion" TEXT NOT NULL,
    "tablaDocumentoId" INTEGER NOT NULL,

    CONSTRAINT "tablacategoria_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "relProdInver" ADD CONSTRAINT "relProdInver_tablaProductoId_fkey" FOREIGN KEY ("tablaProductoId") REFERENCES "tablaProducto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "relProdInver" ADD CONSTRAINT "relProdInver_tablaInversionistaId_fkey" FOREIGN KEY ("tablaInversionistaId") REFERENCES "tablaInversionista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tablacategoria" ADD CONSTRAINT "tablacategoria_tablaDocumentoId_fkey" FOREIGN KEY ("tablaDocumentoId") REFERENCES "tablaDocumento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

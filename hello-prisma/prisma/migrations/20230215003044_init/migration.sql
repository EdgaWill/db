/*
  Warnings:

  - Added the required column `producto_subcategoriaId` to the `documentos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "documentos" ADD COLUMN     "producto_subcategoriaId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "documentos" ADD CONSTRAINT "documentos_producto_subcategoriaId_fkey" FOREIGN KEY ("producto_subcategoriaId") REFERENCES "producto_subcategoria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

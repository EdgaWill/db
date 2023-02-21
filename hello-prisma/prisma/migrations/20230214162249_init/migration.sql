/*
  Warnings:

  - The primary key for the `tipos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `tipos` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `tipos` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `tipos` table. All the data in the column will be lost.
  - Added the required column `descripcion` to the `tipos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `tipos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tipos" DROP CONSTRAINT "tipos_pkey",
DROP COLUMN "createdAt",
DROP COLUMN "title",
DROP COLUMN "updatedAt",
ADD COLUMN     "descripcion" TEXT NOT NULL,
ADD COLUMN     "nombre" TEXT NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "tipos_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "tipos_id_seq";

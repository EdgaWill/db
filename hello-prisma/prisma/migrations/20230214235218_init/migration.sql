/*
  Warnings:

  - Added the required column `nro_documento` to the `persona_inversionista` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pep` to the `persona_inversionista` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "persona_inversionista" ADD COLUMN     "nro_documento" INTEGER NOT NULL,
ADD COLUMN     "pep" BOOLEAN NOT NULL;

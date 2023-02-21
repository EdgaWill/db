-- CreateTable
CREATE TABLE "documento_identificacion" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "documento_identificacion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "persona_inversionista" (
    "id" SERIAL NOT NULL,
    "nombres" TEXT NOT NULL,
    "ape_paterno" TEXT NOT NULL,
    "ape_materno" TEXT NOT NULL,
    "documento_identificacionId" INTEGER NOT NULL,

    CONSTRAINT "persona_inversionista_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "persona_inversionista" ADD CONSTRAINT "persona_inversionista_documento_identificacionId_fkey" FOREIGN KEY ("documento_identificacionId") REFERENCES "documento_identificacion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

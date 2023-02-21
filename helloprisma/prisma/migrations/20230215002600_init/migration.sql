-- CreateTable
CREATE TABLE "documentos" (
    "id" SERIAL NOT NULL,
    "persona_inversionistaId" INTEGER NOT NULL,
    "productosId" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "usuario_subida" TEXT NOT NULL,
    "fecha_subida" TIMESTAMP(3) NOT NULL,
    "usuario_elimina" TEXT NOT NULL,
    "fecha_elimina" TIMESTAMP(3) NOT NULL,
    "usuario_actualiza" TEXT NOT NULL,
    "fecha_actualiza" TIMESTAMP(3) NOT NULL,
    "codigo_aws_url" TEXT NOT NULL,
    "tipo_documentoId" INTEGER NOT NULL,
    "usuariosId" INTEGER NOT NULL,

    CONSTRAINT "documentos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tipo_documento" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "tipo_documento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "rol" TEXT NOT NULL,
    "id_usuario" INTEGER NOT NULL,
    "contrasena" INTEGER NOT NULL,
    "estado_activo" BOOLEAN NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "producto_subcategoria" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "tipo_levat_emision" TEXT NOT NULL,
    "productosId" INTEGER NOT NULL,

    CONSTRAINT "producto_subcategoria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "historial_descargas" (
    "id" SERIAL NOT NULL,
    "documentosId" INTEGER NOT NULL,
    "usuario_descarga" INTEGER NOT NULL,
    "fecha_descarga" TIMESTAMP(3) NOT NULL,
    "usuariosId" INTEGER NOT NULL,

    CONSTRAINT "historial_descargas_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "documentos" ADD CONSTRAINT "documentos_persona_inversionistaId_fkey" FOREIGN KEY ("persona_inversionistaId") REFERENCES "persona_inversionista"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documentos" ADD CONSTRAINT "documentos_productosId_fkey" FOREIGN KEY ("productosId") REFERENCES "productos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documentos" ADD CONSTRAINT "documentos_tipo_documentoId_fkey" FOREIGN KEY ("tipo_documentoId") REFERENCES "tipo_documento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documentos" ADD CONSTRAINT "documentos_usuariosId_fkey" FOREIGN KEY ("usuariosId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "producto_subcategoria" ADD CONSTRAINT "producto_subcategoria_productosId_fkey" FOREIGN KEY ("productosId") REFERENCES "productos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "historial_descargas" ADD CONSTRAINT "historial_descargas_documentosId_fkey" FOREIGN KEY ("documentosId") REFERENCES "documentos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "historial_descargas" ADD CONSTRAINT "historial_descargas_usuariosId_fkey" FOREIGN KEY ("usuariosId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

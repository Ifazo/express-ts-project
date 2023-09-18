/*
  Warnings:

  - The values [USER] on the enum `Role` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the `orderedBook` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Role_new" AS ENUM ('ADMIN', 'CUSTOMER');
ALTER TYPE "Role" RENAME TO "Role_old";
ALTER TYPE "Role_new" RENAME TO "Role";
DROP TYPE "Role_old";
COMMIT;

-- DropForeignKey
ALTER TABLE "orderedBook" DROP CONSTRAINT "orderedBook_bookId_fkey";

-- DropForeignKey
ALTER TABLE "orderedBook" DROP CONSTRAINT "orderedBook_orderId_fkey";

-- AlterTable
ALTER TABLE "order" ADD COLUMN     "orderedBooks" JSONB[];

-- DropTable
DROP TABLE "orderedBook";

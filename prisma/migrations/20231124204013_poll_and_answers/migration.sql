/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_userId_fkey";

-- AlterTable
ALTER TABLE "Poll" ADD COLUMN     "userId" TEXT,
ALTER COLUMN "prompt" DROP NOT NULL;

-- DropTable
DROP TABLE "Post";

-- AddForeignKey
ALTER TABLE "Poll" ADD CONSTRAINT "Poll_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

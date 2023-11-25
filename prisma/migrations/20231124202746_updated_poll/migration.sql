/*
  Warnings:

  - You are about to drop the column `question` on the `Poll` table. All the data in the column will be lost.
  - You are about to drop the `Question` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `prompt` to the `Poll` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Question" DROP CONSTRAINT "Question_pollId_fkey";

-- AlterTable
ALTER TABLE "Poll" DROP COLUMN "question",
ADD COLUMN     "prompt" TEXT NOT NULL;

-- DropTable
DROP TABLE "Question";

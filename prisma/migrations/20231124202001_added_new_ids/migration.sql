/*
  Warnings:

  - The primary key for the `Answer` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Poll` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Post` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_pollId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- AlterTable
ALTER TABLE "Answer" DROP CONSTRAINT "Answer_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "pollId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Answer_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Answer_id_seq";

-- AlterTable
ALTER TABLE "Poll" DROP CONSTRAINT "Poll_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Poll_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Poll_id_seq";

-- AlterTable
ALTER TABLE "Post" DROP CONSTRAINT "Post_pkey",
ADD COLUMN     "userId" TEXT,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "authorId" DROP NOT NULL,
ALTER COLUMN "authorId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Post_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Post_id_seq";

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "User_id_seq";

-- CreateTable
CREATE TABLE "Question" (
    "id" TEXT NOT NULL,
    "pollId" TEXT,
    "text" TEXT NOT NULL,

    CONSTRAINT "Question_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Question" ADD CONSTRAINT "Question_pollId_fkey" FOREIGN KEY ("pollId") REFERENCES "Poll"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_pollId_fkey" FOREIGN KEY ("pollId") REFERENCES "Poll"("id") ON DELETE SET NULL ON UPDATE CASCADE;

import { z } from "zod";

import { createTRPCRouter, publicProcedure } from "~/server/api/trpc";

export const postRouter = createTRPCRouter({
  // hello: publicProcedure
  //   .input(z.object({ text: z.string() }))
  //   .query(({ input }) => {
  //     return {
  //       greeting: `Hello ${input.text}`,
  //     };
  //   }),

  getPoll: publicProcedure
    .input(
      z.object({
        pollId: z.string(),
      }),
    )
    .query(async ({ ctx, input }) => {
      try {
        const poll = await ctx.db.poll.findUnique({
          where: {
            id: input.pollId,
          },
        });
        if (!poll) {
          throw new Error("Poll not found");
        }
        return poll;
      } catch (error) {
        console.error("Error fetching poll:", error);
        throw new Error("Failed to fetch poll");
      }
    }),

  // getLatest: publicProcedure.query(({ ctx }) => {
  //   return ctx.db.poll.findFirst({
  //     orderBy: { createdAt: "desc" },
  //   });
  // }),
});

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
    .query(({ ctx, input }) => {
      return ctx.db.poll.findUnique({
        where: {
          id: input.pollId,
        },
      });
    }),

  // getLatest: publicProcedure.query(({ ctx }) => {
  //   return ctx.db.poll.findFirst({
  //     orderBy: { createdAt: "desc" },
  //   });
  // }),
});

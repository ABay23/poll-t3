import { useRouter } from "next/router";

import { api } from "~/utils/api";

export default function PollPage() {
  const router = useRouter();
  const pollId = router.query.pollId as string;

  const pollResponse = api.post.getPoll.useQuery(
    { pollId },
    { enabled: !!pollId },
  );

  console.log(pollResponse);
  console.log(pollId);

  return (
    <>
      <main className="flex min-h-screen flex-col items-center justify-center bg-gradient-to-b from-[#2e026d] to-[#15162c]">
        <div>
          <h1 className=" text-xl font-bold text-teal-400">Poll Stuff</h1>
        </div>
      </main>
    </>
  );
}

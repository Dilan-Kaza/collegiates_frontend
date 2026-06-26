import { MtHeader } from "@components";
import { useOrganizerGroupset } from "@hooks";
import { useParams, useNavigate } from "react-router";

export default function OrganizerGroupsetDetail() {

    const { uuid } = useParams();
    const nav = useNavigate();
    const groupset = useOrganizerGroupset(uuid);

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="min-h-screen bg-off-white max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6 rounded-2xl">
                <button className="btn btn-ghost w-fit" onClick={() => nav("/organizer/groupset")}>← Back</button>
                <div className="text-3xl text-secondary font-semibold">{groupset.team_name ?? "Group Set"}</div>

                {groupset.school && (
                    <div className="text-sm text-gray-400">{groupset.school.school_name}</div>
                )}

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <div className="text-xl font-semibold text-primary border-b border-gray-200 pb-2">Members</div>
                    {groupset.members?.length > 0 ? (
                        <div className="flex flex-col gap-2">
                            {groupset.members.map((m) => (
                                <div key={m.user_id} className="flex items-center gap-2 text-sm text-dark">
                                    <span>{m.name}</span>
                                    {m.user_id === groupset.leader?.user_id && <span className="text-secondary text-xs">(leader)</span>}
                                </div>
                            ))}
                        </div>
                    ) : (
                        <div className="text-sm text-gray-400">No members.</div>
                    )}
                </div>
            </div>
        </>
    );
}

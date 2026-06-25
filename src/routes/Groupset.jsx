import { useState } from "react";
import { axiosApi } from "@axios/axios";
import { useSelector } from "react-redux";
import { ShortAnswer, Dropdown, MtHeader } from "@components";
import { useForwardSignIn, useGroupSetMembers } from "@hooks";

export default function Groupset(){

    const access = useSelector((state)=>state.jwt.access);
    const [mode, setMode] = useState("create");
    const [createName, setCreateName] = useState("");
    const [joinName, setJoinName] = useState("");
    const groupSetMembers = useGroupSetMembers();
    const groupSetOptions = Object.fromEntries(groupSetMembers.map((g) => [g.team_name, g.groupset_id]));

    const onCreate = () => {
        axiosApi.post('/competitor/groupset/', {
            'team_name': createName,
            'members': [],
        }, {
            mode: "cors",
            withCredentials: true,
            headers: { Authorization: `Bearer ${access}` }
        });
    };

    const onJoin = () => {
        axiosApi.post('/competitor/groupset-members/', {
            'groupset': joinName
        }, {
            mode: "cors",
            withCredentials: true,
            headers: { Authorization: `Bearer ${access}` }
        });
    };

    useForwardSignIn();

    return(
        <>
            <MtHeader/>
            <div className="relative overflow-hidden bg-primary rounded-3xl mx-6 mt-6 px-6 pb-12 flex justify-center">
                <div className="absolute -top-32 -left-32 w-[28rem] h-[28rem] rounded-full bg-secondary/25 blur-3xl pointer-events-none" />
                <div className="absolute top-1/2 -right-24 w-80 h-80 rounded-full bg-secondary/20 blur-3xl pointer-events-none" />
                <div className="absolute -bottom-24 left-1/3 w-72 h-72 rounded-full bg-tertiary/50 blur-3xl pointer-events-none" />
                <div className="absolute top-1/4 left-1/2 w-48 h-48 rounded-full bg-secondary/10 blur-2xl pointer-events-none" />
                <div className="relative z-10 mt-10 w-full max-w-sm">
                <div className="grow bg-off-white max-w-sm rounded-xl border border-brown/50 p-8 flex flex-col gap-6">
                    <div className="flex rounded-lg border border-brown/20 overflow-hidden">
                        <button
                            className={`flex-1 py-2 text-sm font-medium transition-colors ${mode === "create" ? "bg-primary text-white" : "hover:bg-brown/5"}`}
                            onClick={() => setMode("create")}
                        >
                            Create
                        </button>
                        <button
                            className={`flex-1 py-2 text-sm font-medium transition-colors ${mode === "join" ? "bg-primary text-white" : "hover:bg-brown/5"}`}
                            onClick={() => setMode("join")}
                        >
                            Join
                        </button>
                    </div>

                    {mode === "create" ? (
                        <>
                            <div className="text-2xl font-semibold text-center">Create a Team</div>
                            <ShortAnswer
                                name="createName"
                                label="Team Name"
                                value={createName}
                                onChange={(e) => setCreateName(e.target.value)}
                                required
                            />
                            <div className="flex justify-end">
                                <button
                                    className="btn btn-primary"
                                    onClick={onCreate}
                                    disabled={!createName.trim()}
                                >
                                    Create
                                </button>
                            </div>
                        </>
                    ) : (
                        <>
                            <div className="text-2xl font-semibold text-center">Join a Team</div>
                            <Dropdown
                                name="joinName"
                                label="Team Name"
                                options={groupSetOptions}
                                value={joinName}
                                onChange={(e) => setJoinName(e.target.value)}
                                required
                            />
                            <div className="flex justify-end">
                                <button
                                    className="btn btn-primary"
                                    onClick={onJoin}
                                    disabled={!joinName.trim()}
                                >
                                    Join
                                </button>
                            </div>
                        </>
                    )}
                </div>
                </div>
            </div>
        </>
    );
}

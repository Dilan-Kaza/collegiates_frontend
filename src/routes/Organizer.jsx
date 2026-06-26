import { MtHeader, GroupsetList, OrganizerBlogList } from "@components";
import { useOrganizerSettings } from "@hooks";
import { Link } from "react-router";
import { useState } from "react";

export default function Organizer() {

    const settings = useOrganizerSettings();
    const [groupsetsOpen, setGroupsetsOpen] = useState(true);
    const [blogOpen, setBlogOpen] = useState(true);

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6">
                <div className="text-3xl text-secondary font-semibold">Organizer</div>

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <div className="text-xl font-semibold text-primary border-b border-gray-200 pb-2">
                        Tournament Settings
                    </div>
                    <div className="grid grid-cols-2 gap-x-6 gap-y-3 text-sm">
                        {Object.entries(settings).map(([key, value]) => (
                            <div key={key} className="flex flex-col">
                                <span className="text-gray-400 text-xs uppercase tracking-wide">{key}</span>
                                <span className="text-dark font-medium">{String(value)}</span>
                            </div>
                        ))}
                    </div>
                </div>

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <button
                        className="flex justify-between items-center text-xl font-semibold text-primary border-b border-gray-200 pb-2 w-full text-left"
                        onClick={() => setGroupsetsOpen(o => !o)}
                    >
                        <Link to="/organizer/groupset" className="hover:underline" onClick={e => e.stopPropagation()}>Group Sets</Link>
                        <span className="text-sm text-gray-400">{groupsetsOpen ? "▲" : "▼"}</span>
                    </button>
                    {groupsetsOpen && <GroupsetList />}
                </div>

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <button
                        className="flex justify-between items-center text-xl font-semibold text-primary border-b border-gray-200 pb-2 w-full text-left"
                        onClick={() => setBlogOpen(o => !o)}
                    >
                        <Link to="/organizer/blog" className="hover:underline" onClick={e => e.stopPropagation()}>Blog Posts</Link>
                        <span className="text-sm text-gray-400">{blogOpen ? "▲" : "▼"}</span>
                    </button>
                    {blogOpen && <OrganizerBlogList />}
                </div>
            </div>
        </>
    );
}

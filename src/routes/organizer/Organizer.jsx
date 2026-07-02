import { MtHeader, GroupsetList, OrganizerBlogList, OrganizerRegistrationList } from "@components";
import { useOrganizerSettings, useForwardIfNotOrganizer } from "@hooks";
import { Link } from "react-router";
import { useState } from "react";

export default function Organizer() {

    useForwardIfNotOrganizer();
    const settings = useOrganizerSettings();
    const [registrationsOpen, setRegistrationsOpen] = useState(true);
    const [groupsetsOpen, setGroupsetsOpen] = useState(true);
    const [blogOpen, setBlogOpen] = useState(true);

    const dateFields = new Set(["early_reg_start", "early_reg_end", "reg_start", "reg_end", "comp_date"]);
    const labels = {
        reg_year: "Year",
        early_reg_start: "Early Reg Opens",
        early_reg_end: "Early Reg Deadline",
        reg_start: "Reg Opens",
        reg_end: "Reg Deadline",
        comp_date: "Competition Date",
        contact_email: "Contact Email",
        host: "Host",
    };

    const formatValue = (key, value) => {
        if (!value) return "—";
        if (dateFields.has(key)) {
            return new Date(`${value}T00:00:00`).toLocaleDateString('en-US', { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' });
        }
        return String(value);
    };

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6">
                <div className="text-3xl text-secondary font-semibold">Organizer</div>

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <div className="flex justify-between items-center border-b border-gray-200 pb-2">
                        <div className="text-xl font-semibold text-primary">Tournament Settings</div>
                        <Link to="/organizer/settings" className="btn btn-secondary btn-sm">Edit</Link>
                    </div>
                    <div className="grid grid-cols-2 gap-x-8 gap-y-4 text-sm">
                        {Object.entries(labels).map(([key, label]) => (
                            <div key={key} className="flex flex-col gap-0.5">
                                <span className="text-gray-400 text-xs uppercase tracking-wide">{label}</span>
                                <span className="text-dark font-medium">{formatValue(key, settings[key])}</span>
                            </div>
                        ))}
                    </div>
                </div>

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <button
                        className="flex justify-between items-center text-xl font-semibold text-primary border-b border-gray-200 pb-2 w-full text-left"
                        onClick={() => setRegistrationsOpen(o => !o)}
                    >
                        <Link to="/organizer/registrations" className="hover:underline" onClick={e => e.stopPropagation()}>Registrations</Link>
                        <span className="text-sm text-gray-400">{registrationsOpen ? "▲" : "▼"}</span>
                    </button>
                    {registrationsOpen && <OrganizerRegistrationList />}
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

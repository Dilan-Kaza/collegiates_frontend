import { MtHeader } from "@components";
import { useOrganizerSettings, useForwardIfNotOrganizer } from "@hooks";
import { clearCache, setErrorMsg } from "@slices";
import { axiosAuth } from "@axios/axios";
import { useNavigate } from "react-router";
import { useState, useEffect } from "react";
import { useDispatch } from "react-redux";

export default function OrganizerSettings() {

    useForwardIfNotOrganizer();
    const nav = useNavigate();
    const dispatch = useDispatch();
    const settings = useOrganizerSettings();

    const [form, setForm] = useState({});
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        if (settings && Object.keys(settings).length > 0) {
            setForm(settings);
        }
    }, [settings]);

    const handleChange = (key, value) => {
        setForm(f => ({ ...f, [key]: value }));
    };

    const handleSave = async () => {
        setLoading(true);
        try {
            await axiosAuth.patch("/organizer/settings/", form);
            dispatch(clearCache("organizerSettings"));
            nav("/organizer");
        } catch (err) {
            dispatch(setErrorMsg(err.response?.data?.detail ?? "Failed to save settings"));
        }
        setLoading(false);
    };

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6">
                <div className="flex items-center justify-between">
                    <button className="btn btn-ghost w-fit" onClick={() => nav("/organizer")}>← Back</button>
                </div>

                <div className="text-3xl text-secondary font-semibold">Competition Settings</div>

                <div className="bg-off-white rounded-2xl px-6 py-5 flex flex-col gap-5">
                    {Object.keys(form).map((key) => (
                        <div key={key} className="flex flex-col gap-1">
                            <label className="text-xs text-gray-400 uppercase tracking-wide">{key}</label>
                            <input
                                className="border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-primary"
                                value={form[key] ?? ""}
                                onChange={(e) => handleChange(key, e.target.value)}
                            />
                        </div>
                    ))}
                </div>

                <div className="flex justify-end">
                    <button className="btn btn-primary" onClick={handleSave} disabled={loading}>
                        {loading ? "Saving..." : "Save"}
                    </button>
                </div>
            </div>
        </>
    );
}

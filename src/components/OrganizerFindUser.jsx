import { useState } from "react";
import { useDispatch } from "react-redux";
import { setErrorMsg } from "@slices";
import { axiosAuth } from "@axios/axios";

export default function OrganizerFindUser({ onFound }) {

    const dispatch = useDispatch();
    const [email, setEmail] = useState("");
    const [loading, setLoading] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        try {
            const res = await axiosAuth.get(`/organizer/user/${email}/`);
            const { user_id, first_name, last_name } = res.data.data;
            onFound?.(user_id, `${first_name} ${last_name}`);
            setEmail("");
        } catch (err) {
            dispatch(setErrorMsg(err.response?.data?.detail ?? "User not found"));
        }
        setLoading(false);
    };

    return (
        <form onSubmit={handleSubmit} className="flex gap-2 items-center">
            <input
                type="email"
                className="border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-primary flex-1"
                placeholder="Search by email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
            />
            <button className="btn btn-primary btn-sm" type="submit" disabled={loading}>
                {loading ? "..." : "Find"}
            </button>
        </form>
    );
}

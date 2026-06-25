import { useNavigate } from "react-router";
import { useCurrentUser } from "@hooks";
import { useState, useEffect } from "react";

export default function NavDock(){

    const nav = useNavigate();
    const [username, setUsername] = useState("");
    const userInfo = useCurrentUser();

    useEffect(() => {
        if (userInfo) {
            setUsername(userInfo.first_name);
        } else {
            setUsername("");
        }
    }, [userInfo]);

    return (
        <div className="dock">
            <button onClick={()=>nav("/")}>
                <i className="bi bi-house-door"></i>
                <span className="dock-label">Home</span>
            </button>

            <button onClick={()=>nav("/about")}>
                <i className="bi bi-info-square"></i>
                <span className="dock-label">About</span>
            </button>

            <button onClick={()=>nav("/tournament")}>
                <i className="bi bi-bank"></i>
                <span className="dock-label">Tournament</span>
            </button>

            <button onClick={()=>nav(username ? "/dashboard" : "/signin")}>
                <i className="bi bi-person-circle"></i>
                <span className="dock-label">{username || "Login"}</span>
            </button>
        </div>
    );
}
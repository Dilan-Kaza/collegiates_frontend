import { useState } from "react";
import { useNavigate } from "react-router";
import { axiosAuth } from "../axios/axios";
import { clearJwt } from "../slices/jwt";
import { useDispatch, useSelector } from "react-redux";
import { setSuccessMsg } from "../slices/success";


export default function LogoutButton() {
    const access = useSelector(state => state.jwt.access);
    const dispatch = useDispatch();
    const nav = useNavigate();
    const [loggingOut, setLoggingOut] = useState(false);

    const handleLogout = () => {
        setLoggingOut(true);
        axiosAuth.post('/auth/jwt/logout/')
        .then(() => {
            dispatch(clearJwt());
            dispatch(setSuccessMsg("Successfully logged out!"));
            nav('/');
        })
        .catch((err) => {
            console.warn(err);
            setLoggingOut(false);
        });
    };

    return (
        <>
            {loggingOut && (
                <div style={{
                    position: "fixed",
                    inset: 0,
                    zIndex: 9999,
                    backgroundColor: "rgba(0, 0, 0, 0.6)",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                }}>
                    <div style={{
                        backgroundColor: "white",
                        borderRadius: "12px",
                        padding: "48px 64px",
                        textAlign: "center",
                        boxShadow: "0 25px 50px rgba(0,0,0,0.4)",
                    }}>
                        <p style={{ fontSize: "1.5rem", fontWeight: 600, margin: 0 }}>
                            Logging out...
                        </p>
                    </div>
                </div>
            )}
            <button className="btn text-base w-fit" onClick={handleLogout}>
                Log Out
            </button>
        </>
    );
}

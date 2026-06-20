import { useNavigate } from "react-router";

export default function NavDock(){

    const nav = useNavigate();

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
        </div>
    );
}
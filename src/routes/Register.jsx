import { MtHeader } from "../components/Headers";
import EventSelection from "../components/EventSelection";
import { useEffect } from "react";
import { useCurrentUser } from "../hooks/userApiHooks";
import { useNavigate } from "react-router";

export default function Register() {
    
    const nav = useNavigate();
    const userinfo = useCurrentUser();

    useEffect(()=>{
        if(Object.keys(userinfo).length !== 0 && userinfo?.registrations.length !== 0){
            console.log(userinfo);
            nav('/dashboard');
        }
    },[userinfo]);

    return (
        <div>
            <MtHeader/>
            <EventSelection/>
        </div>
    );
}
import { MtHeader, EventSelection } from "@components";
import { useEffect } from "react";
import { useCurrentUser, useForwardSignIn } from "@hooks";
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

    useForwardSignIn();

    return (
        <div>
            <div className="hidden sm:block"><MtHeader/></div>
            <EventSelection/>
        </div>
    );
}
"use client"

import { useCurrentUser, useForwardSignIn } from "@hooks";
import { MtHeader, LogoutButton } from "@components";
import { useNavigate } from "react-router";

export default function Dashboard (){
    
    
    const userinfo = useCurrentUser();
    const nav = useNavigate();

    
    useForwardSignIn();

    return (        
        <>
            <div className="hidden md:block"><MtHeader/></div>
            <div
                id="bg-component"
                className="bg-gradient-to-b from-tertiary via-secondary via-100% to-primary h-[60vh] w-[80%] absolute top-20 left-[10%] -z-20 [clip-path:polygon(0%_0%,100%_0%,100%_100%,50%_88%,0%_100%)]"
            />
            <div className="bg-off-white grid grid-cols-[1fr_2fr] rounded-lg px-[5%] py-8 max-w-3xl mx-auto w-full">
                <div className="grid-row p-1">
                    <div className="flex flex-col gap-2">
                        <span className="text-4xl">{userinfo.first_name} {userinfo.last_name}</span>
                        <LogoutButton/>
                    </div>
                    <div className="py-2 text-sm space-y-1">
                        <div>email: {userinfo.email}</div>
                        <div>gender: {userinfo.gender}</div>
                        <div>school: {userinfo.school_name}</div>
                        <div>student type: {userinfo.student_type}</div>
                        <div>first comp: {userinfo.first_comp}</div>
                        <div>skill level: {userinfo.skill_level}</div>
                    </div>
                </div>
                <div className="p-1 content-center flex flex-col items-center">
                    {userinfo.registrations?.length > 0 ? (
                        <div className="space-y-2 flex flex-col items-center w-full">
                            <div className="text-lg font-semibold mb-2">Registered Events</div>
                            {userinfo.registrations.map((reg, i) => (
                                <div key={i} className="border border-gray-200 rounded-lg px-4 py-2 text-sm w-full text-center">
                                    <div className="font-medium">{reg.event_name}</div>
                                    {reg.nandu_str && <div className="text-gray-500">Nandu: {reg.nandu_str}</div>}
                                </div>
                            ))}
                            <button className="btn btn-secondary mt-2" onClick={() => nav('/groupset')}>Group Set</button>
                        </div>
                    ) : (
                        <button className="btn btn-primary" onClick={() => nav('/register')}>Register</button>
                    )}
                </div>
            </div>
        </>
    )
}
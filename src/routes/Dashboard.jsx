"use client"

import { useCurrentUser } from "../hooks/userApiHooks"
import { MtHeader } from "../components/Headers";
import { useDispatch, useSelector } from "react-redux";
import { clearJwt } from "../slices/jwt";
import { useNavigate } from "react-router";
import axiosApi from "../axios/axios";

export default function Dashboard (){
    
    
    const userinfo = useCurrentUser();
    const dispatch= useDispatch();
    const jwt = useSelector((state)=>state.jwt.access);
    const nav = useNavigate();
    
    return (        
        <>
            <MtHeader/>
            <div className="bg-off-white grid grid-cols-[1fr_2fr_1fr] rounded-lg px-[10%]">
                <div className="grid-row text-4xl p-1">
                    <div>
                        {userinfo.first_name} {userinfo.last_name}
                    </div>
                    <div className="content-center">
                        <button className="btn" onClick={()=>{
                            axiosApi.post('/auth/jwt/logout/', null, {
                                mode: "cors",
                                headers: {
                                    "Content-Type": "application/json",
                                    "Authorization": `Bearer ${jwt}`,
                                },
                            })
                            .then((res)=>{
                                dispatch(clearJwt());
                                nav('/');
                            })
                            .catch((err) => console.warn(err));
                            
                        }}>Sign Out</button>
                    </div>
                </div>
                <div className="p-1 content-center">
                    {userinfo.registrations?.length > 0 ? (
                        <div className="space-y-2">
                            <div className="text-lg font-semibold mb-2">Registered Events</div>
                            {userinfo.registrations.map((reg, i) => (
                                <div key={i} className="border border-gray-200 rounded-lg px-4 py-2 text-sm">
                                    <div className="font-medium">{reg.event}</div>
                                    {reg.nandu_str && <div className="text-gray-500">Nandu Code: {reg.nandu_str}</div>}
                                </div>
                            ))}
                        </div>
                    ) : (
                        <button className="btn btn-primary" onClick={() => nav('/register')}>Register</button>
                    )}
                </div>
                <div className="p-1 py-15">
                    email: {userinfo.email}<br/>
                    gender: {userinfo.gender}<br/>
                    school: {userinfo.school_name}<br/>
                    student type: {userinfo.student_type}<br/>
                    first comp: {userinfo.first_comp}<br/>
                    skill level: {userinfo.skill_level}<br/>
                    user type: {userinfo.user_type}
                </div>
            </div>
        </>
    )
}
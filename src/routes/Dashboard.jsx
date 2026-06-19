"use client"

import { useCurrentUser } from "../hooks/userApiHooks"
import { MtHeader } from "../components/Headers";
import { useDispatch, useSelector } from "react-redux";
import { clearJwt } from "../slices/jwt";
import { useNavigate } from "react-router";

export default function Dashboard (){
    
    const userinfo = useCurrentUser();
    const dispatch= useDispatch();
    const jwt = useSelector((state)=>state.jwt.access);
    const nav = useNavigate();
    
    return (        
        <>
            <MtHeader/>
            <div className="bg-off-white grid grid-cols-3 rounded-lg px-[10%]">
                <div className="grid-row text-4xl p-1">
                    <div>
                        {userinfo.first_name} {userinfo.last_name}
                    </div>
                    <div className="content-center">
                        <button className="btn" onClick={()=>{
                            dispatch(clearJwt());
                            document.cookie = 'refresh=';
                            console.log(jwt);
                        }}>Sign Out</button>
                    </div>
                </div>
                <div className="flex flex-cols-3 p-1">
                    <div className="flex-1"/>
                    <div className="flex-1 content-center">
                        <button className="btn btn-primary" onClick={()=>{nav('/register')}}>Register</button>
                    </div>
                    <div className="flex-1"/>
                </div>
                <div className="p-1 py-15">
                    email: {userinfo.email}<br/>
                    gender: {userinfo.gender}<br/>
                    school: {userinfo.school}<br/>
                    student type: {userinfo.student_type}<br/>
                    first comp: {userinfo.first_comp}<br/>
                    skill level: {userinfo.skill_level}<br/>
                    user type: {userinfo.user_type}
                </div>
            </div>
        </>
    )
}
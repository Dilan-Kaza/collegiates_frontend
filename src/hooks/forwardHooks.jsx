import { useSelector } from "react-redux";
import { useNavigate } from "react-router";
import { useEffect } from "react";


function useForwardDashboard(){

    const status = useSelector((state) => state.loginStatus);
    const nav = useNavigate();

    useEffect(()=>{
        if (status.loading === false && status.loggedIn === true) {
            nav('/dashboard');
        }

    },[status])
}

function useForwardSignIn(){

    const status = useSelector((state) => state.loginStatus);
    const nav = useNavigate();

    useEffect(()=>{
        if (status.loading === false && status.loggedIn === false) {
            nav('/signin');
        }

    },[status])
}

export { useForwardDashboard, useForwardSignIn };
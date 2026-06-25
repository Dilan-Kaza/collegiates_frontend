import { axiosAuth } from "../axios/axios";
import { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { setJwt } from "../slices/jwt";
import store from "../store";
import { useNavigate } from "react-router";


function useCurrentUser(){

    const [userInfo, setUserInfo] = useState({});

    const access = useSelector((state)=>state.jwt.access);

  useEffect(() => {

    const getMe = async () => {

        axiosAuth
            .get("/auth/users/me/")
            .then((res) => setUserInfo(res.data))
            .catch((err) => setUserInfo(""));
    }
    getMe();

  },[access]);


  return userInfo;
}

function useEvents(){

    const [events, setEvents] = useState([]);
    const access = useSelector((state)=>state.jwt.access);
    

    useEffect(() => {
        
        const init = async () => {
        axiosAuth
                .get("/competitor/events/")
                .then((response) => setEvents(
                    response.data
                ))
                .catch((err) => console.warn("Could not fetch events", err));
        };
        init();
    }, [access]);
    return events;
}

export { useCurrentUser, useEvents  };
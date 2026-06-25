import axiosApi from "../axios/axios";
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

        axiosApi
            .get("/auth/users/me/", {
                mode: "cors",
                withCredentials: true,
                credentials: "include",
                headers: {
                    Authorization: `Bearer ${access}`,
                }
            })
            .then((res) => setUserInfo(res.data))
            .catch((err) => setUserInfo(""));
    }
    getMe();

  },[access]);


  return userInfo;
}

function useEvents(){

    const [events, setEvents] = useState([]);
    

    useEffect(() => {
        
        const init = async () => {
        axiosApi
                .get("/competitor/events/", {
                mode: "cors",
                headers: { "Content-Type": "application/json" },
                credentials: "include",
                })
                .then((response) => setEvents(
                    response.data
                ))
                .catch((err) => console.warn("Could not fetch events", err));
        };
        console.log(events);
        init();
    }, []);
    return events;
}

export { useCurrentUser, useEvents  };
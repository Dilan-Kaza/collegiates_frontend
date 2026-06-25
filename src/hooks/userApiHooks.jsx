import { axiosAuth } from "@axios/axios";
import { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { setLoginStatus } from "@slices";


function useCurrentUser(){

    const [userInfo, setUserInfo] = useState({});
    const dispatch = useDispatch();
    const access = useSelector((state)=>state.jwt.access);

  useEffect(() => {

    const getMe = async () => {

        axiosAuth
            .get("/auth/users/me/")
            .then((res) => {
                setUserInfo(res.data);
                dispatch(setLoginStatus(true));
            })
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

function useGroupSetMembers(){

    const [members, setMembers] = useState([]);
    const access = useSelector((state)=>state.jwt.access);

    useEffect(() => {
        const init = async () => {
            axiosAuth
                .get("/competitor/groupset-members/")
                .then((res) => setMembers(res.data))
                .catch((err) => console.warn("Could not fetch group set members", err));
        };
        init();
    }, [access]);

    return members;
}

export { useCurrentUser, useEvents, useGroupSetMembers };
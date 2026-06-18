import axios from "../axios/axios";
import { useEffect, useState } from "react";
import { useSelector } from "react-redux";

function useCurrentUser(){

    const [userInfo, setUserInfo] = useState({});

    const access = useSelector((state)=>state.jwt.access);
    console.log(access);

  useEffect(() => {

    const getMe = async () => {

        axios
            .get("/auth/users/me", {
                mode: "cors",
                withCredentials: true,
                credentials: "include",
                headers: {
                    Authorization: `Bearer ${access}`,
                }
            })
            .then((res) => setUserInfo(res.data))
            .catch(() => console.warn("not logged in"));
    }
    if (access !== "") {
        getMe();
    }

  },[access]);

  return userInfo;
}

export { useCurrentUser };
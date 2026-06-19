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

export { useCurrentUser };
import axios from "../axios/axios";
import { setJwt } from "../slices/jwt";
import { useSelector, useDispatch } from "react-redux";
import { useEffect } from "react";


const useRefreshToken = () => {
    const access = useSelector((state)=>state.jwt.access);
    
    useEffect(() => {
        const getNewTok = async () => {
            axios
                .post("/auth/jwt/refresh", {
                    withCredentials: true
                })
                .then((res)=>{
                    console.log(res.data);
                    dispatch(setJwt(res.data.access));
                    console.log("Signed In")
                })
                .catch((err)=>{
                    console.log("not signed in");
                });
            }
        
        getNewTok();


    }, []);
}

export default useRefreshToken;
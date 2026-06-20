import { useEffect, useState } from "react";
import axios from "../axios/axios";
import { useSelector } from "react-redux";
import { useNavigate } from "react-router";

function useCsrf(){

  useEffect(() => {
    const csrf = async () => {
        axios
            .get("/csrf/", {
                mode: "cors",
                withCredentials: true,
                credentials: "include",
            })
            .catch(() => console.warn("Could not fetch CSRF token"));
    };

    csrf();

  },[]);
}

function useColleges(){

    const [colleges, setColleges] = useState({});
    

    useEffect(() => {
        
        const init = async () => {
        axios
                .get("/college_data/", {
                mode: "cors",
                headers: { "Content-Type": "application/json" },
                credentials: "include",
                })
                .then((response) => setColleges(
                Object.fromEntries(
                    response.data.map(({ college_name, college_id }) => [college_name, college_id])
                )
                ))
                .catch((err) => console.warn("Could not fetch colleges", err));
        };

        init();
    }, []);

    return colleges;
}

function useEvents(){

    const [events, setEvents] = useState({});
    

    useEffect(() => {
        
        const init = async () => {
        axios
                .get("/events/", {
                mode: "cors",
                headers: { "Content-Type": "application/json" },
                credentials: "include",
                })
                .then((response) => setEvents(
                Object.fromEntries(
                    response.data.map(({ event_name, college_id }) => [college_name, college_id])
                )
                ))
                .catch((err) => console.warn("Could not fetch colleges", err));
        };

        init();
    }, []);

    return events;
}

function useForwardDashboard(){

    const access = useSelector((state) => state.jwt.access);
    const nav = useNavigate();

    useEffect(()=>{

        if (access !== "") {
            nav('/dashboard');
        }

    },[access])
}

export { useCsrf, useColleges, useForwardDashboard };
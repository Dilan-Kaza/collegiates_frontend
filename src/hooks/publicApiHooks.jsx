import { useEffect, useState } from "react";
import { axiosApi } from "@axios/axios";
import { useSelector } from "react-redux";
import { useNavigate } from "react-router";

function useCsrf(){

  useEffect(() => {
    const csrf = async () => {
        axiosApi
            .get("/csrf/")
            .catch(() => console.warn("Could not fetch CSRF token"));
    };

    csrf();

  },[]);
}

function useColleges(){

    const [colleges, setColleges] = useState({});
    

    useEffect(() => {
        
        const init = async () => {
        axiosApi
                .get("/college_data/")
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


export { useCsrf, useColleges};
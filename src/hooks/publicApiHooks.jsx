import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { setCache } from "@slices";
import { axiosApi } from "@axios/axios";

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

    const dispatch = useDispatch();
    const cached = useSelector((state) => state.cache.colleges);

    useEffect(() => {
        if (cached) return;
        axiosApi
            .get("/college_data/")
            .then((response) => dispatch(setCache({
                key: "colleges",
                data: Object.fromEntries(
                    response.data.map(({ college_name, college_id }) => [college_name, college_id])
                )
            })))
            .catch((err) => console.warn("Could not fetch colleges", err));
    }, []);

    return cached ?? {};
}


function useOrganizerSettings() {

    const dispatch = useDispatch();
    const cached = useSelector((state) => state.cache.organizerSettings);

    useEffect(() => {
        if (cached) return;
        axiosApi
            .get("/organizer/settings/")
            .then((res) => dispatch(setCache({ key: "organizerSettings", data: res.data })))
            .catch((err) => console.warn("Could not fetch organizer settings", err));
    }, []);

    return cached ?? {};
}


export { useCsrf, useColleges, useOrganizerSettings };
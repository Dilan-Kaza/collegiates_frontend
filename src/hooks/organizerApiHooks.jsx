import { axiosAuth } from "@axios/axios";
import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { setSessionCache } from "@slices";

function useOrganizerGroupsets(){

    const dispatch = useDispatch();
    const access = useSelector((state)=>state.jwt.access);
    const cached = useSelector((state) => state.sessionCache.organizerGroupsets);

    useEffect(() => {
        if (cached?.length) return;
        axiosAuth
            .get("/organizer/groupset/")
            .then((res) => dispatch(setSessionCache({ key: "organizerGroupsets", data: res.data })))
            .catch((err) => console.warn("Could not fetch organizer groupsets", err));
    }, [access]);

    return cached ?? [];
}

function useOrganizerGroupset(uuid){

    const dispatch = useDispatch();
    const access = useSelector((state)=>state.jwt.access);
    const cached = useSelector((state) => state.sessionCache[`groupset_${uuid}`]);

    useEffect(() => {
        if (!uuid) return;
        if (cached && Object.keys(cached).length > 0) return;
        axiosAuth
            .get(`/organizer/groupset/${uuid}/`)
            .then((res) => dispatch(setSessionCache({ key: `groupset_${uuid}`, data: res.data })))
            .catch((err) => console.warn("Could not fetch groupset", err));
    }, [access, uuid]);

    return cached ?? {};
}

export { useOrganizerGroupsets, useOrganizerGroupset };

import { axiosAuth } from "@axios/axios";
import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { setLoginStatus, setSessionCache } from "@slices";


function useCurrentUser(){

    const dispatch = useDispatch();
    const access = useSelector((state)=>state.jwt.access);
    const cached = useSelector((state) => state.sessionCache.currentUser);

    useEffect(() => {
        if (cached && Object.keys(cached).length > 0) return;
        axiosAuth
            .get("/auth/users/me/")
            .then((res) => {
                dispatch(setSessionCache({ key: "currentUser", data: res.data }));
                dispatch(setLoginStatus(true));
            })
            .catch(() => dispatch(setSessionCache({ key: "currentUser", data: {} })));
    }, [access]);

    return cached ?? {};
}

function useEvents(){

    const dispatch = useDispatch();
    const access = useSelector((state)=>state.jwt.access);
    const cached = useSelector((state) => state.sessionCache.events);

    useEffect(() => {
        if (cached?.length) return;
        axiosAuth
            .get("/competitor/events/")
            .then((res) => dispatch(setSessionCache({ key: "events", data: res.data })))
            .catch((err) => console.warn("Could not fetch events", err));
    }, [access]);

    return cached ?? [];
}

function useGroupSetMembers(){

    const dispatch = useDispatch();
    const access = useSelector((state)=>state.jwt.access);
    const cached = useSelector((state) => state.sessionCache.groupSetMembers);

    useEffect(() => {
        if (cached?.length) return;
        axiosAuth
            .get("/competitor/groupset-members/")
            .then((res) => dispatch(setSessionCache({ key: "groupSetMembers", data: res.data })))
            .catch((err) => console.warn("Could not fetch group set members", err));
    }, [access]);

    return cached ?? [];
}

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

export { useCurrentUser, useEvents, useGroupSetMembers, useOrganizerGroupsets };

import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { setCache, setBlogCategory } from "@slices";
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


function useOrganizerBlog() {

    const dispatch = useDispatch();
    const cached = useSelector((state) => state.cache.organizerBlog);

    useEffect(() => {
        if (cached?.length) return;
        axiosApi
            .get("/organizer/blog/")
            .then((res) => dispatch(setCache({ key: "organizerBlog", data: res.data })))
            .catch((err) => console.warn("Could not fetch blog posts", err));
    }, []);

    return cached ?? [];
}


function useOrganizerBlogPost(blog_id) {

    const dispatch = useDispatch();
    const cached = useSelector((state) => state.cache[`blogPost_${blog_id}`]);

    useEffect(() => {
        if (!blog_id) return;
        if (cached && Object.keys(cached).length > 0) {
            dispatch(setBlogCategory(cached.category));
            return;
        }
        axiosApi
            .get(`/organizer/blog/${blog_id}/`)
            .then((res) => {
                dispatch(setCache({ key: `blogPost_${blog_id}`, data: res.data }));
                dispatch(setBlogCategory(res.data.category));
            })
            .catch((err) => console.warn("Could not fetch blog post", err));
    }, [blog_id, cached]);

    return cached ?? {};
}


export { useCsrf, useColleges, useOrganizerSettings, useOrganizerBlog, useOrganizerBlogPost };
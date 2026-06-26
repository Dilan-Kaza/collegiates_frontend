import { MtHeader, OrganizerBlogList } from "@components";
import { clearCache, setErrorMsg } from "@slices";
import { axiosAuth } from "@axios/axios";
import { useState } from "react";
import { useNavigate } from "react-router";
import { useDispatch } from "react-redux";

export default function OrganizerBlog() {

    const nav = useNavigate();
    const dispatch = useDispatch();
    const [title, setTitle] = useState("");
    const [blog_content, setBlogContent] = useState("");
    const [author, setAuthor] = useState("");
    const [category, setCategory] = useState("");
    const [loading, setLoading] = useState(false);
    const [listKey, setListKey] = useState(0);

    const handlePost = () => {
        if (!title.trim() || !blog_content.trim()) return;
        setLoading(true);
        axiosAuth.post("/organizer/blog/", { title, blog_content, author, category })
            .then(() => {
                dispatch(clearCache("organizerBlog"));
                setListKey(k => k + 1);
                setTitle("");
                setBlogContent("");
                setAuthor("");
                setCategory("");
            })
            .catch((err) => dispatch(setErrorMsg(err.response?.data?.detail ?? "Failed to post blog")))
            .finally(() => setLoading(false));
    };

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6">
                <div className="flex items-center gap-4">
                    <button className="btn btn-primary btn-sm" onClick={() => nav("/organizer")}>← Back</button>
                    <div className="text-3xl text-secondary font-semibold">Blog Posts</div>
                </div>

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <div className="text-xl font-semibold text-primary border-b border-gray-200 pb-2">New Post</div>
                    <input
                        className="border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-primary"
                        placeholder="Title"
                        value={title}
                        onChange={(e) => setTitle(e.target.value)}
                    />
                    <input
                        className="border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-primary"
                        placeholder="Author"
                        value={author}
                        onChange={(e) => setAuthor(e.target.value)}
                    />
                    <input
                        className="border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-primary"
                        placeholder="Category"
                        value={category}
                        onChange={(e) => setCategory(e.target.value)}
                    />
                    <textarea
                        className="border border-gray-300 rounded-md px-3 py-2 text-sm focus:outline-primary min-h-[8rem] resize-y"
                        placeholder="Content"
                        value={blog_content}
                        onChange={(e) => setBlogContent(e.target.value)}
                    />
                    <div className="flex justify-end">
                        <button
                            className="btn btn-primary"
                            onClick={handlePost}
                            disabled={loading || !title.trim() || !blog_content.trim()}
                        >
                            {loading ? "Posting..." : "Post"}
                        </button>
                    </div>
                </div>

                <div className="bg-off-white rounded-lg px-6 py-5 flex flex-col gap-4">
                    <div className="text-xl font-semibold text-primary border-b border-gray-200 pb-2">Posts</div>
                    <OrganizerBlogList key={listKey} />
                </div>
            </div>
        </>
    );
}

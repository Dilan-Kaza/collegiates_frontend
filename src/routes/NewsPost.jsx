import { MtHeader, BlogList } from "@components";
import { useOrganizerBlogPost } from "@hooks";
import { useParams, useNavigate } from "react-router";

export default function NewsPost() {

    const { blog_id } = useParams();
    const nav = useNavigate();
    const post = useOrganizerBlogPost(blog_id);

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-5xl mx-auto w-full px-4 py-8 flex gap-8">
                <div className="hidden md:flex flex-col gap-3 w-48 shrink-0 bg-off-white rounded-2xl px-4 py-5 h-fit">
                    <div className="text-sm font-semibold text-gray-500 uppercase tracking-wide">Posts</div>
                    <BlogList />
                </div>

                <div className="flex flex-col gap-6 flex-1">
                    <button className="btn btn-secondary btn-sm w-fit" onClick={() => nav(-1)}>← Back</button>
                    <div className="bg-off-white rounded-2xl px-6 py-5 flex flex-col gap-4 min-h-[20rem]">
                        <div className="text-3xl text-secondary font-semibold">{post.title}</div>
                        {post.author && <div className="text-sm text-gray-400">By {post.author}</div>}
                        {post.category && <div className="text-xs text-primary font-medium uppercase tracking-wide">{post.category}</div>}
                        {post.date && <div className="text-xs text-gray-400">{post.date}</div>}
                        <div className="border-t border-gray-200 pt-4 text-dark text-sm whitespace-pre-wrap">
                            {post.blog_content}
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

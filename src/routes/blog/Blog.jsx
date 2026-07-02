import { MtHeader, BlogList } from "@components";
import { useOrganizerBlogPost } from "@hooks";
import { Link, useParams } from "react-router";
import { useSelector } from "react-redux";

function renderContent(content) {
    return content.split(/(link"[^"]*")/g).map((part, i) => {
        const match = part.match(/^link"([^"]*)"$/);
        if (match) {
            return <a key={i} href={match[1]} target="_blank" rel="noopener noreferrer" className="link link-primary">{match[1]}</a>;
        }
        return <span key={i}>{part}</span>;
    });
}

export default function Blog() {

    const { blog_id } = useParams();
    const post = useOrganizerBlogPost(blog_id);
    const category = useSelector((state) => state.blogCategory.category);
    const categoryPath = category === "Multimedia" ? "/multimedia" : "/news";

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-5xl mx-auto w-full px-4 py-8 flex gap-8">
                <div className="hidden md:flex flex-col gap-3 w-48 shrink-0 rounded-2xl px-4 py-5 h-fit">
                    <Link to={categoryPath} className="text-sm font-semibold text-secondary uppercase tracking-wide hover:underline">{category || "Posts"}</Link>
                    <BlogList activeBlogId={blog_id} category={category} />
                </div>

                <div className="flex flex-col gap-6 flex-1">
                    <div className="bg-off-white rounded-2xl px-6 py-5 flex flex-col gap-4 min-h-[20rem]">
                        <div className="flex items-baseline gap-3">
                            <div className="text-3xl text-primary font-semibold">{post.title}</div>
                            {post.date_created && <div className="text-xs text-gray-400">{new Date(post.date_created).toLocaleDateString()}</div>}
                        </div>
                        {post.author && <div className="text-sm text-gray-400">By {post.author}</div>}
                        <div className="border-t border-gray-200 pt-4 text-dark text-sm whitespace-pre-wrap">
                            {renderContent(post.blog_content || "")}
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

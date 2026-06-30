import { Link } from "react-router";
import { useOrganizerBlog } from "@hooks";

export default function BlogList({ activeBlogId }) {

    const posts = useOrganizerBlog();

    if (posts.length === 0) return (
        <div className="text-sm text-gray-400">No blog posts found.</div>
    );

    const sorted = [...posts].sort((a, b) => new Date(b.date_created) - new Date(a.date_created));

    return (
        <div className="flex flex-col gap-2 bg-primary rounded-lg px-3 py-2">
            {sorted.map((post) => post.blog_id === activeBlogId ? (
                <div key={post.blog_id} className="flex flex-col">
                    <span className="text-yellow-400 underline">{post.title}</span>
                    {post.date_created && <span className="text-xs text-off-white/60">{new Date(post.date_created).toLocaleDateString()}</span>}
                </div>
            ) : (
                <Link key={post.blog_id} to={`/news/${post.blog_id}`} className="link link-hover flex flex-col text-off-white">
                    <span>{post.title}</span>
                    {post.date_created && <span className="text-xs text-off-white/60">{new Date(post.date_created).toLocaleDateString()}</span>}
                </Link>
            ))}
        </div>
    );
}

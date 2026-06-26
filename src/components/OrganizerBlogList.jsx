import { Link } from "react-router";
import { useOrganizerBlog } from "@hooks";
import { useState } from "react";

export default function OrganizerBlogList() {

    const posts = useOrganizerBlog();
    const [visible, setVisible] = useState(3);

    if (posts.length === 0) return (
        <div className="text-sm text-gray-400">No blog posts found.</div>
    );

    return (
        <div className="flex flex-col gap-3">
            {posts.slice(0, visible).map((post) => (
                <Link key={post.blog_id} to={`/organizer/blog/${post.blog_id}`} className="border border-gray-200 rounded-lg px-4 py-3 hover:bg-gray-50 transition-colors">
                    <div className="font-medium text-dark">{post.title}</div>
                    {post.author && <div className="text-xs text-gray-400 mt-1">By {post.author}</div>}
                    {post.category && <div className="text-xs text-primary font-medium uppercase tracking-wide mt-1">{post.category}</div>}
                    {post.date && <div className="text-xs text-gray-400 mt-1">{post.date}</div>}
                    {post.blog_content && <div className="text-sm text-gray-500 mt-2 line-clamp-2">{post.blog_content}</div>}
                </Link>
            ))}
            {visible < posts.length && (
                <button
                    className="btn btn-ghost btn-sm self-center"
                    onClick={() => setVisible(v => v + 3)}
                >
                    Load More
                </button>
            )}
        </div>
    );
}

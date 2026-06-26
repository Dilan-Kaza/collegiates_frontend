import { Link } from "react-router";
import { useOrganizerBlog } from "@hooks";

export default function BlogNews() {

    const posts = useOrganizerBlog();

    if (posts.length === 0) return (
        <div className="text-sm text-gray-400">No blog posts found.</div>
    );

    return (
        <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            {posts.slice(0, 3).map((post) => (
                <Link key={post.blog_id} to={`/news/${post.blog_id}`} className="bg-off-white border border-gray-200 rounded-lg p-4 flex flex-col gap-2 h-48 overflow-hidden hover:border-primary transition-colors">
                    <div className="font-medium text-dark">{post.title}</div>
                    {post.author && <div className="text-xs text-gray-400">By {post.author}</div>}
                    {post.category && <div className="text-xs text-primary font-medium uppercase tracking-wide">{post.category}</div>}
                    {post.date && <div className="text-xs text-gray-400">{post.date}</div>}
                    {post.blog_content && <div className="text-sm text-gray-500 mt-1 overflow-hidden">{post.blog_content}</div>}
                </Link>
            ))}
        </div>
    );
}

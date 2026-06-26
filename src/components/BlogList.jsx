import { Link } from "react-router";
import { useOrganizerBlog } from "@hooks";

export default function BlogList() {

    const posts = useOrganizerBlog();

    if (posts.length === 0) return (
        <div className="text-sm text-gray-400">No blog posts found.</div>
    );

    return (
        <div className="flex flex-col gap-2">
            {posts.map((post) => (
                <Link key={post.blog_id} to={`/news/${post.blog_id}`} className="text-primary hover:underline">
                    {post.title}
                </Link>
            ))}
        </div>
    );
}

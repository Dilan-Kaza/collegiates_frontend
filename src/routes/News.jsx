import { MtHeader, BlogList } from "@components";

export default function News() {

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6">
                <div className="text-3xl text-secondary font-semibold">News</div>
                <div className="rounded-lg px-6 py-5 flex flex-col gap-4">
                    <BlogList />
                </div>
            </div>
        </>
    );
}

import { MtHeader } from "@components";
import { useParams } from "react-router";

export default function OrganizerGroupsetDetail() {

    const { uuid } = useParams();

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6">
                <div className="text-3xl text-secondary font-semibold">Group Set</div>
            </div>
        </>
    );
}

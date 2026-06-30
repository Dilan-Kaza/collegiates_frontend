import { MtHeader } from "@components";
import { useForwardIfNotOrganizer } from "@hooks";

export default function EventBuilder() {

    useForwardIfNotOrganizer();

    return (
        <>
            <div className="hidden md:block"><MtHeader /></div>
            <div className="max-w-3xl mx-auto w-full px-4 py-8 flex flex-col gap-6">
                <div className="text-3xl text-secondary font-semibold">Event Builder</div>
            </div>
        </>
    );
}

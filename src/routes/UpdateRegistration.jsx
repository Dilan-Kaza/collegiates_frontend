import { MtHeader } from "../components/Headers";
import EventSelection from "../components/EventSelection";
import { useCurrentUser } from "../hooks/userApiHooks";

export default function UpdataRegistration() {
    
    const userinfo = useCurrentUser();

    return (
        <div>
            <MtHeader/>
            <EventSelection registeredEvents={userinfo?.registrations}/>
        </div>
    );
}
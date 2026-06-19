import { use, useState } from "react";
import { Dropdown } from "../components/formComponents";
import { MtHeader } from "../components/headers";

export default function Register() {
    
    const [events, setEvents] = useState([]);
    const [remainingEvents, setRemainingEvents] = useState({"Changquan" : "Changquan","Nanquan":"Nanquan"});
    const [selectedEvent, setSelectedEvent] = useState("");

    const handleChange = (e) =>{
        const { name, value } = e.target;
        setSelectedEvent(value);
    }

    const onAdd = () =>{
        setEvents([...events, selectedEvent]);
        console.log(events);
        setSelectedEvent("");
        const { [selectedEvent]: omitted, ...rest} = remainingEvents;
        setRemainingEvents(rest);
    }

    return (
        <div>
            <MtHeader/>
      
            <div className="bg-off-white">
                {events.map(events => (
                    <div>{events}</div>
                ))}
                <Dropdown
                    label="Add Event"
                    options={remainingEvents}
                    onChange={handleChange}
                    value={selectedEvent}
                />
                <button className="btn btn-primary" onClick={onAdd}>Add</button>
            </div>
        </div>
    );
}
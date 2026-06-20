import { use, useState } from "react";
import { ShortAnswer } from "../components/FormComponents";
import { MtHeader } from "../components/Headers";

export default function Register() {
    
    const [events, setEvents] = useState([]);
    const [remainingEvents, setRemainingEvents] = useState(["Northern Barehand Nandu", "Southern Barehand Nandu", "Northern Barehand", "Southern Barehand", "Northern Staff", "Southern Staff"]);
    const [selectedEvent, setSelectedEvent] = useState("");

    const handleChange = (e) =>{
        const { name, value } = e.target;
        setSelectedEvent(value);
    }

    const onAdd = () => {
        if (selectedEvent == ""){
            return;
        }
        setEvents([...events, {'event_code': selectedEvent, 'nandu_str': ""}]);
        setSelectedEvent("");
        const rest = (remainingEvents => remainingEvents.filter(event => event !== selectedEvent));
        setRemainingEvents(rest);
    }

    const onRemove = (event) => {
        setRemainingEvents([...remainingEvents, event.event_code]);
        const rest = (events => events.filter(e => e.event_code !== event.event_code));
        setEvents(rest);
    }

    const isNandu = (event) =>{
        return event.event_code.includes("Nandu");
    }

    return (
        <div>
            <MtHeader/>
      
            <div className="bg-off-white rounded-lg mx-[10%] px-[10%] py-10">
                <div className="text-4xl text-secondary py-10">
                    Registration
                </div>
                {events.map(event => (
                    <div key={event.event_code} className="flex flex-row rounded-lg border border-gray-300 py-[10px] px-2 items-center">
                        <div className="flex-1 flex-col">
                            <div className="flex mx-4">{event.event_code}</div>
                            {isNandu(event) ? <div className="flex flex-1flex-row flex-nowrap">
                                <div className="flex mx-4">
                                    Nandu Code: 
                                </div>
                                <div className="flex flex-1 border-b">
                                    <input className="w-full" />
                                </div>
                            </div> : <></>}
                        </div>
                        <div className="flex justify-start">
                            <button className="btn btn-circle btn-primary btn-ghost" onClick={()=>onRemove(event)}>x</button>
                        </div>
                    </div>
                ))}
                <div>
                    Add an Event!
                </div>
                <div className="relative flex flex-col gap-2 transition-outline ease-in-out duration-200 border border-gray-300 focus-within:outline-2 focus-within:outline-primary rounded-md py-[10px] px-2">
                    <select
                        onChange={handleChange}
                        value={selectedEvent}>
                        <option value="" disabled hidden></option>
                            {remainingEvents.map((event, index) => (
                                <option value={event} key={index}>
                                    {event}
                                </option>
                            ))}
                    </select>
                </div>
                <div className="flex flex-row">
                    <div className="felx">
                        <button className="btn btn-primary my-4" onClick={onAdd}>Add</button>
                    </div>
                    <div className="flex flex-1"/>
                    <div className="flex">
                        <button className="btn btn-primary my-4">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    );
}
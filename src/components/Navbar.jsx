import { Link, useNavigate } from "react-router";
import { useCurrentUser } from "@hooks";
import { useState, useEffect } from "react";

const tabs = ["Tournament", "Rules", "About"];

function NavBar() {

  const [username,setUsername] = useState("");

  const userInfo = useCurrentUser();

  useEffect(()=>{
    if (userInfo){
      setUsername(userInfo.first_name);
    } else {
      setUsername("");
    }
  },[userInfo]);
  
  const nav = useNavigate();

  return (
    <div className="fixed w-[70%] top-4 left-[15%] p-4 bg-primary text-off-white rounded-lg px-12 z-100">
      <div className="justify-between flex w-full">
        <div className="flex gap-10 items-center">
          
          <Link to="/"><img
                    src="/wushu_logo.png"
                    alt="logo"
                    width={100}
                    height={100}
                    className="object-cover rounded-[2rem]"
                  /></Link>
          {tabs.map((tab) => (
            <Link to={`/${tab.toLowerCase().replace(/\s/g, "")}`} key={tab}>
              {tab}
            </Link>
          ))}
          {userInfo?.user_type === "O" && (
            <Link to="/organizer">Organizer</Link>
          )}
        </div>
        {username ? 
          <button className="btn btn-off-white btn-outline" onClick={()=>nav('/dashboard')}>{username}</button> :
          <button className="btn btn-off-white btn-outline" onClick={()=>nav('/signin')}>Sign In</button>
        }
      </div>
    </div>
  );
}

export { NavBar };

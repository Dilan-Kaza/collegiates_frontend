// import { Geist, Geist_Mono } from "next/font/google";
import { NavBar } from "./Navbar";
import { Outlet, Link } from "react-router";
// import { SuccessNotif, ErrorNotif } from "./Notif";

// const geistSans = Geist({
//   variable: "--font-geist-sans",
//   subsets: ["latin"],
// });

// const geistMono = Geist_Mono({
//   variable: "--font-geist-mono",
//   subsets: ["latin"],
// });

// export const metadata = {
//   title: "Collegiate Wushu",
//   description: "Collegiate Wushu",
// };

export default function Layout() {
  return (<>
          <div
                id="bg-component"
                className="bg-tertiary fixed h-screen w-full absolute -top-[0svh] left-0 -z-20"
            />

            <div className="">
                <NavBar/>
            </div>
            <div
                className="antialiased text-dark font-grotesk lg:w-[80%] lg:translate-x-[12.5%] my-2"
            >
              <Outlet /> 
            </div>


          {/* <SuccessNotif/>
          <ErrorNotif/> */}
          </>
  );
}

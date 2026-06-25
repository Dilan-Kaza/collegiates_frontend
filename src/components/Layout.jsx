// import { Geist, Geist_Mono } from "next/font/google";
import { NavBar } from "./Navbar";
import { Outlet, Link } from "react-router";
import { SuccessNotif, ErrorNotif } from "./Notif";
import NavDock from "./NavDock";
import BackgroundShapes from "./BackgroundShapes";

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
                className="bg-tertiary fixed h-screen w-screen absolute -top-[0svh] left-0 -z-20"
            />
            <BackgroundShapes />

            <div className="hidden md:block">
                <NavBar/>
            </div>
            <div
                className="antialiased text-dark font-grotesk lg:w-[80%] lg:translate-x-[12.5%] my-2"
            >
              <Outlet /> 
            </div>


          <div className="fixed top-0 left-0 right-0 z-[9999] flex flex-col items-center sm:hidden">
            <SuccessNotif/>
            <ErrorNotif/>
          </div>
          <div className="hidden sm:block">
            <SuccessNotif/>
            <ErrorNotif/>
          </div>
          <div className="md:hidden pt-14">
            <NavDock/>
          </div>
          </>
  );
}

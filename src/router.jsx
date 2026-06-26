import React, { useEffect } from "react";
import { useLocation } from "react-router";
import { Layout } from "@components";

function Root() {
  const { pathname } = useLocation();
  useEffect(() => { window.scrollTo(0, 0); }, [pathname]);
  return <Layout />;
}
import { createBrowserRouter } from "react-router";
import {
  Home, Tournament, Rules, About,
  SignIn, Dashboard, Register, SignUp,
  Pdf, Groupset, Organizer, OrganizerGroupset, OrganizerGroupsetDetail,
} from "@routes";


const routes = [
    {
        path: "/",
        element: <Root />,
        children : [
            {
                path: "/",
                element: <Home/>
            },
            {
                path: "/tournament",
                element: <Tournament/>
            },
            {
                path: "/rules",
                element: <Rules/>
            },
            {
                path: "/about",
                element: <About/>
            },
            {
                path: "/signin",
                element: <SignIn/>
            },
            {
                path: "/dashboard",
                element: <Dashboard/>
            },
            {
                path: "/register",
                element: <Register/>
            },
            {
                path: "/groupset",
                element: <Groupset/>
            },
            {
                path: "/signup",
                element: <SignUp/>
            },
            {
                path: "/rules/collegiates",
                element: <Pdf src="/documents/2019collegiaterules.pdf"/>
            },
            {
                path: "/rules/uswu",
                element: <Pdf src="/documents/USWURulebook2002.pdf"/>
            },
            {
                path: "/rules/uswuaddendum",
                element: <Pdf src="/documents/document.pdf"/>
            },
            {
                path: "/rules/iwuf",
                element: <Pdf src="/documents/iwuf_rules_taolu_2005.pdf"/>
            },
            {
                path: "/organizer",
                element: <Organizer/>
            },
            {
                path: "/organizer/groupset",
                element: <OrganizerGroupset/>
            },
            {
                path: "/organizer/groupset/:uuid",
                element: <OrganizerGroupsetDetail/>
            },
        ],
    },
];

const router = createBrowserRouter(routes);

export default router;
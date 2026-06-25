'use client'; 

import React, { useEffect } from "react";
import { useLocation } from "react-router";
import Layout from "./components/Layout";

function Root() {
  const { pathname } = useLocation();
  useEffect(() => { window.scrollTo(0, 0); }, [pathname]);
  return <Layout />;
}
import Home from "./routes/Home";
import Tournament from "./routes/Tournament";
import Rules from "./routes/Rules";
import About from "./routes/About";
import { createBrowserRouter, RouterProvider } from "react-router";
import SignIn from "./routes/SignIn";
import Dashboard from "./routes/Dashboard";
import Register from "./routes/Register";
import Signup from "./routes/SignUp";
import Pdf from "./routes/Pdf";
import UpdataRegistration from "./routes/UpdateRegistration";


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
                path: "/updateregistration",
                element: <UpdataRegistration/>
            },
            {
                path: "/signup",
                element: <Signup/>
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
        ],
    },
];

const router = createBrowserRouter(routes);

export default function App() {
    return (<RouterProvider router={router}/>);
}
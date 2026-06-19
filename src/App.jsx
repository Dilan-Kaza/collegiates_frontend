'use client'; 

import React from "react";
import Layout from "./components/Layout";
import Home from "./routes/Home";
import Tournament from "./routes/Tournament";
import Rules from "./routes/Rules";
import About from "./routes/About";
import { createBrowserRouter, RouterProvider } from "react-router";
import SignIn from "./routes/SignIn";
import Dashboard from "./routes/Dashboard";
import Register from "./routes/Register";
import Signup from "./routes/SignUp";


const routes = [
    {
        path: "/",
        element: <Layout />,
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
            },{
                path: "/dashboard",
                element: <Dashboard/>
            },{
                path: "/register",
                element: <Register/>
            },{
                path: "/signup",
                element: <Signup/>
            },
        ],
    },
];

const router = createBrowserRouter(routes);

export default function App() {
    return (<RouterProvider router={router}/>);
}
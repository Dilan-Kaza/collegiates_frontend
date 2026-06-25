"use client"

import { clearSuccessMsg, clearErrorMsg } from "@slices";
import { useSelector, useDispatch } from "react-redux";



function SuccessNotif() {

    const dispatch = useDispatch();
    const success = useSelector(state => state.success.message);


    return (
        <>
            {success ?
                <div className="toast">
                    <div className="alert alert-success">
                        <span>{success}</span>
                        <button className="btn btn-success btn-circle" onClick={()=>dispatch(clearSuccessMsg())}>X</button>
                    </div>
                </div>
            : <></>}
        </>
    )
};

function ErrorNotif() {

    const dispatch = useDispatch();
    const error = useSelector(state => state.error.message);


    return (
        <>
            {error ?
                <div className="toast">
                    <div className="alert alert-error">
                        <span>{error}</span>
                        <button className="btn btn-error btn-circle" onClick={()=>dispatch(clearErrorMsg())}>X</button>
                    </div>
                </div>
            : <></>}
        </>
    )
};

export {SuccessNotif, ErrorNotif};
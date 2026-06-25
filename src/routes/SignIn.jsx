import { AuthPanel, ShortAnswer, MtHeader } from "@components";
import { useState } from "react";
import { axiosApi } from "@axios/axios";
import { useCsrf, useForwardDashboard } from "@hooks";
import { setJwt, setSuccessMsg, setLoginStatus } from "@slices";
import { useNavigate } from "react-router";
import { validate, handleFormBlur, handleFormChange } from "@handlers/forms";
import { useDispatch } from "react-redux";

export default function SignIn() {
  
  const [formData, setFormData] = useState({});
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const dispatch = useDispatch();
  const nav = useNavigate();

  const handleChange = handleFormChange(setFormData, setErrors);

  const handleBlur = handleFormBlur(setErrors);


  const handleSubmit = async (e) => {
    e.preventDefault();

    const requiredFields = ["email", "password"];

    const allErrors = {};
    requiredFields.forEach((name) => {
      const error = validate(name, formData[name]);
      if (error) allErrors[name] = error;
    });

    if (Object.keys(allErrors).length > 0) {
      setErrors(allErrors);
      return;
    }

    setLoading(true);
    
    const payload = {
        ...formData,
        grad_date: formData.grad_date ? `${formData.grad_date}-01` : ""
      };

    axiosApi
        .post("/auth/jwt/create/", payload, {
          mode: "cors",
          withCredentials: true,
          credentials: "include",
        })
        .then((res)=>{
          dispatch(setJwt(res.data.access));
          setError("");
          document.cookie = 'refresh=' + res.data.refresh;
          dispatch(setSuccessMsg("Sign In Succsessful"))
          dispatch(setLoginStatus(true))
        })
        .catch((err)=>{
          setError(err.response?.data?.detail? err.response.data.detail : "Sign In failed");
        });
    setLoading(false);
  };

  useCsrf();
  useForwardDashboard();

  return (
    <>
      <MtHeader/>
      <div
        id="bg-component"
        className="bg-secondary h-screen w-full skew-y-6 absolute -top-[50svh] left-0 -z-20"
      ></div>
      <AuthPanel
        bottomLink="Sign Up"
        bottomLabel="Don't have an account? "
        onSubmit={handleSubmit}
        title="Sign In"
      >
        {error && <div className="text-red-500 mb-4">{error}</div>}
        <ShortAnswer
          type="email"
          name="email"
          label="Email*"
          onChange={handleChange}
          onBlur={handleBlur}
          value={formData.email || ""}
          required
        />
        {errors.email && <div className="text-red-500 mb-4">Invalid email address</div>}
        <ShortAnswer
          type="password"
          name="password"
          label="Password*"
          onChange={handleChange}
          value={formData.password || ""}
          required
        />
        <div className="flex">
          <div className="flex-col flex-1"></div>
          <div className="flex-box">
            <button 
              onClick={handleSubmit}
              type="submit"
              disabled={loading}
              className="btn btn-primary">
              {loading ? "Signing in..." : "Sign In"}
            </button>
          </div>
        </div>
      </AuthPanel>
    </>
  );
}

import { MtHeader, SignUpMobile, SignUpDesktop } from "@components";
import { useState } from "react";
import { axiosApi } from "@axios/axios";
import { useCsrf, useColleges, useForwardDashboard } from "@hooks";
import { useNavigate } from "react-router";
import { useDispatch } from "react-redux";
import { setSuccessMsg } from "@slices";
import { validate, handleFormBlur, handleFormChange } from "@handlers/forms";


export default function SignUp() {
  // choices mirror the enums defined in models.py
  const skillLevels = { Beginner: "B", Intermediate: "I", Advanced: "A" };
  const genderChoices = { Male: "M", Female: "F" };
  const studentTypes = {
    "Full/Part-Time Undergraduate Student": "1",
    "Full-Time Graduate/Professional School Student": "2",
    "Early Graduate Of Current Year": "3",
    "Non-Enrolled Student": "4",
    "One Year Alumni": "5",
    "Part-Time Graduate Student": "6",
    "International Student": "7",
  };

  const nav = useNavigate();

  const [formData, setFormData] = useState({});
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const [errors, setErrors] = useState({});

  const dispatch = useDispatch();

  const checkEmailExists = async (email) => {
    if (!email || !/\S+@\S+\.\S+/.test(email)) return;
    try {
      const res = await fetch(`http://localhost:8000/collegiates_app/check-email/?email=${encodeURIComponent(email)}`, {
        mode: "cors",
        credentials: "include",
      });
      const data = await res.json();
      if (data.exists) {
        setErrors((prev) => ({ ...prev, email: "An account with this email already exists" }));
      }
    } catch (err) {
      console.warn("Could not check email", err);
    }
  };

  const handleChange = handleFormChange(setFormData,setErrors);
  const handleBlur = handleFormBlur(setErrors, formData);

  const handleEmailBlur = (e) => {
    const { name, value } = e.target;
            setErrors((prevErrors) => ({
                ...prevErrors,
                [name]: validate(name, value),
            }));
    if (name === "email") checkEmailExists(value);
  };

  useCsrf();
  useForwardDashboard();
  const colleges = useColleges();


  const handleSubmit = async (e) => {
    e.preventDefault();

    const requiredFields = ["email", "password", "re_password", "first_name", "last_name", "first_comp", "grad_date", "skill_level", "school", "gender", "student_type"];

    const allErrors = {};
    requiredFields.forEach((name) => {
      const error = validate(name, formData[name], formData);
      if (error) allErrors[name] = error;
    });

    if (Object.keys(allErrors).length > 0) {
      setErrors(allErrors);
      return;
    }

    setLoading(true);

    // Prepare JSON payload
    const payload = {
      ...formData,
      grad_date: formData.grad_date ? `${formData.grad_date}-01` : ""
    };

    axiosApi
        .post("/auth/users/", payload, {
        mode: "cors",
        withCredentials: true,
        credentials: "include",
      })
        .then((res)=>{
          // console.log("Registration successful");
          setError("");
          dispatch(setSuccessMsg("Account created successfully"));
          nav('/signin'); 

      })
        .catch((err)=>{
          console.log("Status:", err.status);
          console.log("Full error response:", JSON.stringify(err.response.data, null, 2));
          
          // Handle field-specific errors from DRF serializer
          if (err.response.data) {
            // Transform DRF error format to match your state structure
            const transformedErrors = {};
            Object.entries(err.response.data).forEach(([field, messages]) => {
              // DRF returns arrays of error messages, take the first one
              transformedErrors[field] = Array.isArray(messages) ? messages[0] : messages;
            });
            setErrors(transformedErrors);
          }
          
          setError(err.response?.data? "Please fix the errors below" : "Registration failed");
        });
    setLoading(false);
  };


  return (
    <div className="overflow-x-hidden min-h-screen">
      <div className="hidden sm:block"><MtHeader/></div>
      <div
        id="bg-component"
        className="bg-primary h-screen w-full skew-y-10 absolute -top-[60svh] left-0 -z-20"
      ></div>
      <div className="sm:hidden mx-4">
        <SignUpMobile
          formData={formData} errors={errors} error={error} loading={loading}
          colleges={colleges} skillLevels={skillLevels} genderChoices={genderChoices} studentTypes={studentTypes}
          handleChange={handleChange} handleBlur={handleBlur} handleEmailBlur={handleEmailBlur} handleSubmit={handleSubmit}
        />
      </div>
      <div className="hidden sm:block">
        <SignUpDesktop
          formData={formData} errors={errors} error={error} loading={loading}
          colleges={colleges} skillLevels={skillLevels} genderChoices={genderChoices} studentTypes={studentTypes}
          handleChange={handleChange} handleBlur={handleBlur} handleEmailBlur={handleEmailBlur} handleSubmit={handleSubmit}
        />
      </div>
    </div>
  );
}
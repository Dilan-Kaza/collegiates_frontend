import { AuthPanel, DatePicker, Dropdown, ShortAnswer } from "@components";

export default function SignUpMobile({ formData, errors, error, loading, colleges, skillLevels, genderChoices, studentTypes, handleChange, handleBlur, handleEmailBlur, handleSubmit }) {
  return (
    <AuthPanel
      bottomLabel="Already have an account? "
      bottomLink="Sign In"
      onSubmit={handleSubmit}
      title="Create an Account"
    >
      {error && <div className="text-red-500 mb-4">{error}</div>}
      <ShortAnswer type="email" name="email" label="Email*" onChange={handleChange} onBlur={handleEmailBlur} value={formData.email || ""} required />
      {errors.email && <p className="text-red-500 text-sm -mt-2">{errors.email}</p>}
      <ShortAnswer type="password" name="password" label="Password*" minLength={8} onChange={handleChange} onBlur={handleBlur} value={formData.password || ""} required />
      {errors.password && <p className="text-red-500 text-sm -mt-2">{errors.password}</p>}
      <ShortAnswer type="password" name="re_password" label="Confirm Password*" minLength={8} onChange={handleChange} onBlur={handleBlur} value={formData.re_password || ""} required />
      {errors.re_password && <p className="text-red-500 text-sm -mt-2">{errors.re_password}</p>}
      <ShortAnswer type="text" name="first_name" label="First Name*" onChange={handleChange} onBlur={handleBlur} value={formData.first_name || ""} required />
      {errors.first_name && <p className="text-red-500 text-sm -mt-2">{errors.first_name}</p>}
      <ShortAnswer type="text" name="last_name" label="Last Name*" onChange={handleChange} onBlur={handleBlur} value={formData.last_name || ""} required />
      {errors.last_name && <p className="text-red-500 text-sm -mt-2">{errors.last_name}</p>}
      <ShortAnswer label="First Competition Year*" type="number" name="first_comp" min="1900" max="9999" onChange={handleChange} onBlur={handleBlur} value={formData.first_comp || ""} required />
      {errors.first_comp && <p className="text-red-500 text-sm -mt-2">{errors.first_comp}</p>}
      <DatePicker label="Graduation Date*" name="grad_date" onChange={handleChange} onBlur={handleBlur} value={formData.grad_date || ""} required />
      {errors.grad_date && <p className="text-red-500 text-sm -mt-2">{errors.grad_date}</p>}
      <Dropdown options={skillLevels} label="Experience Level*" name="skill_level" onChange={handleChange} onBlur={handleBlur} value={formData.skill_level || ""} required />
      {errors.skill_level && <p className="text-red-500 text-sm -mt-2">{errors.skill_level}</p>}
      <Dropdown options={colleges} label="College*" name="school" onChange={handleChange} onBlur={handleBlur} value={formData.school || ""} required />
      {errors.school && <p className="text-red-500 text-sm -mt-2">{errors.school}</p>}
      <Dropdown options={genderChoices} label="Gender*" name="gender" onChange={handleChange} onBlur={handleBlur} value={formData.gender || ""} required />
      {errors.gender && <p className="text-red-500 text-sm -mt-2">{errors.gender}</p>}
      <Dropdown options={studentTypes} label="Student Type*" name="student_type" onChange={handleChange} onBlur={handleBlur} value={formData.student_type || ""} required />
      {errors.student_type && <p className="text-red-500 text-sm -mt-2">{errors.student_type}</p>}
      <button onClick={handleSubmit} type="submit" disabled={loading} className="btn btn-block btn-primary">
        {loading ? "Signing up..." : "Submit"}
      </button>
    </AuthPanel>
  );
}

import { AuthPanelWide, DatePicker, Dropdown, ShortAnswer } from "@components";

export default function SignUpDesktop({ formData, errors, error, loading, colleges, skillLevels, genderChoices, studentTypes, handleChange, handleBlur, handleEmailBlur, handleSubmit }) {
  return (
    <AuthPanelWide
      bottomLabel="Already have an account? "
      bottomLink="Sign In"
      onSubmit={handleSubmit}
      title="Create an Account"
    >
      <div className="flex row gap-15">
        <div className="flex flex-col flex-1 gap-4">
          {error && <div className="text-red-500 mb-4">{error}</div>}
          <ShortAnswer type="email" name="email" label="Email*" onChange={handleChange} onBlur={handleEmailBlur} value={formData.email || ""} required />
          {errors.email && <p className="text-red-500 text-sm -mt-2">{errors.email}</p>}
          <ShortAnswer type="password" name="password" label="Password*" minLength={8} onChange={handleChange} onBlur={handleBlur} value={formData.password || ""} required />
          {errors.password && <p className="text-red-500 text-sm -mt-2">{errors.password}</p>}
          <ShortAnswer type="password" name="re_password" label="Confirm Password*" minLength={8} onChange={handleChange} onBlur={handleBlur} value={formData.re_password || ""} required />
          {errors.re_password && <p className="text-red-500 text-sm -mt-2">{errors.re_password}</p>}
        </div>
        <div className="flex flex-col flex-1 gap-4">
          <div className="flex gap-4">
            <div className="flex flex-col flex-1">
              <ShortAnswer type="text" name="first_name" label="First Name*" onChange={handleChange} onBlur={handleBlur} value={formData.first_name || ""} required />
              {errors.first_name && <p className="text-red-500 text-sm mt-1">{errors.first_name}</p>}
            </div>
            <div className="flex flex-col flex-1">
              <ShortAnswer type="text" name="last_name" label="Last Name*" onChange={handleChange} onBlur={handleBlur} value={formData.last_name || ""} required />
              {errors.last_name && <p className="text-red-500 text-sm mt-1">{errors.last_name}</p>}
            </div>
          </div>
          <div className="flex justify-between gap-4">
            <div className="flex flex-col flex-1">
              <ShortAnswer label="First Competition Year*" type="number" name="first_comp" min="1900" max="9999" onChange={handleChange} onBlur={handleBlur} value={formData.first_comp || ""} className="w-40" required />
              {errors.first_comp && <p className="text-red-500 text-sm mt-1">{errors.first_comp}</p>}
            </div>
            <div className="flex flex-col flex-1">
              <DatePicker label="Graduation Date*" name="grad_date" onChange={handleChange} onBlur={handleBlur} value={formData.grad_date || ""} className="w-40" required />
              {errors.grad_date && <p className="text-red-500 text-sm mt-1">{errors.grad_date}</p>}
            </div>
          </div>
          <Dropdown options={skillLevels} label="Experience Level*" name="skill_level" onChange={handleChange} onBlur={handleBlur} value={formData.skill_level || ""} required />
          {errors.skill_level && <p className="text-red-500 text-sm -mt-2">{errors.skill_level}</p>}
          <Dropdown options={colleges} label="College*" name="school" onChange={handleChange} onBlur={handleBlur} value={formData.school || ""} required />
          {errors.school && <p className="text-red-500 text-sm -mt-2">{errors.school}</p>}
          <div className="flex justify-between gap-2">
            <div className="flex flex-col flex-1">
              <Dropdown options={genderChoices} label="Gender*" name="gender" onChange={handleChange} onBlur={handleBlur} value={formData.gender || ""} required />
              {errors.gender && <p className="text-red-500 text-sm mt-1">{errors.gender}</p>}
            </div>
            <div className="flex flex-col w-48">
              <Dropdown options={studentTypes} label="Student Type*" name="student_type" onChange={handleChange} onBlur={handleBlur} value={formData.student_type || ""} required />
              {errors.student_type && <p className="text-red-500 text-sm mt-1">{errors.student_type}</p>}
            </div>
          </div>
        </div>
      </div>
      <div className="content-center">
        <button onClick={handleSubmit} type="submit" disabled={loading} className="btn btn-block btn-primary">
          {loading ? "Signing up..." : "Submit"}
        </button>
      </div>
    </AuthPanelWide>
  );
}

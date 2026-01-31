require "ostruct"

module Patients
  class PatientService
    def self.register(patient_params)
      patient = Patient.new(patient_params)

      if patient.success?
        token = JasonWebToken.encode(user_id: patient.id)
        OpenStruct.new(
          user: user,
          token: token,
          success: true
        )
      else
        OpenStruct.new(
          success: false,
          error: patient.errors
        )
      end
    end
  end
end

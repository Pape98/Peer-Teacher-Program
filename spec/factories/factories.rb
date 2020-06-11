FactoryBot.define do
  factory :applicant do
    id {1}
    first_name {"John"}
    last_name {"Smith"}
    email {"jsmith@tamu.edu"}
    phone_number {"8234569969"}
    uin {"932008332"}
    graduation_date {"2020"}
    gpa {"3.0"}
    major {"Computer Science"}
    comment {"None"}
    status {1}
    resume {"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing"}
    transcript {"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing"}
    schedule {"https://drive.google.com/file/d/1C2bJJV3Ai2VcF4cuPtxGt-KcVK_EYCFr/view?usp=sharing"}
  end
end

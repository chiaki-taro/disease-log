crumb :root do
  link "Home", root_path
end

crumb :patients do |user|
  link "#{user.user_name}さんの患者一覧", user_patients_path(user)
  parent :root
end

crumb :patient_show do |user, patient|
  link "#{patient.patient_name}さん", user_patient_path(user, patient)
  parent :patients, user
end

crumb :patient_new do |user|
  link "患者登録", new_user_patient_path(user)
  parent :patients, user
end

crumb :patient_edit do |user, patient|
  link "#{patient.patient_name}さんの編集", edit_user_patient_path(user, patient)
  parent :patient_show, user, patient
end

crumb :disease_new do |user, patient|
  link "#{patient.patient_name}さんの疾患登録", new_user_patient_disease_path(user, patient)
  parent :patient_show, user, patient
end

crumb :disease_show do |user, patient, disease|
  link "#{disease.disease_name}", user_patient_disease_path(user, patient, disease)
  parent :patient_show, user, patient
end


crumb :disease_edit do |user, patient, disease|
  link "#{disease.disease_name}編集", edit_user_patient_disease_path(user, patient, disease)
  parent :disease_show, user, patient, disease
end

crumb :symptom_new do |user, patient, disease|
  link "症状を入力", new_user_patient_disease_symptom_path(user, patient, disease)
  parent :disease_show, user, patient, disease
end

crumb :symptom_edit do |user, patient, disease, symptom|
  link "#{symptom.symptoms}を編集", edit_user_patient_disease_symptom_path(user, patient, disease, symptom)
  parent :disease_show, user, patient, disease
end
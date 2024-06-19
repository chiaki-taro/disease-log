require 'rails_helper'

RSpec.describe Disease, type: :model do
  before do
    @patient = FactoryBot.create(:patient)
    @disease = FactoryBot.build(:disease, patient_id: @patient.id)
  end

  describe '疾患新規登録' do
    context '疾患新規登録できる場合' do
      it '正常に登録できる' do
        expect(@disease).to be_valid
      end

      it '発症日時を登録していれば登録できる' do
        @disease.date_of_onset = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
        expect(@disease).to be_valid
      end

      it 'ステータスを観察中・観察終了のいずれかを選択していれば登録できる' do
        @disease.status_id = 1
        expect(@disease).to be_valid
      end
    end

    context '疾患新規登録出来ない時' do
      it 'patient_idが空だと保存できない' do
        @disease.patient_id = nil
        @disease.valid?
        expect(@disease.errors.full_messages).to include("Patient must exist")
      end

      it '病名が空では登録できない' do
        @disease.disease_name = ''
        @disease.valid?
        expect(@disease.errors.full_messages).to include("Disease name can't be blank")
      end

      it '発症日が空だと登録できない' do
        @disease.date_of_onset = ''
        @disease.valid?
        expect(@disease.errors.full_messages).to include("Date of onset can't be blank")
      end

      it 'ステータスが---だと登録できない' do
        @disease.status_id = 0
        @disease.valid?
        expect(@disease.errors.full_messages).to include("Status can't be blank")
      end
    end
  end
end

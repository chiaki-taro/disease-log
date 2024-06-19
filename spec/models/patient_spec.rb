require 'rails_helper'

RSpec.describe Patient, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @patient = FactoryBot.build(:patient, user_id: @user.id)
  end

  describe '患者新規登録' do
    context '患者新規登録できる場合' do
      it '正常に登録できる' do
        expect(@patient).to be_valid
      end

      it '性別が女性・男性・その他のいずれかを選択していれば登録できる' do
        @patient.sex_id = 1
        expect(@patient).to be_valid
      end
    end

    context '患者新規登録出来ない時' do
      it 'user_idが空だと保存できない' do
        @patient.user_id = nil
        @patient.valid?
        expect(@patient.errors.full_messages).to include("User must exist")
      end

      it 'patient_nameが空では登録できない' do
        @patient.patient_name = ''
        @patient.valid?
        expect(@patient.errors.full_messages).to include("Patient name can't be blank")
      end

      it '性別が空だと登録できない' do
        @patient.sex_id = 0
        @patient.valid?
        expect(@patient.errors.full_messages).to include("Sex can't be blank")
      end

      it '誕生日が空だと登録できない' do
        @patient.birthday = ''
        @patient.valid?
        expect(@patient.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

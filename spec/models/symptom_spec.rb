require 'rails_helper'

RSpec.describe Symptom, type: :model do
  before do
    @disease = FactoryBot.create(:disease)
    @symptom = FactoryBot.build(:symptom, disease_id: @disease.id)
  end

  describe '症状新規登録' do
    context '症状新規登録できる場合' do
      it '正常に登録できる' do
        expect(@symptom).to be_valid
      end

      it '症状の強さが１〜５のいずれかを選択していれば登録できる' do
        @symptom.level_id = 1
        expect(@symptom).to be_valid
      end

      it 'treatmentが空でも登録できる' do
        @symptom.treatment = nil
        expect(@symptom).to be_valid
      end

      it 'evaluationが空でも登録できる' do
        @symptom.evaluation = nil
        expect(@symptom).to be_valid
      end

      it 'memoが空でも登録できる' do
        @symptom.memo = nil
        expect(@symptom).to be_valid
      end
    end

    context '症状新規登録出来ない時' do
      it 'disease_idが空だと保存できない' do
        @symptom.disease_id = nil
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Disease must exist")
      end

      it 'symptomsが空では登録できない' do
        @symptom.symptoms = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Symptoms can't be blank")
      end

      it 'timeが空だと登録できない' do
        @symptom.time = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Time can't be blank")
      end

      it '症状の強さが---だと登録できない' do
        @symptom.level_id = 0
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Level can't be blank")
      end
    end
  end
end

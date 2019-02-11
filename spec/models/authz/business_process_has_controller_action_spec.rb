module Authz
  RSpec.describe BusinessProcessHasControllerAction, type: :model do

    describe 'DB indexes' do
      it 'should have a composite unique index bp_ca' do
        expect(
          ActiveRecord::Migration.index_exists?(described_class.table_name,
                                                [:authz_business_process_id, :authz_controller_action_id],
                                                unique: true)
        ).to be true
      end
    end

    describe 'Associations' do
      it { should belong_to(:controller_action) }
      it { should belong_to(:business_process).touch(true) }
    end

    describe 'validations' do
      it { should validate_presence_of(:controller_action).with_message(:required) }
      it { should validate_presence_of(:business_process).with_message(:required) }
      it do
        bphca = create(:authz_business_process_has_controller_action)
        expect(bphca).to validate_uniqueness_of(:authz_controller_action_id).scoped_to(:authz_business_process_id)
      end
    end

  end
end

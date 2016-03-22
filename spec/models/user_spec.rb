require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_db_coloumn :name }
  it { is_expected.to have_db_coloumn :email }
  it { is_expected.to have_db_coloumn :password }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:email) }

  end

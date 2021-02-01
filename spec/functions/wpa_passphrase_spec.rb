require 'spec_helper'

describe 'wifi::wpa_passphrase' do
  it { is_expected.to run.with_params('Rocketjump GGGGG', '4 words all uppercase').and_return('992ae6a85385d87ffc9abed0da50f584eb13ba9ff9abf2c7eeedf53ef737aefd') }
  it { is_expected.to run.with_params('Rocketjump Five Gee', 'four words all uppercase').and_return('fab9446327e36ff59d0b034a07f70408b320139c3e899144590ba10d1f506ce4') }
  it { is_expected.to run.with_params('Rocketjump 5 and then the letter G', 'FOUR WORDS').and_return('12c59c191e1e7e26ab69e395ec8ed99c37abd57834193d963eb6840a0ece9414') }
  it { is_expected.to run.with_params('Rocketjump 5, Gee!', '4 WORDS ALL UPPERCASE').and_return('83ebb725383a9e42097b585df09ac46e19e284196a99320616e047788abfe765') }
  it { is_expected.to run.with_params('Rocketjump Eff Aiye Vee Ee Gee', 'FOURWORDS').and_return('978ed9c95f045ded9fa0e0cbfc5bc2794ccfba0cf8d2c037e3937d0412148614') }
  it { is_expected.to run.with_params('Rocket, Jump 5, G', 'fourwordsalluppercase').and_return('ecfe115f5168d10c34eccff3e314145aedf429902ae3617d43769ec7764bdbff') }
  it { is_expected.to run.with_params('The One That Says 5G', '4wordsalluppercase').and_return('9f54e9b2859c1c251ca9e0942aa837ddff12fd4dee065d69800e6c2534fc9f7b') }
  it { is_expected.to run.with_params('Public Wi-Fi', :undef).and_return(:undef) }
end

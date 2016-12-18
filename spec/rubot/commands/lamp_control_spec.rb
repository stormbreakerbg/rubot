RSpec.describe Rubot::Commands::LampControl do
  shared_examples_for 'a lamp switch command' do |command, light_ids, switch_on|
    it "handles `#{command}` as #{switch_on ? 'on' : 'off'} switch of #{light_ids}" do
      lamp_updates = light_ids.map { |id| [id, switch_on] }.to_h
      expect(Rubot::LampControlService).to receive(:set).with(lamp_updates)

      i_am 'gangelov', 'gangelov@asteasolutions.com'
      ask command
      expect_ok_answer
    end
  end

  it_behaves_like 'a lamp switch command', 'светни в Берлин', [20, 21], true
  it_behaves_like 'a lamp switch command', 'светни в ПАРИЖ', [5], true
  it_behaves_like 'a lamp switch command', 'пусни лампите в Ню Йорк', [22, 23], true
  it_behaves_like 'a lamp switch command', 'светни ми в София', [0, 1, 2, 3, 4], true
  it_behaves_like 'a lamp switch command', 'светни лампите в София', [0, 1, 2, 3, 4], true
  it_behaves_like 'a lamp switch command', 'светни на терасата', [28, 29], true
  it_behaves_like 'a lamp switch command', 'светни на балкона', [28, 29], true
  it_behaves_like 'a lamp switch command', 'светни на балкона!', [28, 29], true
  it_behaves_like 'a lamp switch command', 'светни на балкона.', [28, 29], true

  it_behaves_like 'a lamp switch command', 'угаси в Берлин', [20, 21], false
  it_behaves_like 'a lamp switch command', 'спри лампите в ПАРИЖ', [5], false
  it_behaves_like 'a lamp switch command', 'изгаси лампите в Ню Йорк', [22, 23], false
  it_behaves_like 'a lamp switch command', 'изгаси ми в София', [0, 1, 2, 3, 4], false
  it_behaves_like 'a lamp switch command', 'спри ми лампите в София', [0, 1, 2, 3, 4], false
  it_behaves_like 'a lamp switch command', 'изключи лампите на терасата', [28, 29], false
  it_behaves_like 'a lamp switch command', 'изключи на балкона', [28, 29], false
  it_behaves_like 'a lamp switch command', 'изключи на балкона!', [28, 29], false
  it_behaves_like 'a lamp switch command', 'изключи на балкона.', [28, 29], false
end
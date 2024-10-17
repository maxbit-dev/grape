# frozen_string_literal: true

RSpec.shared_examples 'deprecated class' do
  subject { deprecated_class.new }

  around do |example|
    old_deprec_behavior = Grape.deprecator.behavior
    Grape.deprecator.behavior = :raise
    example.run
    Grape.deprecator.behavior = old_deprec_behavior
  end

  it 'raises an Grape.deprecatorException' do
    expect { subject }.to raise_error(Grape.deprecatorException)
  end
end

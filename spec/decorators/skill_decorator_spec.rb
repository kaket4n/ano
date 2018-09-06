require 'spec_helper'

describe SkillDecorator do
  let(:skill) { Skill.new.extend SkillDecorator }
  subject { skill }
  it { should be_a Skill }
end

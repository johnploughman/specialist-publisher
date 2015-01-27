require "spec_helper"
require "spec/exporters/formatters/abstract_indexable_formatter_spec"
require "spec/exporters/formatters/abstract_specialist_document_indexable_formatter_spec"
require "formatters/countryside_stewardship_grant_indexable_formatter"

RSpec.describe CountrysideStewardshipGrantIndexableFormatter do
  let(:document) {
    double(
    :countryside_stewardship_grant,
    body: double,
    slug: double,
    summary: double,
    title: double,
    updated_at: double,
    minor_update?: false,
    )
  }

  subject(:formatter) { CountrysideStewardshipGrantIndexableFormatter.new(document) }

  it_should_behave_like "a specialist document indexable formatter"

  it "should have a type of countryside_stewardship_grant" do
    expect(formatter.type).to eq("countryside_stewardship_grant")
  end
end
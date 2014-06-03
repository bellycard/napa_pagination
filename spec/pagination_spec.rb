require 'spec_helper'
require 'active_record'
require 'hashie'
require 'napa_pagination/pagination'

describe NapaPagination::Pagination do
  context '#to_h' do
    it 'returns all pagination attributes that the object responds to' do
      object = Hashie::Mash.new(
        current_page: 2,
        limit_value: 25,
        total_pages: 10,
        total_count: 248
      )

      data = NapaPagination::Pagination.new(object)
      expect(data.to_h[:page]).to be(2)
      expect(data.to_h[:per_page]).to be(25)
      expect(data.to_h[:total_pages]).to be(10)
      expect(data.to_h[:total_count]).to be(248)
    end

    it 'skips an attribute if the object does not respond to it' do
      object = Hashie::Mash.new(
        current_page: 2,
        limit_value: 25
      )

      data = NapaPagination::Pagination.new(object)
      expect(data.to_h[:page]).to be(2)
      expect(data.to_h[:per_page]).to be(25)
      expect(data.to_h[:total_pages]).to be_nil
      expect(data.to_h[:total_count]).to be_nil
    end
  end
end

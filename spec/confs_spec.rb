require 'spec_helper'

describe Confs do
  subject { Confs::Client.new }

  describe 'speakers' do
    it 'returns the speakers list' do
      expect(subject.speakers.count).to eq 15
    end
  end

  describe 'sponsors' do
    it 'returns the sponsors list' do
      expect(subject.sponsors.count).to eq 6
    end
  end

  describe 'posts' do
    it 'returns the posts list' do
      expect(subject.posts.count).to eq 14
    end
  end

  describe 'job_offers' do
    it 'returns the job offers list' do
      expect(subject.job_offers.count).to eq 3
    end
  end

  describe 'events' do
    it 'returns the events list' do
      expect(subject.events.count).to eq 26
    end
  end

  describe 'talks' do
    it 'returns the talks list' do
      expect(subject.talks.count).to eq 15
    end
  end

  describe 'workshops' do
    it 'returns the workshops list' do
      expect(subject.workshops.count).to eq 7
    end
  end
end

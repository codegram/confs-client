require 'spec_helper'

describe Confs do
  subject { Confs::Client.new }

  describe 'speakers' do
    it 'returns the speakers list' do
      subject.speakers.count.should eq 13
    end
  end

  describe 'sponsors' do
    it 'returns the sponsors list' do
      subject.sponsors.count.should eq 0
    end
  end

  describe 'posts' do
    it 'returns the posts list' do
      subject.posts.count.should eq 7
    end
  end

  describe 'job_offers' do
    it 'returns the job offers list' do
      subject.job_offers.count.should eq 0
    end
  end

  describe 'events' do
    it 'returns the events list' do
      subject.events.count.should eq 24
    end
  end

  describe 'talks' do
    it 'returns the talks list' do
      subject.talks.count.should eq 13
    end
  end

  describe 'workshops' do
    it 'returns the workshops list' do
      subject.workshops.count.should eq 7
    end
  end
end

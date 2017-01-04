require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  let(:card1) { double("card1", suit: :diamond, value: 2) }
  let(:card2) { double("card2", suit: :diamond, value: 3) }
  let(:card3) { double("card3", suit: :diamond, value: 4) }
  let(:card4) { double("card4", suit: :diamond, value: 5) }
  let(:card5) { double("card5", suit: :diamond, value: 6) }

  describe '#initialize' do
    it 'initializes hand as an empty array' do
      expect(hand.hand).to eq([])
    end
  end

  # describe '#hand_cards_value' do #TODO do it lter
  #   let(:card1) { double("card1", suit: :diamond, value: 2) }
  #   let(:card2) { double("card2", suit: :diamond, value: 3) }
  #   let(:card3) { double("card3", suit: :diamond, value: 4) }
  #   let(:card4) { double("card4", suit: :diamond, value: 5) }
  #   let(:card5) { double("card5", suit: :diamond, value: 6) }
  #
  #   # before(:each) do
  #   #   cards = [card1, card2, card3, card4, card5]
  #   #   expected_result = cards.map { |card| card.value }
  #   #   cards.each { |card| hand.add_card(card) }
  #   # end
  #
  #   it 'returns an array of the hands values' do
  #     cards = [card1, card2, card3, card4, card5]
  #     expected_result = cards.map { |card| card.value }
  #     cards.each { |card| hand.add_card(card) }
  #
  #     expect(hand.hand_cards_value).to eq(expected_result)
  #   end
  # end
  context do
    before(:each) do
      cards = [card1, card2, card3, card4, card5]
      cards.each { |card| hand.add_card(card) }
    end

    describe '#hand_cards_suit' do
      it 'should return an array of all suits' do
        expected_result = hand.hand.map { |card| card.suit }
        expect(hand.hand_cards_suit).to eq(expected_result)
      end
    end

    describe '#same_suit?' do
      it 'should return true if all suits are the same' do
        expect(hand.same_suit?).to be_truthy
      end
    end

    describe '#is_sequence?' do
      it 'should return true if cards are in sequence' do
        expect(hand.is_sequence?).to be_truthy
      end
    end
  end


  context do
    subject(:hand) { Hand.new }
    let(:card1) { double("card1", suit: :diamond, value: 10) }
    let(:card2) { double("card2", suit: :diamond, value: :jack) }
    let(:card3) { double("card3", suit: :diamond, value: :queen) }
    let(:card4) { double("card4", suit: :diamond, value: :king) }
    let(:card5) { double("card5", suit: :diamond, value: :ace) }

    before(:each) do
      cards = [card1, card2, card3, card4, card5]
      cards.each { |card| hand.add_card(card) }
    end

    describe '#royal_flush?' do
      it 'should return true if hand is a royal flush' do
        expect(hand.royal_flush?).to be_truthy
      end
    end

    describe '#straight_flush?' do
      it 'should return false if hand is a royal flush' do
        expect(hand.straight_flush?).to be_falsey
      end

      context 'not a royal flush' do
        let(:card5) { double("card5", suit: :diamond, value: 9) }

        it 'should return true if hand is a straight flush' do

          expect(hand.straight_flush?).to be_truthy
        end
      end
    end

    describe '#flush' do
      it 'should return false if it is a straight flush' do
        expect(hand.flush?).to be_falsey
      end

      context 'not a straight flush or royal flush' do
        let(:card5) { double("card5", suit: :diamond, value: 3) }

        it 'should return true if suits are the same' do
          expect(hand.flush?).to be_truthy
        
      end
    end
  end
end

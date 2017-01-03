require 'rspec'
require 'deck'
require 'byebug'

describe Deck do

  describe '#initialize' do
    context 'initialize takes in argument' do
      let(:card1) { double("card1", suit: :spade, value: :ace) }
      let(:card2) { double("card2", suit: :club, value: 10) }
      subject(:deck2) { Deck.new([card1, card2]) }
      it 'should assign arguments card array' do
        expect(deck2.cards).to eq([card1, card2])
      end
    end
    context 'does not take in any argument' do
      subject(:deck) { Deck.new }
      it 'sets cards to an empty array as default' do
        expect(deck.cards.is_a?(Array)).to be_truthy
      end
    end
  end

  describe '::build_deck' do
    subject(:deck) { Deck.build_deck }

    it 'creates Card objects' do
      expect(deck.cards.all? { |el| el.is_a?(Card) }).to be_truthy
    end

    it 'builds 52 cards' do
      expect(deck.cards.length).to eq(52)
    end

    it 'makes 13 cards of one suit' do
      random_suit = [:diamond, :heart, :club, :spade].sample
      suit_cards = deck.cards.select { |card| card.suit == random_suit }

      expect(suit_cards.length).to eq(13)
    end
  end

  describe '#shuffle' do
    subject(:deck) { Deck.build_deck }

    it 'shuffles cards' do
      first_card = [deck.cards.first.suit, deck.cards.first.value]
      deck.shuffle!
      second_card = [deck.cards.first.suit, deck.cards.first.value]

      expect(first_card).to_not eq(second_card)
    end
  end

  describe '#deal' do
    subject(:deck) { Deck.build_deck }
    let(:deck2) { Deck.new }

    it 'should return a card object' do
      expect(deck.deal.class).to eq(Card)
    end

    it 'should place card into dealt cards array' do
      expect(deck.deal).to eq(deck.dealt_cards.last)
    end

    it 'should return nil if cards is empty' do
      expect(deck2.deal).to eq(nil)
    end

    it 'should remove a card from main deck' do
      3.times { deck.deal }
      expect(deck.cards.length).to eq(49)
      expect(deck.dealt_cards.length).to eq(3)
    end
  end

  describe 'reset_deck' do
    subject(:deck) { Deck.build_deck }
    before(:each) { 3.times { deck.deal } }

    it 'should combine decks' do
      expect(deck.cards.length).to_not eq(52)
      deck.reset_deck
      expect(deck.cards.length).to eq(52)
    end

    it 'resets dealt cards' do
      deck.reset_deck
      expect(deck.cards.length).to eq(52)
      expect(deck.dealt_cards).to eq([])
    end
  end

end

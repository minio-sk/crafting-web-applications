require 'rspec'
require_relative '../lib/two_player_game'
require_relative '../lib/tic_tac_toe_board'
require_relative '../lib/console_listener'


RSpec.describe TwoPlayerGame do
  it 'ends with draw when board draw' do
    board = double(legal_move?: true, winning_move?: false, draw?: true)

    allow(board).to receive(:move)

    listener = double.as_null_object
    game = described_class.new(board, listener)

    game.move(1, 2)

    expect(listener).to have_received(:game_ended_with_draw)
  end

  it 'ends with win on winning move' do
    board = double(legal_move?: true, winning_move?: true)

    allow(board).to receive(:move)

    listener = double.as_null_object
    game = described_class.new(board, listener)

    game.move(1, 2)

    expect(listener).to have_received(:game_won).with(game, 'X')
  end

  it 'does not allow illegal moves' do
    board = double(legal_move?: false).as_null_object

    listener = double.as_null_object
    game = described_class.new(board, listener)

    game.move(1, 2)

    expect(listener).to have_received(:illegal_move_made).with(game)
  end

  it 'reports game change after move' do
    board = double(legal_move?: true, winning_move?: false, draw?: false)

    allow(board).to receive(:move)

    listener = double.as_null_object
    game = described_class.new(board, listener)
    game.move(1, 2)

    expect(listener).to have_received(:game_move_made).with(game)
  end

  it 'starts game' do
    board = double
    listener = double.as_null_object
    game = described_class.new(board, listener)
    game.start

    expect(listener).to have_received(:game_started).with(game)
  end
end

RSpec.describe TicTacToeBoard do
  it 'ends with draw when board full' do
    # XOX
    # OXO
    # XXO

    subject.move(1, 1, 'X')
    subject.move(2, 1, 'O')
    subject.move(3, 1, 'X')
    subject.move(1, 2, 'O')
    subject.move(2, 2, 'X')
    subject.move(3, 2, 'O')
    subject.move(1, 3, 'X')
    subject.move(3, 3, 'O')
    subject.move(2, 3, 'X')

    expect(subject).to be_draw
  end

  it 'ends with diagonal win' do
    # XOO
    #  X
    #   X

    subject.move(1, 1, 'X')
    subject.move(2, 1, 'O')
    subject.move(2, 2, 'X')
    subject.move(3, 1, 'O')
    subject.move(3, 3, 'X')

    expect(subject.winning_move?(3, 3, 'X')).to be_truthy
  end

  it 'ends with other diagonal win' do
    # OOX
    #  X
    # X

    subject.move(1, 3, 'X')
    subject.move(1, 1, 'O')
    subject.move(2, 2, 'X')
    subject.move(1, 2, 'O')
    subject.move(3, 1, 'X')

    expect(subject.winning_move?(3, 1, 'X')).to be_truthy
  end

  it 'ends with row win' do
    # XOO
    # X
    # X

    subject.move(1, 1, 'X')
    subject.move(2, 1, 'O')
    subject.move(1, 2, 'X')
    subject.move(3, 1, 'O')
    subject.move(1, 3, 'X')

    expect(subject.winning_move?(1, 3, 'X')).to be_truthy
  end

  it 'ends with row win' do
    # OOO
    # XX
    # X

    subject.move(1, 2, 'X')
    subject.move(1, 1, 'O')
    subject.move(2, 2, 'X')
    subject.move(2, 1, 'O')
    subject.move(1, 3, 'X')
    subject.move(3, 1, 'O')

    expect(subject.winning_move?(3, 1, 'O')).to be_truthy
  end

  it 'does not allow illegal move outside board' do
    expect(subject.legal_move?(0, 1)).to be_falsey
    expect(subject.legal_move?(1, 4)).to be_falsey
  end

  it 'does not allow illegal move to same position' do
    subject.move(2, 2, 'X')
    expect(subject.legal_move?(2, 2)).to be_falsey
  end
end

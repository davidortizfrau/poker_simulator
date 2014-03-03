require 'colorize'

module PokerHands
  
  def multiple(hand)
    f = hand.faces_array
    f.select do |face|
      case f.count(face)
      when 4
        puts "Four of #{face}s".yellow
        break
      when 3
        f.delete(face)
        full_house(f, face)
        break
      when 2
        f.delete(face)
        two_pair(f, face)
        break
      end
    end
  end

  def two_pair(array, face)
    array.select do |r_face|
      case array.count(r_face)
      when 2        
        puts "Two Pairs".red
        break
      else
        puts "Pair of #{face}s".blue
        break
      end
    end
  end

  def full_house(array, face)
    array.select do |r_face|
      case array.count(r_face)
      when 2        
        puts "Full House!".yellow
        break
      else
        puts "Three of a kind #{face}s".green
        break
      end
    end 
  end

  def flush(hand)
    f = hand.suits_array
    f.select do |suit|
      # puts "FLUUUUSH!!!".yellow if f.count(suit) == 5
      straight_flush if f.count(suit) == 5
      false if f.count(suit) != 5
      break
    end
  end

  def straight(hand)
    f = hand.values_array
    first  = f[4] - 4
    second = f[4] - 3
    third  = f[4] - 2
    fourth = f[4] - 1
    first_with_ace = f[4] + 9
    if first == f[0] && second == f[1] && third == f[2] && fourth == f[3]
      puts "Straight Ha ha ha ha...... ".yellow
      @straight = true
    elsif first_with_ace == f[0] && second == f[1] && third == f[2] && fourth == f[3]
      puts "Straight Ha ha ha ha...... ".yellow
      @straight = true 
    end 
  end

  def straight_flush
    if @straight == true
      puts "Boooooooyaa!!!! Straight Flush =)".yellow
    else
      puts "FLUUUUSH!!!".yellow
    end
  end

  def royal_flush
    # to be continued....
  end
end
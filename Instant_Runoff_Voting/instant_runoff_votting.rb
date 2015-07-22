def runoff(voters)
  n = voters.first.length
  while n > 0
    votes = Hash.new(0)

    voters.each do |list|
      votes[list.first] += 1
    end

    least = votes.values.min
    most = votes.values.max

    if most >= (voters.length.to_f / 2).ceil
      return votes.key(most)
    elsif votes.values.uniq.length == 1
      return nil
    else
      votes.each do |name, vote_count|
        if vote_count == least
          voters.each do |list|
            list.delete(name)
          end
          n -= 1
        end
      end
    end

  end
end

def runoff(voters)
  results = voters.map(&:first).reduce({}) { |t,v| t[v] = (t[v] || 0) + 1; t }
  most_votes, least_votes = results.values.max, results.values.min
  winners = results.select { |k,v| v == most_votes }.keys
  losers = results.select { |k,v| v == least_votes }.keys
  reduced_ballots = voters.map do |voter|
    voter.delete_if { |can| losers.include?(can) }
  end
  winners.length == 1 ? winners.first : runoff(reduced_ballots)
end

voters = [[:dem, :ind, :rep, :doo],
          [:rep, :ind, :dem, :doo],
          [:doo, :dem, :rep, :ind],
          [:ind, :dem, :rep, :doo],
          [:ind, :rep, :dem, :doo]]


puts runoff(voters)

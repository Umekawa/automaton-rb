require 'benchmark'

str  = 'a' * 100000 + 'x'

nodes = [
    [[1,'a']], # 0
    [[0,'ε'],[5,'ε']], # 1
    [[0,'ε'],[5,'ε']], # 2
    [[4,'b']], # 3
    [[8,'ε']], # 4
    [[3,'ε'],[8,'ε']], # 5
    [[7,'a']], # 6
    [[6,'ε']], # 7
    [[6,'ε']], # 8
]

accept_states = [7,8]

states = [2] # Start state
next_states = []

is_accept = false

num = 0

Benchmark.bm 1 do |r|
  r.report "Nantoka" do
    while states != [] && str.length >= num
      state = states.pop
      nodes[state].each do |node|
        if node[1] == 'ε'
          if (str.length) == num && accept_states.include?(state) 
            is_accept = true
            break
          end
          states.push(node[0])
        elsif node[1] == str[num]
          if (str.length) == (num + 1) && accept_states.include?(state) 
            is_accept = true
            break
          end
          next_states.push(node[0])
        end
      end
      if states == []
        states = next_states
        next_states = []
        num += 1
      end
    end
  end
end

puts is_accept ? "Accept" : "Reject"
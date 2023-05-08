# pip install automata-lib
# install graphviz

from automata.fa.nfa import NFA
from automata.fa.dfa import DFA
nfa = NFA.from_regex('a*b?a*', input_symbols={'a', 'b', 'x'})
dfa=DFA.from_nfa(nfa)
dfa.show_diagram("dfa.png")
nfa.show_diagram("nfa.png")
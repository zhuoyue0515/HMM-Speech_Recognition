x = [-.2, 2.6, 1.3];
pX = GaussD([b1, b2]).prob(x);
mc = MarkovChain([1; 0], [0.9 0.1 0; 0 0.9 0.1]);
[alfaHat, c] = mc.forward(pX);
betaHat = mc.backward(pX, c);
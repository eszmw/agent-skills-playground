function root = solveWithFzero(functionHandle, initialGuess)
%solveWithFzero Find a zero of a supplied function handle.

    root = fzero(functionHandle, initialGuess);
end
